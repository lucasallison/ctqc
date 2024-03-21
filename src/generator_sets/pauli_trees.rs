use std::collections::{hash_map::Entry, HashMap};

use bitvec::prelude::*;
use fxhash;
use fxhash::FxBuildHasher;

use super::shared::coefficient_list::CoefficientList;
use super::shared::conjugation_look_up_tables::CNOT_CONJ_UPD_RULES;
use super::shared::errors::GenertorSetError;
use super::shared::h_s_conjugations_map::HSConjugationsMap;
use super::GeneratorSet;

use crate::circuit::{Gate, GateType};
use crate::pauli_string::utils as PauliUtils;
use crate::pauli_string::PauliGate;

/// Each generator is stored as a tree. Each tree is identifiable
/// by a unqiue root node. The internal nodes of various tree can be shared.
pub struct PauliTrees {
    h_s_conjugations_map: HSConjugationsMap,
    coeff_lists: Vec<CoefficientList>,

    root_node_table: BitVec,

    // Each node consits of 2 + 2 * pgates_per_node bits.
    // The first bit indicates wheter the location in the table is taken or not.
    // The second bit indicates wheter the node is pointing to leaf or not.
    // These bits are referred to as the "book keeping" bits of the node.
    // The following `n_node_body_bits` bits are the index of the child node.
    // These are referred to as the "body" bits of the node.
    node_table: BitVec,
    leaf_table: BitVec,

    n_node_body_bits: usize,
    pgates_per_leaf: usize,
    depth: usize,

    n_nodes_stored: usize,
    n_leafs_stored: usize,
    gargabe_collection_threshold: usize,

    n_qubits: usize,
}

impl PauliTrees {
    pub fn new(
        n_qubits: usize,
        n_threads: usize,
        n_node_body_bits: Option<usize>,
        pgates_per_leaf: Option<usize>,
    ) -> Self {
        if n_threads > 1 {
            eprintln!("WARNING: PauliTrees does not support parallelism. Ignoring n_threads.");
        }

        let mut p = PauliTrees {
            h_s_conjugations_map: HSConjugationsMap::new(n_qubits),
            coeff_lists: Vec::new(),

            root_node_table: BitVec::new(),
            node_table: BitVec::new(),
            leaf_table: BitVec::new(),

            // TODO make the default values depend on the number of qubits
            n_node_body_bits: n_node_body_bits.unwrap_or(64),
            pgates_per_leaf: pgates_per_leaf.unwrap_or(4),
            depth: 0,

            n_nodes_stored: 0,
            n_leafs_stored: 0,

            gargabe_collection_threshold: 0,

            n_qubits,
        };

        // If 80 procent of the node table is full we start garbage collection
        p.gargabe_collection_threshold = (0.8 * (p.max_storable_nodes() as f64)) as usize;
        p.node_table = bitvec![0; p.n_bits_for_node_table()];
        p.leaf_table = bitvec![0; p.n_bits_for_leaf_table()];

        // Explicitly store so we don't have to recalculate it
        p.depth = p.tree_depth();

        if p.n_node_body_bits % 2 != 0 {
            panic!("n_node_body_bits must be even.");
        }

        p
    }

    // ---- Root node storage information ---- //

    fn n_bits_per_root_node(&self) -> usize {
        self.n_node_body_bits / 2
    }

    // ---- Node storage information ---- //

    fn n_bits_for_node_table(&self) -> usize {
        self.max_storable_nodes() * self.bits_per_node()
    }

    fn bits_per_node(&self) -> usize {
        self.n_node_book_keeping_bits() + self.n_node_body_bits
    }

    fn n_node_book_keeping_bits(&self) -> usize {
        // 1 bit for the leaf indicator bit
        // and 1 bit for the table entry taken bit
        2
    }

    fn max_storable_nodes(&self) -> usize {
        1 << (self.n_node_body_bits / 2)
    }

