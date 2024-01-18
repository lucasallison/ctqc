use bitvec::access::BitSafeUsize;
use bitvec::prelude::*;
use fxhash::FxBuildHasher;
use ordered_float::OrderedFloat;
use rand::prelude::*;
use std::collections::{hash_map::Entry, HashMap};
use std::fmt;
use rayon::prelude::*;
use std::sync::Mutex;
use fxhash;

use super::coefficient_list::CoefficientList;
use super::conjugation_look_up_tables::CNOT_CONJ_UPD_RULES;
use super::h_s_conjugations_map::HSConjugationsMap;
use super::pauli_string::PauliGate;
use super::GeneratorSet;
use crate::circuit::{Gate, GateType};
use crate::FP_ERROR_MARGIN;


/// Each generator is stored as a tree. Each tree is identifiable 
/// by a unqiue root node. The internal nodes of various tree can be shared.
pub struct PauliTrees {
    coeff_lists: Vec<CoefficientList>,
    roots: BitVec,

    // Each node consits of 2 + 2 * pgates_per_node bits. 
    // The first bit indicates wheter the location in the table is taken or not.
    // The second bit iindicates wheter the node is a leaf or not.
    // The following 2 * pgates_per_node bits are the gates of the node
    // or the index of the child node in the case of a leaf/non-leaf respectively.
    nodes: BitVec,

    pgates_per_node: usize,
    n_qubits: usize,
}

impl PauliTrees {
    pub fn new(n_qubits: usize, n_threads: usize) -> Self {
        if n_threads > 1 {
            eprintln!("WARNING: PauliTrees does not support parallelism. Ignoring n_threads.");
        } 

        let mut p = PauliTrees {
            coeff_lists: Vec::new(),
            roots: BitVec::new(),
            nodes: BitVec::new(),
            // TODO make this adaptive?
            pgates_per_node: 8,
            n_qubits,
        };

        p.nodes = bitvec![0; p.num_bits_for_nodes()];
        p
    }



    /// Calculate the number of bits needed to allocate if we want to store
    /// `p_gates_per_node` gates per node.  
    fn num_bits_for_nodes(&self) -> usize {
        self.max_storable_nodes() * self.bits_per_node()
    }

    fn max_storable_nodes(&self) -> usize {
        2 << self.pgates_per_node
    }

    fn bits_per_node(&self) -> usize {
        self.pgates_per_node * 2 + 2
    }
    
    // fn chunk_size(&self) -> usize {
    //     let chunk_size = (self.n_qubits * 2) as f64 / self.pgates_per_node as f64;
    //     chunk_size.ceil() as usize
    // }

    fn first_bit_index_of_node(&self, node_index: usize) -> usize {
        node_index * self.bits_per_node()
    }

    fn node_index(&self, node: &BitSlice) -> usize {
        (fxhash::hash64(&node) as usize) % self.max_storable_nodes()
    }

    // Insert a node and return its index 
    fn insert_node(&mut self, node: &BitSlice) -> usize {

        // TODO
        if node.len() != self.bits_per_node() - 1 {
            panic!("Failed inserting node due to a mismatch in the number of bits.");
        }

        let mut index = self.node_index(node);

        // Linear probing: find the first availiable empty spot or the node itself
        while self.nodes[self.first_bit_index_of_node(index)] {

            // This node is already in the table
            if node == &self.nodes[index * self.bits_per_node()+1..(index + 1) * self.bits_per_node()] {
                return index;
            }
            index = (index + 1) % self.max_storable_nodes();
        }

        // A free spot was found, copy the bits to the table

        let bpn = self.bits_per_node();

        // Markt the spot as taken
        self.nodes.set(index * bpn, true);

        // Copy the bits
        for (i, b) in node.iter().enumerate() {
            self.nodes.set(index * bpn + i + 1, *b);
        }

        index
    }


    fn insert_pstr(&mut self, pstr: &BitVec) -> usize {

        // TODO pad bitvec
        // TODO set root and coef
        unimplemented!()
    }

    fn recursive_insert_pstr(&mut self, pstr: &BitSlice) -> usize {

        // We save `self.pgates_per_node` gates per node.
        // Since each gate is represented by 2 bits, we need to divide the length of the bitvec by 2 and 
        // then divide by `self.pgates_per_node` to get the number of leaf nodes we need to insert.
        let n_leafs = pstr.len()/2 as usize / self.pgates_per_node;

        if n_leafs == 1 {
            return self.insert_node(pstr);
        }

        let l_index = self.recursive_insert_pstr(&pstr[..2*(n_leafs/2 as usize)]);
        let r_index = self.recursive_insert_pstr(&pstr[2*(n_leafs/2 as usize)..]);
        

        unimplemented!()
    }

}

impl GeneratorSet for PauliTrees {
    fn init_generators(&mut self, zero_state_generators: bool) {
        unimplemented!()
    }

    fn init_single_generator(&mut self, i: usize, zero_state_generator: bool) {
        unimplemented!()
    }

    fn is_x_or_z_generators(&mut self, check_zero_state: bool) -> bool {
        unimplemented!()
    }

    fn is_single_x_or_z_generator(&mut self, check_zero_state: bool, i: usize) -> bool {
        unimplemented!()
    }

    fn conjugate(&mut self, gate: &Gate, conjugate_dagger: bool) {
        unimplemented!()
    }

    fn measure(&mut self, i: usize) -> (bool, f64) {
        unimplemented!()
    }

    fn clean(&mut self) {
        unimplemented!()
    }

    fn size(&self) -> usize {
        unimplemented!()
    }
}

impl std::fmt::Display for PauliTrees {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        unimplemented!()
    }
}


#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_insert_node() {
        let mut pauli_trees = PauliTrees::new(30, 1);
        let node = bitvec![1; 2*pauli_trees.pgates_per_node + 1];

        let index = pauli_trees.insert_node(&node);
        
        // First node we insert, index should equal its index without probing 
        assert_eq!(index, pauli_trees.node_index(&node));
        // Node shold be in the table
        assert_eq!(pauli_trees.nodes[index * pauli_trees.bits_per_node() + 1..(index + 1) * pauli_trees.bits_per_node()], node);

        let index = pauli_trees.insert_node(&node);

        // Should yield the same index
        assert_eq!(index, pauli_trees.node_index(&node));

        for (i, b) in pauli_trees.nodes.iter().enumerate() {
            if i >= index * pauli_trees.bits_per_node() && i < (index + 1) * pauli_trees.bits_per_node() {
                assert_eq!(*b, true);
            } else {
                assert_eq!(*b, false);
            }
        }
    }
}
