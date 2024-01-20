use bitvec::prelude::*;
use fxhash;
use fxhash::FxBuildHasher;
use std::collections::{hash_map::Entry, HashMap};

use super::coefficient_list::CoefficientList;
use super::conjugation_look_up_tables::CNOT_CONJ_UPD_RULES;
use super::h_s_conjugations_map::HSConjugationsMap;
use super::pauli_string::PauliGate;
use super::GeneratorSet;
use crate::circuit::{Gate, GateType};
// use crate::FP_ERROR_MARGIN;

/// Each generator is stored as a tree. Each tree is identifiable
/// by a unqiue root node. The internal nodes of various tree can be shared.
pub struct PauliTrees {
    h_s_conjugations_map: HSConjugationsMap,
    coeff_lists: Vec<CoefficientList>,

    root_table: BitVec,
    // Each node consits of 2 + 2 * pgates_per_node bits.
    // The first bit indicates wheter the location in the table is taken or not.
    // The second bit iindicates wheter the node is a leaf or not.
    // These bits are referred to as the "book keeping" bits of the node.
    // The following 2 * pgates_per_node bits are the gates of the node
    // or the index of the child node in the case of a leaf/non-leaf respectively.
    // These are referred to as the "body" bits of the node.
    node_table: BitVec,
    n_nodes_stored: usize,
    gargabe_collection_threshold: usize,

    pgates_per_node: usize,
    n_qubits: usize,
    
}

impl PauliTrees {
    pub fn new(n_qubits: usize, n_threads: usize) -> Self {
        if n_threads > 1 {
            eprintln!("WARNING: PauliTrees does not support parallelism. Ignoring n_threads.");
        }

        let mut p = PauliTrees {
            h_s_conjugations_map: HSConjugationsMap::new(n_qubits),
            coeff_lists: Vec::new(),

            root_table: BitVec::new(),
            node_table: BitVec::new(),
            n_nodes_stored: 0,
            gargabe_collection_threshold: 0,

            // TODO make this adaptive?
            pgates_per_node: 8,
            n_qubits,
        };

        // If 80 procent of the node table is full we start garbage collection
        p.gargabe_collection_threshold = (0.8 * (p.max_storable_nodes() as f64)) as usize;
        p.node_table = bitvec![0; p.num_bits_for_nodes()];
        p
    }

    /// Calculate the number of bits needed to allocate if we want to store
    /// `p_gates_per_node` gates per node.  
    fn num_bits_for_nodes(&self) -> usize {
        self.max_storable_nodes() * self.bits_per_node()
    }

    fn max_storable_nodes(&self) -> usize {
        1 << self.pgates_per_node
    }

    fn bits_per_node(&self) -> usize {
        self.n_book_keeping_bits() + self.n_body_bits()
    }

    /// Used to clarify code
    fn n_book_keeping_bits(&self) -> usize {
        2
    }

    fn n_body_bits(&self) -> usize {
        self.pgates_per_node * 2
    }

    /// Returns the index of the node in the table, determined by its body.
    // TODO: rename?
    fn node_index(&self, node_body: &BitSlice) -> usize {
        (fxhash::hash64(&node_body) as usize) % self.max_storable_nodes()
    }

    /// Given the body of a node, insert it as a full node in the table and return
    /// its index
    fn insert_node_body(&mut self, body: &BitSlice, leaf: bool) -> usize {
        // TODO
        if body.len() != 2 * self.pgates_per_node {
            panic!("Failed inserting node due to a mismatch in the number of bits.");
        }

        if self.n_nodes_stored >= self.max_storable_nodes() {
            self.garbage_collection();
        }

        let mut index = self.node_index(body);

        // Linear probing: find the first availiable empty spot or the node itself
        while self.table_entry_taken(index) {
            // This node is stored already in the table
            if (body == self.get_node_body(index)) && (leaf == self.is_leaf(index)) {
                return index;
            }
            index = (index + 1) % self.max_storable_nodes();
        }

        // Insert the node
        self.mark_table_entry_as_taken(index);
        self.set_leaf_indicator_bit(index, leaf);
        self.copy_node_body_to_table(index, body);
        self.n_nodes_stored += 1;

        index
    }

