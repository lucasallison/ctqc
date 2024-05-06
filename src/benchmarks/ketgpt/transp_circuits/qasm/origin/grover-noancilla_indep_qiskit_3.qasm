OPENQASM 3.0;
include "stdgates.inc";
bit[3] meas;
qubit[2] q;
qubit[1] flag;
h q[0];
h q[1];
rz(pi/4) q[1];
h flag[0];
s flag[0];
s flag[0];
h flag[0];
cx q[1], flag[0];
rz(-pi/4) flag[0];
cx q[1], flag[0];
cx q[1], q[0];
rz(-pi/4) q[0];
rz(pi/4) flag[0];
cx q[0], flag[0];
rz(pi/4) flag[0];
cx q[0], flag[0];
cx q[1], q[0];
rz(pi/4) q[0];
rz(-pi) q[1];
rz(-pi/4) flag[0];
cx q[0], flag[0];
rz(-pi/4) flag[0];
cx q[0], flag[0];
rz(-pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(pi/2) q[0];
cx q[0], q[1];
rz(-3*pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(-pi/2) q[0];
rz(-pi) q[1];
rz(pi/4) flag[0];
barrier q[0], q[1], flag[0];
meas[0] = measure q[0];
meas[1] = measure q[1];
meas[2] = measure flag[0];