    /// Returns the maximum number of nodes needed at most to store a Pauli string
    fn max_nodes_stored_per_pstr(&self) -> usize {
        (2 << self.depth) - 1
    }

    // ---- Node helper functions ---- //

    /// Return a reference to the body of the node at `node_index`.
    fn get_node_body(&self, node_index: usize) -> &BitSlice {
        let bpn = self.bits_per_node();
        &self.node_table[node_index * bpn + self.n_node_book_keeping_bits()..(node_index + 1) * bpn]
    }

    /// Returns if the node at `node_index` is a has the index of
    /// a leaf stored in its body.
    fn node_points_to_leaf(&self, node_index: usize) -> bool {
        self.node_table[node_index * self.bits_per_node() + 1]
    }

    fn copy_node_body_to_table(&mut self, node_index: usize, body: &BitSlice) {
        let bpn = self.bits_per_node();
        let bkbts = self.n_node_book_keeping_bits();
        for (i, b) in body.iter().enumerate() {
            self.node_table.set(node_index * bpn + bkbts + i, *b);
        }
    }

    /// Marks the node at `node_index` as a leaf/non-leaf.
    fn set_leaf_indicator_bit(&mut self, node_index: usize, leaf: bool) {
        let bpn = self.bits_per_node();
        self.node_table.set(node_index * bpn + 1, leaf);
    }

    // ---- Node insertion functions ---- //

    // TODO Refacter inserting into node/leaf table into a single function?
    fn insert_node_into_table(&mut self, body: &BitSlice, leaf_bit: bool) -> usize {
        if body.len() != self.n_node_body_bits {
            panic!("Trying to insert a node with an invalid body size.");
        }

        let mut index = self.bits_to_index(body, self.max_storable_nodes() - 1);
        let start_index = index;

        // Linear probing: find the first availiable empty spot or the node itself
        while self.table_entry_taken(index, false) {
            // This node is stored already in the table
            if (body == self.get_node_body(index)) && (leaf_bit == self.node_points_to_leaf(index))
            {
                return index;
            }
            index = (index + 1) % self.max_storable_nodes();

            if index == start_index {
                println!("{} {}", self.max_storable_nodes(), self.n_nodes_stored);
                panic!(
                    "Failed inserting node: table is full. A resize should have been performed."
                );
            }
        }

        // Insert the node
        self.mark_table_entry_as_taken(index, false);
        self.set_leaf_indicator_bit(index, leaf_bit);
        self.copy_node_body_to_table(index, body);
        self.n_nodes_stored += 1;

        index
    }

    // ---- Leaf storage information ---- //

    fn n_bits_for_leaf_table(&self) -> usize {
        self.max_storable_leafs() * (self.pgates_per_leaf * 2 + 1)
    }

    fn bits_per_leaf(&self) -> usize {
        // Each gate takes 2 bits plus one bit
        // to indicate wheter the spot is taken
        self.pgates_per_leaf * 2 + 1
    }

    fn max_storable_leafs(&self) -> usize {
        // Its possible to store more leafs
        1 << (self.n_node_body_bits / 2)
    }

    /// Returns the maximum number of leafs needed at most to store a Pauli string
    fn max_leafs_stored_per_pstr(&self) -> usize {
        (self.n_qubits + (self.n_pad_bits() / 2)) / self.pgates_per_leaf
    }

    // ---- Leaf helper functions ---- //

    /// Return a reference to the Pauli gates stored in the leaf
    /// at `leaf_index`.
    fn get_leaf_pgates_bits(&self, leaf_index: usize) -> &BitSlice {
        let bpl = self.bits_per_leaf();
        &self.leaf_table[leaf_index * bpl + 1..(leaf_index + 1) * bpl]
    }

    /// Copy the Pauli gates stored in the bitslice as a leaf in the leaf table.
    fn copy_pgates_to_leaf_table(&mut self, leaf_index: usize, pgates: &BitSlice) {
        let bpl = self.bits_per_leaf();
        for (i, b) in pgates.iter().enumerate() {
            self.leaf_table.set(leaf_index * bpl + 1 + i, *b);
        }
    }