    /// Return a reference to the body of the node at `node_index`.
    fn get_node_body(&self, node_index: usize) -> &BitSlice {
        let bpn = self.bits_per_node();
        &self.node_table[node_index * bpn + self.n_book_keeping_bits()..(node_index + 1) * bpn]
    }

    fn copy_node_body_to_table(&mut self, node_index: usize, body: &BitSlice) {
        let bpn = self.bits_per_node();
        let bkbts = self.n_book_keeping_bits();
        for (i, b) in body.iter().enumerate() {
            self.node_table.set(node_index * bpn + bkbts + i, *b);
        }
    }

    /// Returns if the node at `node_index` is a leaf node.
    fn is_leaf(&self, node_index: usize) -> bool {
        self.node_table[node_index * self.bits_per_node() + 1]
    }

    /// Marks the node at `node_index` as a leaf/non-leaf.
    fn set_leaf_indicator_bit(&mut self, node_index: usize, leaf: bool) {
        let bpn = self.bits_per_node();
        self.node_table.set(node_index * bpn + 1, leaf);
    }

    /// Returns if the node at `node_index` is taken.
    fn table_entry_taken(&self, node_index: usize) -> bool {
        self.node_table[node_index * self.bits_per_node()]
    }

    /// Marks the node at `node_index` as taken.
    fn mark_table_entry_as_taken(&mut self, node_index: usize) {
        let bpn = self.bits_per_node();
        self.node_table.set(node_index * bpn, true);
    }

    fn n_pad_bits(&self) -> usize {
        if self.n_qubits % self.pgates_per_node == 0 {
            return 0;
        }
        2 * (self.pgates_per_node - (self.n_qubits % self.pgates_per_node))
    }

    fn insert_pstr(&mut self, mut pstr: BitVec, c_list: CoefficientList) {
        // TODO
        assert_eq!(pstr.len(), 2 * self.n_qubits);

        // To ensure that recursive insert works nicely, we pad the bitvec with zeros.
        // pstr is padded such that pstr.len() / 2 is a multiple of pgates_per_node.
        pstr.resize(pstr.len() + self.n_pad_bits(), false);

        let node_index = self.recursive_insert_pstr(&pstr);
        let root_node = self.index_to_bitvec(node_index);
        self.root_table.extend_from_bitslice(&root_node);
        self.coeff_lists.push(c_list);
    }

    /// If the Pauli string contains more than `self.pgates_per_node` gates,
    /// we split the string and recursively insert the two halves.
    fn recursive_insert_pstr(&mut self, pstr: &BitSlice) -> usize {
        // TODO sanity check, remove later
        assert_eq!((pstr.len() / 2) % self.pgates_per_node, 0);

        // We save `self.pgates_per_node` gates per node.
        // Since each gate is represented by 2 bits, we need to divide the length of the bitvec by 2 and
        // then divide by `self.pgates_per_node` to get the number of leaf nodes we need to insert.
        let n_leafs = pstr.len() / 2 as usize / self.pgates_per_node;

        if n_leafs == 1 {
            return self.insert_node_body(pstr, true);
        }

        // We create a new body of a node that points to the two halves of the
        // Pauli string (or nodes pointing to them) and insert it into the table.

        let bits_per_half = (n_leafs / 2) * (self.pgates_per_node * 2);

        let l_index = self.recursive_insert_pstr(&pstr[..bits_per_half]);
        let r_index = self.recursive_insert_pstr(&pstr[bits_per_half..]);

        let body = self.indices_to_body(l_index, r_index);

        let new_node_index = self.insert_node_body(&body, false);


        if new_node_index == l_index || new_node_index == r_index {
            println!("1. {:?}", body);
            println!("2. {:?}", &pstr[bits_per_half..]);
            panic!("-> A loop was introduced {} {} {}", new_node_index, l_index, r_index);  
        }
        new_node_index
    }

    // Converts two indices into a body of a non-leaf node
    // IMPORTANT: the indices are assumed to fit in `self.pgates_per_node`.
    // If not, only the first log2(self.pgates_per_node) bits will be used.
    // Note: deliberately does not call index_to_bitvec to prevent unnecessary allocations.
    fn indices_to_body(&self, l_index: usize, r_index: usize) -> BitVec {
        let mut body = bitvec![0; self.n_body_bits()];

        for i in 0..self.pgates_per_node {
            // Write MSB first
            body.set(i, Self::get_bit(l_index, self.pgates_per_node - i - 1));
            body.set(
                i + self.pgates_per_node,
                Self::get_bit(r_index, self.pgates_per_node - i - 1),
            );
        }

        body
    }

