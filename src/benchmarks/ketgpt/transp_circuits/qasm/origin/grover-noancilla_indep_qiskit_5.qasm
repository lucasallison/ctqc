OPENQASM 3.0;
include "stdgates.inc";
bit[5] meas;
qubit[4] q;
qubit[1] flag;
h q[0];
h q[1];
h q[2];
h q[3];
rz(pi/16) q[3];
h flag[0];
s flag[0];
s flag[0];
h flag[0];
cx q[3], flag[0];
rz(-pi/16) flag[0];
cx q[3], flag[0];
cx q[3], q[2];
rz(-pi/16) q[2];
rz(pi/16) flag[0];
cx q[2], flag[0];
rz(pi/16) flag[0];
cx q[2], flag[0];
cx q[3], q[2];
rz(pi/16) q[2];
rz(-pi/16) flag[0];
cx q[2], flag[0];
rz(-pi/16) flag[0];
cx q[2], flag[0];
cx q[2], q[1];
rz(-pi/16) q[1];
rz(pi/16) flag[0];
cx q[1], flag[0];
rz(pi/16) flag[0];
cx q[1], flag[0];
cx q[3], q[1];
rz(pi/16) q[1];
rz(-pi/16) flag[0];
cx q[1], flag[0];
rz(-pi/16) flag[0];
cx q[1], flag[0];
cx q[2], q[1];
rz(-pi/16) q[1];
rz(pi/16) flag[0];
cx q[1], flag[0];
rz(pi/16) flag[0];
cx q[1], flag[0];
cx q[3], q[1];
rz(pi/16) q[1];
rz(-pi/16) flag[0];
cx q[1], flag[0];
rz(-pi/16) flag[0];
cx q[1], flag[0];
cx q[1], q[0];
rz(-pi/16) q[0];
rz(pi/16) flag[0];
cx q[0], flag[0];
rz(pi/16) flag[0];
cx q[0], flag[0];
cx q[3], q[0];
rz(pi/16) q[0];
rz(-pi/16) flag[0];
cx q[0], flag[0];
rz(-pi/16) flag[0];
cx q[0], flag[0];
cx q[2], q[0];
rz(-pi/16) q[0];
rz(pi/16) flag[0];
cx q[0], flag[0];
rz(pi/16) flag[0];
cx q[0], flag[0];
cx q[3], q[0];
rz(pi/16) q[0];
rz(-pi/16) flag[0];
cx q[0], flag[0];
rz(-pi/16) flag[0];
cx q[0], flag[0];
cx q[1], q[0];
rz(-pi/16) q[0];
rz(-pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(5*pi/8) q[1];
rz(pi/16) flag[0];
cx q[0], flag[0];
rz(pi/16) flag[0];
cx q[0], flag[0];
cx q[3], q[0];
rz(pi/16) q[0];
rz(-pi/16) flag[0];
cx q[0], flag[0];
rz(-pi/16) flag[0];
cx q[0], flag[0];
cx q[2], q[0];
rz(-pi/16) q[0];
rz(-pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(5*pi/8) q[2];
rz(pi/16) flag[0];
cx q[0], flag[0];
rz(pi/16) flag[0];
cx q[0], flag[0];
cx q[3], q[0];
rz(pi/16) q[0];
rz(-pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(5*pi/8) q[3];
rz(-pi/16) flag[0];
cx q[0], flag[0];
rz(-pi/16) flag[0];
cx q[0], flag[0];
rz(-pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(5*pi/8) q[0];
cx q[0], q[1];
rz(-pi/8) q[1];
cx q[0], q[1];
cx q[1], q[2];
rz(-pi/8) q[2];
cx q[0], q[2];
rz(pi/8) q[2];
cx q[1], q[2];
rz(-pi/8) q[2];
cx q[0], q[2];
cx q[2], q[3];
rz(-pi/8) q[3];
cx q[1], q[3];
rz(pi/8) q[3];
cx q[2], q[3];
rz(-pi/8) q[3];
cx q[0], q[3];
rz(pi/8) q[3];
cx q[2], q[3];
rz(-pi/8) q[3];
cx q[1], q[3];
rz(-3*pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(-pi/2) q[1];
rz(pi/8) q[3];
cx q[2], q[3];
rz(-3*pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(-pi/2) q[2];
rz(-pi/8) q[3];
cx q[0], q[3];
rz(-3*pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(-pi/2) q[0];
rz(-3*pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(-pi/2) q[3];
rz(pi/16) q[3];
rz(pi/16) flag[0];
cx q[3], flag[0];
rz(-pi/16) flag[0];
cx q[3], flag[0];
cx q[3], q[2];
rz(-pi/16) q[2];
rz(pi/16) flag[0];
cx q[2], flag[0];
rz(pi/16) flag[0];
cx q[2], flag[0];
cx q[3], q[2];
rz(pi/16) q[2];
rz(-pi/16) flag[0];
cx q[2], flag[0];
rz(-pi/16) flag[0];
cx q[2], flag[0];
cx q[2], q[1];
rz(-pi/16) q[1];
rz(pi/16) flag[0];
cx q[1], flag[0];
rz(pi/16) flag[0];
cx q[1], flag[0];
cx q[3], q[1];
rz(pi/16) q[1];
rz(-pi/16) flag[0];
cx q[1], flag[0];
rz(-pi/16) flag[0];
cx q[1], flag[0];
cx q[2], q[1];
rz(-pi/16) q[1];
rz(pi/16) flag[0];
cx q[1], flag[0];
rz(pi/16) flag[0];
cx q[1], flag[0];
cx q[3], q[1];
rz(pi/16) q[1];
rz(-pi/16) flag[0];
cx q[1], flag[0];
rz(-pi/16) flag[0];
cx q[1], flag[0];
cx q[1], q[0];
rz(-pi/16) q[0];
rz(pi/16) flag[0];
cx q[0], flag[0];
rz(pi/16) flag[0];
cx q[0], flag[0];
cx q[3], q[0];
rz(pi/16) q[0];
rz(-pi/16) flag[0];
cx q[0], flag[0];
rz(-pi/16) flag[0];
cx q[0], flag[0];
cx q[2], q[0];
rz(-pi/16) q[0];
rz(pi/16) flag[0];
cx q[0], flag[0];
rz(pi/16) flag[0];
cx q[0], flag[0];
cx q[3], q[0];
rz(pi/16) q[0];
rz(-pi/16) flag[0];
cx q[0], flag[0];
rz(-pi/16) flag[0];
cx q[0], flag[0];
cx q[1], q[0];
rz(-pi/16) q[0];
rz(-pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(5*pi/8) q[1];
rz(pi/16) flag[0];
cx q[0], flag[0];
rz(pi/16) flag[0];
cx q[0], flag[0];
cx q[3], q[0];
rz(pi/16) q[0];
rz(-pi/16) flag[0];
cx q[0], flag[0];
rz(-pi/16) flag[0];
cx q[0], flag[0];
cx q[2], q[0];
rz(-pi/16) q[0];
rz(-pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(5*pi/8) q[2];
rz(pi/16) flag[0];
cx q[0], flag[0];
rz(pi/16) flag[0];
cx q[0], flag[0];
cx q[3], q[0];
rz(pi/16) q[0];
rz(-pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(5*pi/8) q[3];
rz(-pi/16) flag[0];
cx q[0], flag[0];
rz(-pi/16) flag[0];
cx q[0], flag[0];
rz(-pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(5*pi/8) q[0];
cx q[0], q[1];
rz(-pi/8) q[1];
cx q[0], q[1];
cx q[1], q[2];
rz(-pi/8) q[2];
cx q[0], q[2];
rz(pi/8) q[2];
cx q[1], q[2];
rz(-pi/8) q[2];
cx q[0], q[2];
cx q[2], q[3];
rz(-pi/8) q[3];
cx q[1], q[3];
rz(pi/8) q[3];
cx q[2], q[3];
rz(-pi/8) q[3];
cx q[0], q[3];
rz(pi/8) q[3];
cx q[2], q[3];
rz(-pi/8) q[3];
cx q[1], q[3];
rz(-3*pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(-pi/2) q[1];
rz(pi/8) q[3];
cx q[2], q[3];
rz(-3*pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(-pi/2) q[2];
rz(-pi/8) q[3];
cx q[0], q[3];
rz(-3*pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(-pi/2) q[0];
rz(-3*pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(-pi/2) q[3];
rz(pi/16) q[3];
rz(pi/16) flag[0];
cx q[3], flag[0];
rz(-pi/16) flag[0];
cx q[3], flag[0];
cx q[3], q[2];
rz(-pi/16) q[2];
rz(pi/16) flag[0];
cx q[2], flag[0];
rz(pi/16) flag[0];
cx q[2], flag[0];
cx q[3], q[2];
rz(pi/16) q[2];
rz(-pi/16) flag[0];
cx q[2], flag[0];
rz(-pi/16) flag[0];
cx q[2], flag[0];
cx q[2], q[1];
rz(-pi/16) q[1];
rz(pi/16) flag[0];
cx q[1], flag[0];
rz(pi/16) flag[0];
cx q[1], flag[0];
cx q[3], q[1];
rz(pi/16) q[1];
rz(-pi/16) flag[0];
cx q[1], flag[0];
rz(-pi/16) flag[0];
cx q[1], flag[0];
cx q[2], q[1];
rz(-pi/16) q[1];
rz(pi/16) flag[0];
cx q[1], flag[0];
rz(pi/16) flag[0];
cx q[1], flag[0];
cx q[3], q[1];
rz(pi/16) q[1];
rz(-pi/16) flag[0];
cx q[1], flag[0];
rz(-pi/16) flag[0];
cx q[1], flag[0];
cx q[1], q[0];
rz(-pi/16) q[0];
rz(pi/16) flag[0];
cx q[0], flag[0];
rz(pi/16) flag[0];
cx q[0], flag[0];
cx q[3], q[0];
rz(pi/16) q[0];
rz(-pi/16) flag[0];
cx q[0], flag[0];
rz(-pi/16) flag[0];
cx q[0], flag[0];
cx q[2], q[0];
rz(-pi/16) q[0];
rz(pi/16) flag[0];
cx q[0], flag[0];
rz(pi/16) flag[0];
cx q[0], flag[0];
cx q[3], q[0];
rz(pi/16) q[0];
rz(-pi/16) flag[0];
cx q[0], flag[0];
rz(-pi/16) flag[0];
cx q[0], flag[0];
cx q[1], q[0];
rz(-pi/16) q[0];
rz(-pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(5*pi/8) q[1];
rz(pi/16) flag[0];
cx q[0], flag[0];
rz(pi/16) flag[0];
cx q[0], flag[0];
cx q[3], q[0];
rz(pi/16) q[0];
rz(-pi/16) flag[0];
cx q[0], flag[0];
rz(-pi/16) flag[0];
cx q[0], flag[0];
cx q[2], q[0];
rz(-pi/16) q[0];
rz(-pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(5*pi/8) q[2];
rz(pi/16) flag[0];
cx q[0], flag[0];
rz(pi/16) flag[0];
cx q[0], flag[0];
cx q[3], q[0];
rz(pi/16) q[0];
rz(-pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(5*pi/8) q[3];
rz(-pi/16) flag[0];
cx q[0], flag[0];
rz(-pi/16) flag[0];
cx q[0], flag[0];
rz(-pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(5*pi/8) q[0];
cx q[0], q[1];
rz(-pi/8) q[1];
cx q[0], q[1];
cx q[1], q[2];
rz(-pi/8) q[2];
cx q[0], q[2];
rz(pi/8) q[2];
cx q[1], q[2];
rz(-pi/8) q[2];
cx q[0], q[2];
cx q[2], q[3];
rz(-pi/8) q[3];
cx q[1], q[3];
rz(pi/8) q[3];
cx q[2], q[3];
rz(-pi/8) q[3];
cx q[0], q[3];
rz(pi/8) q[3];
cx q[2], q[3];
rz(-pi/8) q[3];
cx q[1], q[3];
rz(-3*pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(-pi/2) q[1];
rz(pi/8) q[3];
cx q[2], q[3];
rz(-3*pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(-pi/2) q[2];
rz(-pi/8) q[3];
cx q[0], q[3];
rz(-3*pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(-pi/2) q[0];
rz(-3*pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(-pi/2) q[3];
rz(pi/16) flag[0];
barrier q[0], q[1], q[2], q[3], flag[0];
meas[0] = measure q[0];
meas[1] = measure q[1];
meas[2] = measure q[2];
meas[3] = measure q[3];
meas[4] = measure flag[0];