    fn get_ith_pgate_from_leaf(&self, leaf_index: usize, i: usize) -> PauliGate {
        let pgates = self.get_leaf_pgates_bits(leaf_index);
        PauliUtils::pauli_gate_from_tuple(pgates[2 * i], pgates[2 * i + 1])
    }

    // ---- Leaf insertion functions ---- //

    /// Insert a leaf into the leaf table and return its index.
    fn insert_leaf_into_table(&mut self, pgates: &BitSlice) -> usize {
        if pgates.len() != self.pgates_per_leaf * 2 {
            panic!("Trying to insert a leaf with an invalid number of Pauli gates.");
        }

        let mut index = self.bits_to_index(pgates, self.max_storable_leafs() - 1);
        let start_index = index;

        // Linear probing: find the first availiable empty spot or the node itself
        while self.table_entry_taken(index, true) {
            // This node is stored already in the table
            if pgates == self.get_leaf_pgates_bits(index) {
                return index;
            }
            index = (index + 1) % self.max_storable_leafs();

            if index == start_index {
                println!("{}{}", self.max_storable_leafs(), self.n_leafs_stored);
                panic!(
                    "Failed inserting leaf: table is full. A resize should have been performed."
                );
            }
        }

        // Insert the node
        self.mark_table_entry_as_taken(index, true);
        self.copy_pgates_to_leaf_table(index, pgates);
        self.n_leafs_stored += 1;

        index
    }

    // ---- General helper functions ---- //

    fn tree_depth(&self) -> usize {
        ((self.n_qubits as f64) / (self.pgates_per_leaf as f64))
            .ceil()
            .log2()
            .ceil() as usize
    }

    /// Returns true if the node/leaf at the given index is taken
    /// in the node/leaf table.
    fn table_entry_taken(&self, index: usize, leaf_table: bool) -> bool {
        if leaf_table {
            return self.leaf_table[index * self.bits_per_leaf()];
        } else {
            self.node_table[index * self.bits_per_node()]
        }
    }

    /// Marks the node/leaf entry at `index` as taken.
    fn mark_table_entry_as_taken(&mut self, index: usize, leaf_table: bool) {
        if leaf_table {
            let bpl = self.bits_per_leaf();
            self.leaf_table.set(index * bpl, true);
        } else {
            let bpn = self.bits_per_node();
            self.node_table.set(index * bpn, true);
        }
    }

    /// We pad the Pauli strings with identity gates such that the number of
    /// gates is a multiple of `pgates_per_leaf`. This function returns the number
    /// of pad bits needed for this.
    fn n_pad_bits(&self) -> usize {
        if self.n_qubits % self.pgates_per_leaf == 0 {
            return 0;
        }
        2 * (self.pgates_per_leaf - (self.n_qubits % self.pgates_per_leaf))
    }

    /// Return the string representation of a bitvec of Pauli gates, i.e., Pauli string
    fn pstr_bitslice_as_str(slice: &BitSlice) -> String {
        let mut s = String::with_capacity(slice.len() / 2);
        for i in 0..slice.len() / 2 {
            let gate = PauliUtils::pauli_gate_from_tuple(slice[2 * i], slice[2 * i + 1]);
            s.push_str(&format!("{}", gate));
        }
        s
    }

    /// Return the ith stored Pauli string as a string
    fn ith_pstr_as_str(&self, i: usize) -> String {
        Self::pstr_bitslice_as_str(&self.pstr_as_bitvec(i))
    }

    /// Return the ith bit of of a number
    fn get_bit(num: usize, i: usize) -> bool {
        (num >> i) & 1 == 1
    }

    // ---- Conversion between indices and bitvecs ---- //

    /// Hashes the provided bits to an index less than or equal to `max_index`.
    fn bits_to_index(&self, bits: &BitSlice, max_index: usize) -> usize {
        (fxhash::hash64(&bits) as usize) % (max_index + 1)
    }