    // IMPORTANT: the indices are assumed to fit in `self.pgates_per_node`.
    // If not, only the first log2(self.pgates_per_node) bits will be used.
    fn index_to_bitvec(&self, index: usize) -> BitVec {
        let mut b = bitvec![0; self.pgates_per_node];
        for i in 0..b.len() {
            b.set(i, Self::get_bit(index, self.pgates_per_node - i - 1));
        }
        b
    }

    /// Return the ith bit of n
    fn get_bit(n: usize, i: usize) -> bool {
        (n >> i) & 1 == 1
    }

    /// Convert a blitvec of length <= usize::MAX to a usize
    fn bitslice_to_usize(slice: &BitSlice) -> usize {
        let n_bits_usize = std::mem::size_of::<usize>() * 8;
        if slice.len() > n_bits_usize {
            panic!("Cannot convert bitvec to usize: too many bits.");
        }
        slice
            .iter()
            .rev()
            .enumerate()
            .fold(0, |acc, (i, b)| acc + (*b as usize) * (1 << i))
    }

    /// Return the index of the root node of the ith Pauli string
    fn root_node_index(&self, i: usize) -> usize {
        let bs = &self.root_table[i * self.pgates_per_node..(i + 1) * self.pgates_per_node];
        Self::bitslice_to_usize(bs)
    }

    /// Update the index of the root note of the `pstr_index` Pauli string
    fn update_root_node_index(&mut self, pstr_index: usize, new_index: usize) {
        let bv = self.index_to_bitvec(new_index);
        for (i, b) in bv.iter().enumerate() {
            self.root_table
                .set(pstr_index * self.pgates_per_node + i, *b);
        }
    }

    /// Return the string representation of a bitvec of Pauli gates, i.e., Pauli string
    fn pstr_bitslice_as_str(slice: &BitSlice) -> String {
        let mut s = String::with_capacity(slice.len() / 2);
        for i in 0..slice.len() / 2 {
            let gate = PauliGate::pauli_gate_from_tuple(slice[2 * i], slice[2 * i + 1]);
            s.push_str(&format!("{}", gate));
        }
        s
    }

    fn index_from_node_body(&self, node_body: &BitSlice, left_index: bool) -> usize {
        if left_index {
            Self::bitslice_to_usize(&node_body[..self.pgates_per_node])
        } else {
            Self::bitslice_to_usize(&node_body[self.pgates_per_node..])
        }
    }

    /// Return the ith stored Pauli string as a string
    fn pstr_as_str(&self, i: usize) -> String {
        Self::pstr_bitslice_as_str(&self.pstr_as_bitvec(i))
    }

    /// Return the ith stored Pauli string as a bitvec
    fn pstr_as_bitvec(&self, i: usize) -> BitVec {
        if i > self.size() {
            panic!("Cannot retrieve Pauli string {}: Index out of bounds.", i);
        }

        let mut pstr = BitVec::with_capacity(2 * self.n_qubits);

        let root_index = self.root_node_index(i);
        self.recursive_pstr_as_bitvec(root_index, &mut pstr);

        // Omit potential padding
        pstr[..2 * self.n_qubits].to_bitvec()
    }

    fn recursive_pstr_as_bitvec(&self, node_index: usize, pstr: &mut BitVec) {
        let body = self.get_node_body(node_index);

        if self.is_leaf(node_index) {
            pstr.extend_from_bitslice(body);
            return;
        }

        let l_index = self.index_from_node_body(body, true);
        let r_index = self.index_from_node_body(body, false);

        self.recursive_pstr_as_bitvec(l_index, pstr);
        self.recursive_pstr_as_bitvec(r_index, pstr);
    }

