use lazy_static::lazy_static;
use std::collections::HashMap;

use crate::generator_sets::pauli_string::PauliGate;
use crate::generator_sets::shared::floating_point_opc::FloatingPointOPC;

pub struct HSPauliLookUpOutput {
    pub p_gate: PauliGate,
    pub coefficient: FloatingPointOPC,
}

lazy_static! {
    pub static ref H_CONJ_UPD_RULES: HashMap<PauliGate, HSPauliLookUpOutput> = {
        let mut m = HashMap::new();

        // X -> Z
        m.insert(PauliGate::X, HSPauliLookUpOutput{
                                    p_gate: PauliGate::Z,
                                    coefficient: FloatingPointOPC::new(1.0)
                                });

        // Y -> -Y
        m.insert(PauliGate::Y, HSPauliLookUpOutput{p_gate: PauliGate::Y,
                                    coefficient: FloatingPointOPC::new(-1.0)
                                });

        // Z -> X
        m.insert(PauliGate::Z, HSPauliLookUpOutput{p_gate: PauliGate::X,
                                    coefficient: FloatingPointOPC::new(1.0)
                                });
        m
    };

    pub static ref S_CONJ_UPD_RULES: HashMap<PauliGate, HSPauliLookUpOutput> = {
        let mut m = HashMap::new();

        // X -> Y
        m.insert(PauliGate::X, HSPauliLookUpOutput{p_gate: PauliGate::Y,
                                        coefficient: FloatingPointOPC::new(1.0),
                                    });
        // Y -> -X
        m.insert(PauliGate::Y, HSPauliLookUpOutput{p_gate: PauliGate::X,
                                        coefficient: FloatingPointOPC::new(-1.0),
                                    });
        // Z -> Z
        m.insert(PauliGate::Z, HSPauliLookUpOutput{p_gate: PauliGate::Z,
                                        coefficient: FloatingPointOPC::new(1.0),
                                    });
        m
    };

    pub static ref S_DAGGER_CONJ_UPD_RULES: HashMap<PauliGate, HSPauliLookUpOutput> = {
        let mut m = HashMap::new();

        // X -> -Y
        m.insert(PauliGate::X, HSPauliLookUpOutput{p_gate: PauliGate::Y,
                                        coefficient: FloatingPointOPC::new(-1.0),
                                    });
        // Y -> X
        m.insert(PauliGate::Y, HSPauliLookUpOutput{p_gate: PauliGate::X,
                                        coefficient: FloatingPointOPC::new(1.0),
                                    });
        // Z -> Z
        m.insert(PauliGate::Z, HSPauliLookUpOutput{p_gate: PauliGate::Z,
                                        coefficient: FloatingPointOPC::new(1.0),
                                    });
        m
    };

}

pub struct CNOTPauliLookUpOutput {
    pub q1_p_gate: PauliGate,
    pub q2_p_gate: PauliGate,
    pub coefficient: FloatingPointOPC,
}

lazy_static! {
    pub static ref CNOT_CONJ_UPD_RULES: HashMap<(PauliGate, PauliGate), CNOTPauliLookUpOutput> = {
        let mut m = HashMap::new();

        // IX -> IX
        m.insert((PauliGate::I, PauliGate::X), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::I,
                                        q2_p_gate: PauliGate::X,
                                        coefficient: FloatingPointOPC::new(1.0),
                                    });
        // XI -> XX
        m.insert((PauliGate::X, PauliGate::I), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::X,
                                        q2_p_gate: PauliGate::X,
                                        coefficient: FloatingPointOPC::new(1.0),
                                    });
        // IY -> ZY
        m.insert((PauliGate::I, PauliGate::Y), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::Z,
                                        q2_p_gate: PauliGate::Y,
                                        coefficient: FloatingPointOPC::new(1.0),
                                    });
        // YI -> YX
        m.insert((PauliGate::Y, PauliGate::I), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::Y,
                                        q2_p_gate: PauliGate::X,
                                        coefficient: FloatingPointOPC::new(1.0),
                                    });
        // IZ -> ZZ
        m.insert((PauliGate::I, PauliGate::Z), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::Z,
                                        q2_p_gate: PauliGate::Z,
                                        coefficient: FloatingPointOPC::new(1.0),
                                    });
        // ZI -> ZI
        m.insert((PauliGate::Z, PauliGate::I), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::Z,
                                        q2_p_gate: PauliGate::I,
                                        coefficient: FloatingPointOPC::new(1.0),
                                    });
        // XX -> XI
        m.insert((PauliGate::X, PauliGate::X), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::X,
                                        q2_p_gate: PauliGate::I,
                                        coefficient: FloatingPointOPC::new(1.0),
                                    });
        // XY -> YZ
        m.insert((PauliGate::X, PauliGate::Y), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::Y,
                                        q2_p_gate: PauliGate::Z,
                                        coefficient: FloatingPointOPC::new(1.0),
                                    });
        // XZ -> -YY
        m.insert((PauliGate::X, PauliGate::Z), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::Y,
                                        q2_p_gate: PauliGate::Y,
                                        coefficient: FloatingPointOPC::new(-1.0),
                                    });
        // YX -> YI
        m.insert((PauliGate::Y, PauliGate::X), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::Y,
                                        q2_p_gate: PauliGate::I,
                                        coefficient: FloatingPointOPC::new(1.0),
                                    });
        // YY -> -XZ
        m.insert((PauliGate::Y, PauliGate::Y), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::X,
                                        q2_p_gate: PauliGate::Z,
                                        coefficient: FloatingPointOPC::new(-1.0),
                                    });
        // YZ -> XY
        m.insert((PauliGate::Y, PauliGate::Z), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::X,
                                        q2_p_gate: PauliGate::Y,
                                        coefficient: FloatingPointOPC::new(1.0),
                                    });
        // ZX -> ZX
        m.insert((PauliGate::Z, PauliGate::X), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::Z,
                                        q2_p_gate: PauliGate::X,
                                        coefficient: FloatingPointOPC::new(1.0),
                                    });
        // ZY -> IY
        m.insert((PauliGate::Z, PauliGate::Y), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::I,
                                        q2_p_gate: PauliGate::Y,
                                        coefficient: FloatingPointOPC::new(1.0),
                                    });
        // ZZ -> IZ
        m.insert((PauliGate::Z, PauliGate::Z), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::I,
                                        q2_p_gate: PauliGate::Z,
                                        coefficient: FloatingPointOPC::new(1.0),
                                    });

        // II -> II
        m.insert((PauliGate::I, PauliGate::I), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::I,
                                        q2_p_gate: PauliGate::I,
                                        coefficient: FloatingPointOPC::new(1.0),
                                    });
        m
    };
}
