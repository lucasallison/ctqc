OPENQASM 3.0;
include "stdgates.inc";
bit[2] c;
bit[2] meas;
qubit[2] q;
h q[1];
rz(pi/4) q[1];
cx q[1], q[0];
rz(-pi/4) q[0];
cx q[1], q[0];
rz(pi/4) q[0];
h q[0];
cx q[0], q[1];
cx q[1], q[0];
cx q[0], q[1];
barrier q[0], q[1];
meas[0] = measure q[0];
meas[1] = measure q[1];