    // TODO refactor this with set pgate
    fn get_pgate(&self, pstr_index: usize, gate_index: usize) -> PauliGate {
        if pstr_index > self.size() || gate_index >= self.n_qubits {
            panic!("Pauli string or gate index out of bounds.");
        }

        let pgates_per_pstr = self.n_qubits + (self.n_pad_bits() / 2);
        let n_leaf_nodes = pgates_per_pstr / self.pgates_per_node;

        let root_index = self.root_node_index(pstr_index);
        self.recursive_get_pgate(root_index, gate_index, n_leaf_nodes)
    }

    fn recursive_get_pgate(
        &self,
        node_index: usize,
        relative_gate_index: usize,
        n_leaf_nodes: usize,
    ) -> PauliGate {
        let body = self.get_node_body(node_index);

        if self.is_leaf(node_index) {
            let b1 = body[2 * relative_gate_index];
            let b2 = body[2 * relative_gate_index + 1];
            return PauliGate::pauli_gate_from_tuple(b1, b2);
        }

        let left_index = self.index_from_node_body(body, true);
        let right_index = self.index_from_node_body(body, false);

        let n_leaf_nodes_left = n_leaf_nodes / 2;
        let n_leaf_nodes_right = n_leaf_nodes - (n_leaf_nodes / 2);

        // Recurse on the left/left node and update their index
        if relative_gate_index < (n_leaf_nodes_left * self.pgates_per_node) {
            return self.recursive_get_pgate(left_index, relative_gate_index, n_leaf_nodes_left);
        } else {
            // Prevent subtraction with overflow
            if relative_gate_index < self.pgates_per_node {
                panic!("Failed getting Pauli gate: We should have found a leaf by now.");
            }

            let new_relative_gate_index =
                relative_gate_index - (n_leaf_nodes_left * self.pgates_per_node);
            return self.recursive_get_pgate(
                right_index,
                new_relative_gate_index,
                n_leaf_nodes_right,
            );
        }
    }

    fn set_pgate(&mut self, pstr_index: usize, gate_index: usize, pgate: PauliGate) {
        if pstr_index > self.size() || gate_index >= self.n_qubits {
            panic!("Pauli string or gate index out of bounds.");
        }

        // We might save more Pauli gates per Pauli string due to the padding
        let pgates_per_pstr = self.n_qubits + (self.n_pad_bits() / 2);
        let n_leaf_nodes = pgates_per_pstr / self.pgates_per_node;

        let root_index = self.root_node_index(pstr_index);
        let new_root_index = self.recursive_set_pgate(root_index, gate_index, n_leaf_nodes, &pgate);
        self.update_root_node_index(pstr_index, new_root_index)
    }

    fn recursive_set_pgate(
        &mut self,
        node_index: usize,
        relative_gate_index: usize,
        n_leaf_nodes: usize,
        pgate: &PauliGate,
    ) -> usize {
        if self.is_leaf(node_index) {
            let body = self.get_node_body(node_index).clone();
            let mut new_body = BitVec::from_bitslice(body);

            let (b1, b2) = PauliGate::pauli_gate_as_tuple(*pgate);

            new_body.set(2 * relative_gate_index, b1);
            new_body.set(2 * relative_gate_index + 1, b2);

            return self.insert_node_body(&new_body, true);
        }

        let body = self.get_node_body(node_index);

        let mut left_index = self.index_from_node_body(body, true);
        let mut right_index = self.index_from_node_body(body, false);

        let n_leaf_nodes_left = n_leaf_nodes / 2;
        let n_leaf_nodes_right = n_leaf_nodes - (n_leaf_nodes / 2);

        // Recurse on the left/left node and update their index
        if relative_gate_index < (n_leaf_nodes_left * self.pgates_per_node) {
            left_index =
                self.recursive_set_pgate(left_index, relative_gate_index, n_leaf_nodes_left, pgate);
        } else {
            if relative_gate_index < self.pgates_per_node {
                panic!("Failed setting Pauli gate: We should have found a leaf by now.");
            }

            let new_relative_gate_index =
                relative_gate_index - (n_leaf_nodes_left * self.pgates_per_node);
            right_index = self.recursive_set_pgate(
                right_index,
                new_relative_gate_index,
                n_leaf_nodes_right,
                pgate,
            );
        }

        let new_node_body = self.indices_to_body(left_index, right_index);
        let new_node_index = self.insert_node_body(&new_node_body, false);

        // TODO
        if new_node_index == left_index || new_node_index == right_index {
            panic!("A loop was introduced");
        }

        new_node_index
    }