    /// Converts a given index to a bitvec of length `n_bits`.
    /// If indices do not fit in `n_bits` bits,
    /// only the first log2(n_bits) bits will be used.
    fn index_to_bitvec(&self, index: usize, n_bits: usize) -> BitVec {
        let mut b = bitvec![0; n_bits];
        for i in 0..b.len() {
            b.set(i, Self::get_bit(index, n_bits - i - 1));
        }
        b
    }

    fn node_index_to_root_node(&self, node_index: usize) -> BitVec {
        self.index_to_bitvec(node_index, self.n_node_body_bits / 2)
    }

    /// Converts a given index to a bitvec of length `self.n_node_body_bits`.
    fn leaf_index_to_node_body(&self, leaf_index: usize) -> BitVec {
        self.index_to_bitvec(leaf_index, self.n_node_body_bits)
    }

    /// Converts two node indices into a body of a non-leaf node
    /// Note: deliberately does not call index_to_bitvec to avoid
    /// unnecessary allocations.
    fn node_indices_to_node_body(&self, l_index: usize, r_index: usize) -> BitVec {
        let mut body = bitvec![0; self.n_node_body_bits];
        let bits_per_half = self.n_node_body_bits / 2;

        for i in 0..bits_per_half {
            // Write MSB first
            body.set(i, Self::get_bit(l_index, bits_per_half - i - 1));
            body.set(
                i + bits_per_half,
                Self::get_bit(r_index, bits_per_half - i - 1),
            );
        }

        body
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

    /// Returns the index of the root node in the node table of the ith Pauli string
    fn root_node_index(&self, i: usize) -> usize {
        let bs = &self.root_node_table
            [i * self.n_bits_per_root_node()..(i + 1) * self.n_bits_per_root_node()];
        Self::bitslice_to_usize(bs)
    }

    fn node_index_from_node_body(&self, node_body: &BitSlice, left_index: bool) -> usize {
        if left_index {
            Self::bitslice_to_usize(&node_body[..(self.n_node_body_bits / 2)])
        } else {
            Self::bitslice_to_usize(&node_body[(self.n_node_body_bits / 2)..])
        }
    }

    fn leaf_index_from_node_body(&self, node_body: &BitSlice) -> usize {
        Self::bitslice_to_usize(node_body)
    }

    /// Update the index of the root note of the `pstr_index` Pauli string
    fn update_root_node_index(&mut self, pstr_index: usize, new_index: usize) {
        let bv = self.index_to_bitvec(new_index, self.n_bits_per_root_node());
        let bits_per_root_node = self.n_bits_per_root_node();
        for (i, b) in bv.iter().enumerate() {
            self.root_node_table
                .set(pstr_index * bits_per_root_node + i, *b);
        }
    }

    // ---- Inserting and Retrieving Pauli gates/strings  ---- //

    fn insert_pstr(&mut self, mut pstr: BitVec, c_list: CoefficientList) {
        if pstr.len() != 2 * self.n_qubits {
            panic!("Trying to insert a Pauli string with an invalid number of Pauli gates.");
        }

        self.check_memory_availability(
            self.max_nodes_stored_per_pstr(),
            self.max_leafs_stored_per_pstr(),
        );

        // To ensure that recursive insert works nicely, we pad the bitvec with zeros.
        // The Pauli string is padded such that pstr.len() / 2 is a multiple of pgates_per_node.
        pstr.resize(pstr.len() + self.n_pad_bits(), false);

        let node_index = self.recursive_insert_pstr(&pstr);
        let root_node = self.node_index_to_root_node(node_index);
        self.root_node_table.extend_from_bitslice(&root_node);
        self.coeff_lists.push(c_list);
    }

    /// If we are given more than `self.pgates_per_leaf` gates,
    /// we split the gates in half and recursively insert them.
    /// The function returns the index of the inserted node/leaf and
    /// a boolean indicating whether the inserted node is a leaf or not.
    fn recursive_insert_pstr(&mut self, pgates: &BitSlice) -> usize {
        // We save `self.pgates_per_leaf` gates per leaf.
        // Since each gate is represented by 2 bits, we need to divide the length of the bitvec by 2 and
        // then divide by `self.pgates_per_leaf` to get the number of leaf nodes we need to insert.
        let n_leafs = (pgates.len() / 2 as usize) / self.pgates_per_leaf;

        if n_leafs == 1 {
            let leaf_index = self.insert_leaf_into_table(pgates);
            let node_body = self.leaf_index_to_node_body(leaf_index);
            return self.insert_node_into_table(&node_body, true);
        }

        // We recursively insert two halves of the pgates. First we determine
        // the number of bits that each half will store
        let bits_per_half = (n_leafs / 2) * (self.pgates_per_leaf * 2);

        // Then we insert the two halves and store a reference to both subtrees that store them
        let l_index = self.recursive_insert_pstr(&pgates[..bits_per_half]);
        let r_index = self.recursive_insert_pstr(&pgates[bits_per_half..]);

        let body = self.node_indices_to_node_body(l_index, r_index);

        self.insert_node_into_table(&body, false)
    }

    // TODO refactor this with set pgate?
    fn get_pgate(&self, pstr_index: usize, gate_index: usize) -> PauliGate {
        if pstr_index > self.size() || gate_index >= self.n_qubits {
            panic!("Pauli string or gate index out of bounds.");
        }

        let pgates_per_pstr = self.n_qubits + (self.n_pad_bits() / 2);
        let n_leaf_nodes = pgates_per_pstr / self.pgates_per_leaf;

        let root_node_index = self.root_node_index(pstr_index);
        self.recursive_get_pgate(root_node_index, gate_index, n_leaf_nodes)
    }

    fn recursive_get_pgate(
        &self,
        node_index: usize,
        relative_gate_index: usize,
        n_leaf_nodes: usize,
    ) -> PauliGate {
        let body = self.get_node_body(node_index);

        if self.node_points_to_leaf(node_index) {
            let leaf_index = self.leaf_index_from_node_body(body);
            return self.get_ith_pgate_from_leaf(leaf_index, relative_gate_index);
        }

        let left_index = self.node_index_from_node_body(body, true);
        let right_index = self.node_index_from_node_body(body, false);

        let n_leaf_nodes_left = n_leaf_nodes / 2;
        let n_leaf_nodes_right = n_leaf_nodes - (n_leaf_nodes / 2);

        // Recurse on the left/right node and update their index
        if relative_gate_index < (n_leaf_nodes_left * self.pgates_per_leaf) {
            return self.recursive_get_pgate(left_index, relative_gate_index, n_leaf_nodes_left);
        } else {
            // Prevent subtraction with overflow
            if relative_gate_index < self.pgates_per_leaf {
                panic!("Failed getting Pauli gate: We should have found a leaf by now.");
            }

            let new_relative_gate_index =
                relative_gate_index - (n_leaf_nodes_left * self.pgates_per_leaf);
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

        // In the worst case we update `self.depth` nodes and one leaf
        self.check_memory_availability(self.depth, 1);

        // We might save more Pauli gates per Pauli string due to the padding
        let pgates_per_pstr = self.n_qubits + (self.n_pad_bits() / 2);
        let n_leaf_nodes = pgates_per_pstr / self.pgates_per_leaf;

        let root_node_index = self.root_node_index(pstr_index);
        let new_root_index =
            self.recursive_set_pgate(root_node_index, gate_index, n_leaf_nodes, &pgate);
        self.update_root_node_index(pstr_index, new_root_index)
    }

    fn recursive_set_pgate(
        &mut self,
        node_index: usize,
        relative_gate_index: usize,
        n_leaf_nodes: usize,
        pgate: &PauliGate,
    ) -> usize {
        if self.node_points_to_leaf(node_index) {
            let leaf_index = self.leaf_index_from_node_body(self.get_node_body(node_index));

            let mut new_leaf_pgates = BitVec::from_bitslice(self.get_leaf_pgates_bits(leaf_index));
            let (b1, b2) = PauliUtils::pauli_gate_as_tuple(*pgate);

            new_leaf_pgates.set(2 * relative_gate_index, b1);
            new_leaf_pgates.set(2 * relative_gate_index + 1, b2);

            let new_leaf_index = self.insert_leaf_into_table(&new_leaf_pgates);
            let node_body = self.leaf_index_to_node_body(new_leaf_index);
            return self.insert_node_into_table(&node_body, true);
        }

        let body = self.get_node_body(node_index);

        let mut left_index = self.node_index_from_node_body(body, true);
        let mut right_index = self.node_index_from_node_body(body, false);

        let n_leaf_nodes_left = n_leaf_nodes / 2;
        let n_leaf_nodes_right = n_leaf_nodes - (n_leaf_nodes / 2);

        // Recurse on the left/right node and update their index
        if relative_gate_index < (n_leaf_nodes_left * self.pgates_per_leaf) {
            left_index =
                self.recursive_set_pgate(left_index, relative_gate_index, n_leaf_nodes_left, pgate);
        } else {
            if relative_gate_index < self.pgates_per_leaf {
                panic!("Failed setting Pauli gate: We should have found a leaf by now.");
            }

            let new_relative_gate_index =
                relative_gate_index - (n_leaf_nodes_left * self.pgates_per_leaf);
            right_index = self.recursive_set_pgate(
                right_index,
                new_relative_gate_index,
                n_leaf_nodes_right,
                pgate,
            );
        }

        let new_node_body = self.node_indices_to_node_body(left_index, right_index);
        let new_node_index = self.insert_node_into_table(&new_node_body, false);

        new_node_index
    }

    /// Return the ith stored Pauli string as a bitvec
    fn pstr_as_bitvec(&self, i: usize) -> BitVec {
        if i > self.size() {
            panic!("Cannot retrieve Pauli string {}: Index out of bounds.", i);
        }

        let mut pstr = BitVec::with_capacity(2 * self.n_qubits);

        let root_node_index = self.root_node_index(i);
        self.recursive_pstr_as_bitvec(root_node_index, &mut pstr);

        // Omit potential padding
        pstr[..2 * self.n_qubits].to_bitvec()
    }

    fn recursive_pstr_as_bitvec(&self, node_index: usize, pstr: &mut BitVec) {
        let body = self.get_node_body(node_index);

        if self.node_points_to_leaf(node_index) {
            let leaf_index = self.leaf_index_from_node_body(self.get_node_body(node_index));
            let leaf_pgates_bits = self.get_leaf_pgates_bits(leaf_index);
            pstr.extend_from_bitslice(leaf_pgates_bits);
            return;
        }

        let l_index = self.node_index_from_node_body(body, true);
        let r_index = self.node_index_from_node_body(body, false);

        self.recursive_pstr_as_bitvec(l_index, pstr);
        self.recursive_pstr_as_bitvec(r_index, pstr);
    }

    // ---- Memory management ---- //

    /// The function checks whether there is a sufficient amount of memory to store
    /// the number of nodes and leafs given through the parameter. If not, it triggers garbage collection.
    /// Each function inserting nodes into the node table should call this function.
    fn check_memory_availability(&mut self, n_nodes_to_store: usize, n_leafs_to_store: usize) {
        if (self.n_nodes_stored + n_nodes_to_store >= self.max_storable_nodes())
            || (self.n_leafs_stored + n_leafs_to_store >= self.max_storable_leafs())
        {
            self.garbage_collection();

            if (self.n_nodes_stored + n_nodes_to_store > self.max_storable_nodes())
                || (self.n_leafs_stored + n_leafs_to_store > self.max_storable_leafs())
            {
                self.resize();
            }
        }
    }

    fn garbage_collection(&mut self) {
        let mut new_node_table = bitvec![0; self.n_bits_for_node_table()];
        let mut new_leaf_table = bitvec![0; self.n_bits_for_leaf_table()];

        self.n_nodes_stored = 0;
        self.n_leafs_stored = 0;

        for pstr_index in 0..self.size() {
            let root_node_index = self.root_node_index(pstr_index);
            self.recursive_garbage_collection(
                root_node_index,
                &mut new_node_table,
                &mut new_leaf_table,
            );
        }

        self.node_table = new_node_table;
        self.leaf_table = new_leaf_table;
    }

    fn recursive_garbage_collection(
        &mut self,
        node_index: usize,
        new_node_table: &mut BitSlice,
        new_leaf_table: &mut BitSlice,
    ) {
        let body = self.get_node_body(node_index);

        if self.node_points_to_leaf(node_index) {
            let leaf_index = self.leaf_index_from_node_body(body);

            self.copy_entry_to_new_table(leaf_index, new_leaf_table, self.bits_per_leaf(), true);

            self.n_leafs_stored += 1;
        } else {
            let left_index = self.node_index_from_node_body(body, true);
            let right_index = self.node_index_from_node_body(body, false);

            self.recursive_garbage_collection(left_index, new_node_table, new_leaf_table);
            self.recursive_garbage_collection(right_index, new_node_table, new_leaf_table);
        }

        self.copy_entry_to_new_table(node_index, new_node_table, self.bits_per_node(), false);
        self.n_nodes_stored += 1;
    }

    /// Copy an entry from the existing node/leaf table to provided table.
    fn copy_entry_to_new_table(
        &self,
        index: usize,
        table: &mut BitSlice,
        bits_per_entry: usize,
        leaf: bool,
    ) {
        // This entry is already stored in the new leaf table
        if table[index * bits_per_entry] {
            return;
        }

        for i in index * bits_per_entry..(index + 1) * bits_per_entry {
            if leaf {
                table.set(i, self.leaf_table[i]);
            } else {
                table.set(i, self.node_table[i]);
            }
        }
    }

    fn gather(&self) -> HashMap<usize, CoefficientList, FxBuildHasher> {
        // Map from root index to Pauli string index
        let mut m = HashMap::<usize, CoefficientList, FxBuildHasher>::with_capacity_and_hasher(
            self.size(),
            FxBuildHasher::default(),
        );

        // Gather all unique Pauli strings
        for pstr_index in 0..self.size() {
            let root_node_index = self.root_node_index(pstr_index);
            match m.entry(root_node_index) {
                Entry::Occupied(mut e) => {
                    e.get_mut().merge(&self.coeff_lists[pstr_index].clone());
                }
                Entry::Vacant(e) => {
                    e.insert(self.coeff_lists[pstr_index].clone());
                }
            }
        }

        m
    }

    fn scatter(&mut self, m: &mut HashMap<usize, CoefficientList, FxBuildHasher>) {
        // Scatter all unique Pauli strings
        self.root_node_table.clear();
        self.coeff_lists.clear();

        for (root_index, c_list) in m.iter_mut() {
            if c_list.is_empty() {
                continue;
            }

            let root_node = self.index_to_bitvec(*root_index, self.n_bits_per_root_node());
            self.root_node_table.extend_from_bitslice(&root_node);
            self.coeff_lists.push(c_list.clone());
        }
    }

    fn resize(&mut self) {
        // TODO resize in a smart way
        let new_n_node_body_bits = self.n_node_body_bits * 2;
        let new_pgates_per_leaf = self.pgates_per_leaf * 2;

        let mut resized_ptrees = PauliTrees::new(
            self.n_qubits,
            1,
            Some(new_n_node_body_bits),
            Some(new_pgates_per_leaf),
        );

        for pstr_index in 0..self.size() {
            let pstr = self.pstr_as_bitvec(pstr_index);
            let c_list = self.coeff_lists[pstr_index].clone();
            resized_ptrees.insert_pstr(pstr, c_list)
        }

        *self = resized_ptrees;
    }

    // ------- Conjugation Functions ------- //

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

            self.root_node_table.extend_from_within(
                pstr_index * self.n_bits_per_root_node()
                    ..(pstr_index + 1) * self.n_bits_per_root_node(),
            );

            self.coeff_lists.push(self.coeff_lists[pstr_index].clone());

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
}

impl GeneratorSet for PauliTrees {
    fn init_generators(&mut self, zero_state_generators: bool) {
        let p_gate = if zero_state_generators {
            PauliGate::Z
        } else {
            PauliGate::X
        };

        let (b1, b2) = PauliUtils::pauli_gate_as_tuple(p_gate);
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

    fn conjugate(&mut self, gate: &Gate, conjugate_dagger: bool) -> Result<(), GenertorSetError> {
        if self.n_nodes_stored > self.gargabe_collection_threshold {
            self.garbage_collection();
        }

        match gate.gate_type {
            GateType::H | GateType::S => {
                self.h_s_conjugations_map
                    .update(gate, conjugate_dagger)
                    .unwrap();
            }
            GateType::CNOT => self.conjugate_cnot(gate),
            GateType::Rz => self.conjugate_rz(gate, conjugate_dagger),
            _ => return Err(GenertorSetError::InvalidGateToConjugate {}),
        }
        Ok(())
    }

    fn measure(&mut self, _i: usize) -> (bool, f64) {
        unimplemented!()
    }

    fn clean(&mut self) {
        let mut m = self.gather();
        self.scatter(&mut m);
    }

    fn size(&self) -> usize {
        self.coeff_lists.len()
    }
}

impl std::fmt::Display for PauliTrees {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        let mut s = String::new();

        for pstr_index in 0..self.size() {
            let mut coef_multiplier = 1.0;
            let pstr = self.ith_pstr_as_str(pstr_index);

            for (i, pgate) in pstr.chars().enumerate() {
                let current_pgate = PauliUtils::char_to_pauli_gate(&pgate).unwrap();

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

    // #[test]
    // fn test_insert_node() {
    //     let mut pauli_trees = PauliTrees::new(30, 1);
    //     let node = bitvec![1; 2*pauli_trees.pgates_per_node];

    //     let index_1 = pauli_trees.insert_node_body(&node, true);

    //     // First node we insert, index should equal its index without probing
    //     // TODO pass true?
    //     assert_eq!(index_1, pauli_trees.node_index(&node, true));
    //     // Node shold be in the table
    //     assert_eq!(
    //         pauli_trees.node_table[index_1 * pauli_trees.bits_per_node()
    //             + pauli_trees.n_book_keeping_bits()
    //             ..(index_1 + 1) * pauli_trees.bits_per_node()],
    //         node
    //     );
    //     // And is a leaf
    //     assert_eq!(pauli_trees.is_leaf(index_1), true);

    //     let index_2 = pauli_trees.insert_node_body(&node, false);

    //     // Should be inserted one spot later
    //     assert_eq!(index_2, pauli_trees.node_index(&node, true) + 1);

    //     for (i, b) in pauli_trees.node_table.iter().enumerate() {
    //         // All these bits should be one, except the leaf indicator bit of the second node
    //         if (i >= index_1 * pauli_trees.bits_per_node()
    //             && i < (index_2 + 1) * pauli_trees.bits_per_node())
    //             && i != index_2 * pauli_trees.bits_per_node() + 1
    //         {
    //             assert_eq!(*b, true);
    //         } else {
    //             assert_eq!(*b, false);
    //         }
    //     }
    // }

    #[test]
    fn get_pstr_as_str() {
        let set_bits = [false, false, true, false, true, true, false, true];
        let n_qubits = 18;
        let mut pauli_trees = PauliTrees::new(n_qubits, 1, None, None);
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
        let mut pauli_trees = PauliTrees::new(n_qubits, 1, None, None);
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
