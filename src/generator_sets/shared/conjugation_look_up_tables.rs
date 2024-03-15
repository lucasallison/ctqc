use std::collections::HashMap;
use lazy_static::lazy_static;

use crate::pauli_string::PauliGate;

pub struct HSPauliLookUpOutput {
    pub p_gate: PauliGate,
    pub coefficient: f64,
    pub pstr_changed: bool,
}

lazy_static! {
    pub static ref H_CONJ_UPD_RULES: HashMap<PauliGate, HSPauliLookUpOutput> = {
        let mut m = HashMap::new();

        // X -> Z
        m.insert(PauliGate::X, HSPauliLookUpOutput{
                                    p_gate: PauliGate::Z,
                                    coefficient: 1.0,
                                    pstr_changed: true
                                });

        // Y -> -Y
        m.insert(PauliGate::Y, HSPauliLookUpOutput{p_gate: PauliGate::Y,
                                    coefficient: -1.0,
                                    pstr_changed: false});

        // Z -> X
        m.insert(PauliGate::Z, HSPauliLookUpOutput{p_gate: PauliGate::X,
                                    coefficient: 1.0,
                                    pstr_changed: true});
        m
    };

    pub static ref S_CONJ_UPD_RULES: HashMap<PauliGate, HSPauliLookUpOutput> = {
        let mut m = HashMap::new();

        // X -> Y
        m.insert(PauliGate::X, HSPauliLookUpOutput{p_gate: PauliGate::Y,
                                        coefficient: 1.0,
                                        pstr_changed: true});
        // Y -> -X
        m.insert(PauliGate::Y, HSPauliLookUpOutput{p_gate: PauliGate::X,
                                        coefficient: -1.0,
                                        pstr_changed: true});
        // Z -> Z
        m.insert(PauliGate::Z, HSPauliLookUpOutput{p_gate: PauliGate::Z,
                                        coefficient: 1.0,
                                        pstr_changed: false});
        m
    };

    pub static ref S_DAGGER_CONJ_UPD_RULES: HashMap<PauliGate, HSPauliLookUpOutput> = {
        let mut m = HashMap::new();

        // X -> -Y
        m.insert(PauliGate::X, HSPauliLookUpOutput{p_gate: PauliGate::Y,
                                        coefficient: -1.0,
                                        pstr_changed: true});
        // Y -> X
        m.insert(PauliGate::Y, HSPauliLookUpOutput{p_gate: PauliGate::X,
                                        coefficient: 1.0,
                                        pstr_changed: true});
        // Z -> Z
        m.insert(PauliGate::Z, HSPauliLookUpOutput{p_gate: PauliGate::Z,
                                        coefficient: 1.0,
                                        pstr_changed: false});
        m
    };

}

pub struct CNOTPauliLookUpOutput {
    pub q1_p_gate: PauliGate,
    pub q2_p_gate: PauliGate,
    pub coefficient: f64,
    pub pstr_changed: bool,
}

lazy_static! {
    pub static ref CNOT_CONJ_UPD_RULES: HashMap<(PauliGate, PauliGate), CNOTPauliLookUpOutput> = {
        let mut m = HashMap::new();

        // IX -> IX
        m.insert((PauliGate::I, PauliGate::X), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::I,
                                        q2_p_gate: PauliGate::X,
                                        coefficient: 1.0,
                                        pstr_changed: false});
        // XI -> XX
        m.insert((PauliGate::X, PauliGate::I), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::X,
                                        q2_p_gate: PauliGate::X,
                                        coefficient: 1.0,
                                        pstr_changed: true});
        // IY -> ZY
        m.insert((PauliGate::I, PauliGate::Y), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::Z,
                                        q2_p_gate: PauliGate::Y,
                                        coefficient: 1.0,
                                        pstr_changed: true});
        // YI -> YX
        m.insert((PauliGate::Y, PauliGate::I), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::Y,
                                        q2_p_gate: PauliGate::X,
                                        coefficient: 1.0,
                                        pstr_changed: true},   );
        // IZ -> ZZ
        m.insert((PauliGate::I, PauliGate::Z), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::Z,
                                        q2_p_gate: PauliGate::Z,
                                        coefficient: 1.0,
                                        pstr_changed: true});
        // ZI -> ZI
        m.insert((PauliGate::Z, PauliGate::I), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::Z,
                                        q2_p_gate: PauliGate::I,
                                        coefficient: 1.0,
                                        pstr_changed: false});
        // XX -> XI
        m.insert((PauliGate::X, PauliGate::X), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::X,
                                        q2_p_gate: PauliGate::I,
                                        coefficient: 1.0,
                                        pstr_changed: true});
        // XY -> -YZ
        m.insert((PauliGate::X, PauliGate::Y), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::Y,
                                        q2_p_gate: PauliGate::Z,
                                        coefficient: -1.0,
                                        pstr_changed: true});
        // XZ -> -YY
        m.insert((PauliGate::X, PauliGate::Z), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::Y,
                                        q2_p_gate: PauliGate::Y,
                                        coefficient: -1.0,
                                        pstr_changed: true});
        // YX -> YI
        m.insert((PauliGate::Y, PauliGate::X), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::Y,
                                        q2_p_gate: PauliGate::I,
                                        coefficient: 1.0,
                                        pstr_changed: true});
        // YY -> -XZ
        m.insert((PauliGate::Y, PauliGate::Y), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::X,
                                        q2_p_gate: PauliGate::Z,
                                        coefficient: -1.0,
                                        pstr_changed: true});
        // YZ -> -XY
        m.insert((PauliGate::Y, PauliGate::Z), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::X,
                                        q2_p_gate: PauliGate::Y,
                                        coefficient: -1.0,
                                        pstr_changed: true});
        // ZX -> ZX
        m.insert((PauliGate::Z, PauliGate::X), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::Z,
                                        q2_p_gate: PauliGate::X,
                                        coefficient: 1.0,
                                        pstr_changed: true});
        // ZY -> IY
        m.insert((PauliGate::Z, PauliGate::Y), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::I,
                                        q2_p_gate: PauliGate::Y,
                                        coefficient: 1.0,
                                        pstr_changed: true});
        // ZZ -> IZ
        m.insert((PauliGate::Z, PauliGate::Z), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::I,
                                        q2_p_gate: PauliGate::Z,
                                        coefficient: 1.0,
                                        pstr_changed: true});

        // II -> II
        m.insert((PauliGate::I, PauliGate::I), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::I,
                                        q2_p_gate: PauliGate::I,
                                        coefficient: 1.0,
                                        pstr_changed: false});
        m
    };
}