    fn get_actual_p_gate_and_coef_mul(
        &self,
        pstr_index: usize,
        gate_index: usize,
    ) -> (PauliGate, f64) {
        let curr_pgate = self.get_pgate(pstr_index, gate_index);

        let actual_pgate = self
            .h_s_conjugations_map
            .get_actual_p_gate(gate_index, curr_pgate);

        let coef_mult = self
            .h_s_conjugations_map
            .get_coefficient_multiplier(gate_index, curr_pgate);
        (actual_pgate, coef_mult)
    }

    fn conjugate_cnot(&mut self, gate: &Gate) {
        let qubit_2 = gate.qubit_2.unwrap();

        for pstr_index in 0..self.size() {
            let (q1_actual_pgate, q1_coef_mul) =
                self.get_actual_p_gate_and_coef_mul(pstr_index, gate.qubit_1);
            let (q2_actual_pgate, q2_coef_mul) =
                self.get_actual_p_gate_and_coef_mul(pstr_index, qubit_2);

            let look_up_output = CNOT_CONJ_UPD_RULES
                .get(&(q1_actual_pgate, q2_actual_pgate))
                .unwrap();

            self.coeff_lists[pstr_index]
                .multiply(look_up_output.coefficient * q1_coef_mul * q2_coef_mul);

            self.set_pgate(pstr_index, gate.qubit_1, look_up_output.q1_p_gate);
            self.set_pgate(pstr_index, qubit_2, look_up_output.q2_p_gate);
        }

        self.h_s_conjugations_map.reset(gate.qubit_1);
        self.h_s_conjugations_map.reset(qubit_2);
    }

    fn conjugate_rz(&mut self, gate: &Gate, conjugate_dagger: bool) {


        for pstr_index in 0..self.size() {
            let (actual_pgate, coef_mul) =
                self.get_actual_p_gate_and_coef_mul(pstr_index, gate.qubit_1);

            // Apply the H/S conjugations
            self.coeff_lists[pstr_index].multiply(coef_mul);
            self.set_pgate(pstr_index, gate.qubit_1, actual_pgate);

            if actual_pgate == PauliGate::Z || actual_pgate == PauliGate::I {
                continue;
            }

            self.root_table.extend_from_within(
                pstr_index * self.pgates_per_node..(pstr_index + 1) * self.pgates_per_node,
            );

            self.coeff_lists
                .push(self.coeff_lists[pstr_index].clone());

            if actual_pgate == PauliGate::X {
                self.set_pgate(self.size() - 1, gate.qubit_1, PauliGate::Y);
            } else if actual_pgate == PauliGate::Y {
                self.set_pgate(self.size() - 1, gate.qubit_1, PauliGate::X);
            }

            match (actual_pgate, conjugate_dagger) {
                (PauliGate::X, false) => {
                    self.coeff_lists[pstr_index].multiply(gate.angle.unwrap().cos());
                    self.coeff_lists
                        .last_mut()
                        .unwrap()
                        .multiply(gate.angle.unwrap().sin());
                }
                (PauliGate::Y, false) => {
                    self.coeff_lists[pstr_index].multiply(gate.angle.unwrap().cos());
                    self.coeff_lists
                        .last_mut()
                        .unwrap()
                        .multiply(-1.0 * gate.angle.unwrap().sin());
                }
                (PauliGate::X, true) => {
                    self.coeff_lists[pstr_index].multiply(gate.angle.unwrap().cos());
                    self.coeff_lists
                        .last_mut()
                        .unwrap()
                        .multiply(-1.0 * gate.angle.unwrap().sin());
                }
                (PauliGate::Y, true) => {
                    self.coeff_lists[pstr_index].multiply(gate.angle.unwrap().cos());
                    self.coeff_lists
                        .last_mut()
                        .unwrap()
                        .multiply(gate.angle.unwrap().sin());
                }
                _ => {
                    unreachable!()
                }
            }
        }
        self.h_s_conjugations_map.reset(gate.qubit_1);
    }


