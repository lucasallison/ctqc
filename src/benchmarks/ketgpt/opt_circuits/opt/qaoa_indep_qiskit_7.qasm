OPENQASM 3.0;
include "stdgates.inc";
bit[7] meas;
qubit[7] q;
h q[0];
h q[1];
h q[2];
cx q[1], q[2];
rz(1.4889028236449289) q[2];
cx q[1], q[2];
h q[3];
cx q[0], q[3];
rz(1.4889028236449289) q[3];
cx q[0], q[3];
h q[4];
cx q[1], q[4];
rz(1.4889028236449289) q[4];
cx q[1], q[4];
h q[1];
rz(-11.77760047846243) q[1];
h q[1];
cx q[2], q[4];
rz(1.4889028236449289) q[4];
cx q[2], q[4];
h q[2];
rz(-11.77760047846243) q[2];
h q[2];
cx q[1], q[2];
rz(5.494419276762809) q[2];
cx q[1], q[2];
h q[4];
rz(-11.77760047846243) q[4];
h q[4];
cx q[1], q[4];
rz(5.494419276762809) q[4];
cx q[1], q[4];
h q[1];
rz(-4.630465864830882) q[1];
h q[1];
cx q[2], q[4];
rz(5.494419276762809) q[4];
cx q[2], q[4];
h q[2];
rz(-4.630465864830882) q[2];
h q[2];
h q[4];
rz(-4.630465864830882) q[4];
h q[4];
h q[5];
cx q[0], q[5];
rz(1.4889028236449289) q[5];
cx q[0], q[5];
h q[0];
rz(-11.77760047846243) q[0];
h q[0];
h q[6];
cx q[3], q[6];
rz(1.4889028236449289) q[6];
cx q[3], q[6];
h q[3];
rz(-11.77760047846243) q[3];
h q[3];
cx q[0], q[3];
rz(5.494419276762809) q[3];
cx q[0], q[3];
cx q[5], q[6];
rz(1.4889028236449289) q[6];
cx q[5], q[6];
h q[5];
rz(-11.77760047846243) q[5];
h q[5];
cx q[0], q[5];
rz(5.494419276762809) q[5];
cx q[0], q[5];
h q[0];
rz(-4.630465864830882) q[0];
h q[0];
h q[6];
rz(-11.77760047846243) q[6];
h q[6];
cx q[3], q[6];
rz(5.494419276762809) q[6];
cx q[3], q[6];
h q[3];
rz(-4.630465864830882) q[3];
h q[3];
cx q[5], q[6];
rz(5.494419276762809) q[6];
cx q[5], q[6];
h q[5];
rz(-4.630465864830882) q[5];
h q[5];
h q[6];
rz(-4.630465864830882) q[6];
h q[6];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6];
meas[0] = measure q[0];
meas[1] = measure q[1];
meas[2] = measure q[2];
meas[3] = measure q[3];
meas[4] = measure q[4];
meas[5] = measure q[5];
meas[6] = measure q[6];