    fn garbage_collection(&mut self) {
        let mut new_node_table = bitvec![0; self.num_bits_for_nodes()];

        let prev_n_nodes = self.n_nodes_stored;

        self.n_nodes_stored = 0;

        for pstr_index in 0..self.size() {
            let root_index = self.root_node_index(pstr_index);
            self.recursive_garbage_collection(root_index, &mut new_node_table);
        }

        self.node_table = new_node_table;

        if prev_n_nodes == self.n_nodes_stored {
            panic!("Garbage collection failed to free up space: node table is full.");
        }
        println!("Garbage collection: {} -> {}", prev_n_nodes, self.n_nodes_stored);
    }

    fn recursive_garbage_collection(&mut self, node_index: usize, new_node_table: &mut BitSlice) {
        let body = self.get_node_body(node_index);

        if !self.is_leaf(node_index) {
            let left_index = self.index_from_node_body(body, true);
            let right_index = self.index_from_node_body(body, false);
            println!("Recurse! {} -> {} {} ", node_index, left_index, right_index);

            self.recursive_garbage_collection(left_index, new_node_table);
            self.recursive_garbage_collection(right_index, new_node_table);
        } {
            println!("Insert! {} ", node_index);
        }


        // Copy bits to the new node table
        for i in node_index*self.bits_per_node()..(node_index+1)*self.bits_per_node() {
            new_node_table.set(i, self.node_table[i]);
        }
        self.n_nodes_stored += 1;
    }


}

impl GeneratorSet for PauliTrees {
    fn init_generators(&mut self, zero_state_generators: bool) {
        let p_gate = if zero_state_generators {
            PauliGate::Z
        } else {
            PauliGate::X
        };

        let (b1, b2) = PauliGate::pauli_gate_as_tuple(p_gate);
        for generator_index in 0..self.n_qubits {
            // TODO use only one bitvec
            let mut pstr = bitvec![0; 2 * self.n_qubits];
            pstr.set(2 * generator_index, b1);
            pstr.set(2 * generator_index + 1, b2);

            let c_list = CoefficientList::new(generator_index);

            self.insert_pstr(pstr, c_list)
        }
    }

    fn init_single_generator(&mut self, _i: usize, _zero_state_generator: bool) {
        unimplemented!()
    }

    fn is_x_or_z_generators(&mut self, _check_zero_state: bool) -> bool {
        unimplemented!()
    }

    fn is_single_x_or_z_generator(&mut self, _check_zero_state: bool, _i: usize) -> bool {
        unimplemented!()
    }

    fn conjugate(&mut self, gate: &Gate, conjugate_dagger: bool) {

        if self.n_nodes_stored > self.gargabe_collection_threshold {
            println!("Garbage collection triggered");
            self.garbage_collection();
        }

        match gate.gate_type {
            GateType::H | GateType::S => {
                self.h_s_conjugations_map.update(gate, conjugate_dagger);
            }
            GateType::CNOT => self.conjugate_cnot(gate),
            GateType::Rz => self.conjugate_rz(gate, conjugate_dagger),
            _ => {
                panic!("Can only conjugate a H, S, CNOT, or Rz gate")
            }
        }
    }

    fn measure(&mut self, _i: usize) -> (bool, f64) {
        unimplemented!()
    }

    fn clean(&mut self) {

        // Map from root index to Pauli string index
        let mut m = HashMap::<usize, CoefficientList, FxBuildHasher>::with_capacity_and_hasher(
            self.size(),
            FxBuildHasher::default(),
        );

        // Gather all unique Pauli strings
        for pstr_index in 0..self.size() {
            let root_index = self.root_node_index(pstr_index);
            match m.entry(root_index) {
                Entry::Occupied(mut e) => {
                    e.get_mut().merge(&self.coeff_lists[pstr_index].clone());
                }
                Entry::Vacant(e) => {
                    e.insert(self.coeff_lists[pstr_index].clone());
                }
            }
        }

        // Scatter all unique Pauli strings
        self.root_table.clear();
        self.coeff_lists.clear();

        for (root_index, c_list) in m.iter_mut() {
            if c_list.is_empty() {
                continue;
            }

            let root_node = self.index_to_bitvec(*root_index);
            self.root_table.extend_from_bitslice(&root_node);
            self.coeff_lists.push(c_list.clone());
        }

    }

    fn size(&self) -> usize {
        self.root_table.len() / self.pgates_per_node
    }
}

impl std::fmt::Display for PauliTrees {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        let mut s = String::new();

        for pstr_index in 0..self.size() {
            let mut coef_multiplier = 1.0;
            let pstr = self.pstr_as_str(pstr_index);

            for (i, pgate) in pstr.chars().enumerate() {
                let current_pgate = PauliGate::char_to_pauli_gate(&pgate).unwrap();

                let actual_pgate = self
                    .h_s_conjugations_map
                    .get_actual_p_gate(i, current_pgate);

                coef_multiplier *= self
                    .h_s_conjugations_map
                    .get_coefficient_multiplier(i, current_pgate);

                s.push_str(&format!("{}", actual_pgate));
            }

            s.push_str(" (");

            for c in self.coeff_lists[pstr_index].coefficients.iter() {
                s.push_str(&format!("{}: {}, ", c.0, c.1 * coef_multiplier));
            }
            s.push_str(")\n");
        }

        write!(f, "{}", s)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_insert_node() {
        let mut pauli_trees = PauliTrees::new(30, 1);
        let node = bitvec![1; 2*pauli_trees.pgates_per_node];

        let index_1 = pauli_trees.insert_node_body(&node, true);

        // First node we insert, index should equal its index without probing
        assert_eq!(index_1, pauli_trees.node_index(&node));
        // Node shold be in the table
        assert_eq!(
            pauli_trees.node_table[index_1 * pauli_trees.bits_per_node()
                + pauli_trees.n_book_keeping_bits()
                ..(index_1 + 1) * pauli_trees.bits_per_node()],
            node
        );
        // And is a leaf
        assert_eq!(pauli_trees.is_leaf(index_1), true);

        let index_2 = pauli_trees.insert_node_body(&node, false);

        // Should be inserted one spot later
        assert_eq!(index_2, pauli_trees.node_index(&node) + 1);

        for (i, b) in pauli_trees.node_table.iter().enumerate() {
            // All these bits should be one, except the leaf indicator bit of the second node
            if (i >= index_1 * pauli_trees.bits_per_node()
                && i < (index_2 + 1) * pauli_trees.bits_per_node())
                && i != index_2 * pauli_trees.bits_per_node() + 1
            {
                assert_eq!(*b, true);
            } else {
                assert_eq!(*b, false);
            }
        }
    }

    #[test]
    fn get_pstr_as_str() {
        let set_bits = [false, false, true, false, true, true, false, true];
        let n_qubits = 18;
        let mut pauli_trees = PauliTrees::new(n_qubits, 1);
        let mut pstr = bitvec![0; 2 * n_qubits];

        for (i, b) in set_bits.iter().enumerate() {
            pstr.set(i, *b);
        }

        let c_list = CoefficientList::new(0);

        pauli_trees.insert_pstr(pstr, c_list);

        assert_eq!(pauli_trees.size(), 1);

        let pstr_as_bitvec = pauli_trees.pstr_as_bitvec(0);

        for (i, b) in set_bits.iter().enumerate() {
            assert_eq!(pstr_as_bitvec[i], *b);
        }

        for b in pstr_as_bitvec.iter().skip(set_bits.len()) {
            assert_eq!(*b, false);
        }
    }

    #[test]
    fn alter_pstr() {
        let n_qubits = 18;
        let mut pauli_trees = PauliTrees::new(n_qubits, 1);
        let pstr = bitvec![0; 2 * n_qubits];

        let c_list = CoefficientList::new(0);

        pauli_trees.insert_pstr(pstr, c_list);

        let pgate_y = PauliGate::Y;
        let pgate_i = PauliGate::I;

        pauli_trees.set_pgate(0, 0, pgate_y);
        pauli_trees.set_pgate(0, 8, pgate_i);
        pauli_trees.set_pgate(0, 17, pgate_y);

        let pstr_as_bitvec = pauli_trees.pstr_as_bitvec(0);

        assert_eq!(pstr_as_bitvec[0], true);
        assert_eq!(pstr_as_bitvec[1], true);
        assert_eq!(pstr_as_bitvec[16], false);
        assert_eq!(pstr_as_bitvec[17], false);
        assert_eq!(pstr_as_bitvec[34], true);
        assert_eq!(pstr_as_bitvec[35], true);
    }
}
