OPENQASM 3.0;
include "stdgates.inc";
bit[4] meas;
qubit[3] q;
qubit[1] flag;
h q[0];
h q[1];
h q[2];
rz(-7*pi/8) q[2];
h flag[0];
rz(pi) flag[0];
h flag[0];
cx q[2], flag[0];
rz(-pi/8) flag[0];
cx q[2], flag[0];
cx q[2], q[1];
rz(-pi/8) q[1];
rz(pi/8) flag[0];
cx q[1], flag[0];
rz(pi/8) flag[0];
cx q[1], flag[0];
cx q[2], q[1];
rz(-7*pi/8) q[1];
rz(-pi/8) flag[0];
cx q[1], flag[0];
rz(-pi/8) flag[0];
cx q[1], flag[0];
cx q[1], q[0];
rz(-pi/8) q[0];
rz(pi/8) flag[0];
cx q[0], flag[0];
rz(pi/8) flag[0];
cx q[0], flag[0];
cx q[2], q[0];
rz(pi/8) q[0];
rz(-pi/8) flag[0];
cx q[0], flag[0];
rz(-pi/8) flag[0];
cx q[0], flag[0];
cx q[1], q[0];
rz(-pi/8) q[0];
h q[1];
rz(pi/4) q[1];
rz(pi/8) flag[0];
cx q[0], flag[0];
rz(pi/8) flag[0];
cx q[0], flag[0];
cx q[2], q[0];
rz(-7*pi/8) q[0];
h q[2];
cx q[1], q[2];
rz(-pi/4) q[2];
rz(-pi/8) flag[0];
cx q[0], flag[0];
rz(-pi/8) flag[0];
cx q[0], flag[0];
h q[0];
rz(-7*pi/4) q[0];
cx q[0], q[2];
rz(pi/4) q[2];
cx q[1], q[2];
rz(-pi/4) q[2];
cx q[0], q[2];
cx q[0], q[1];
rz(-pi/4) q[1];
cx q[0], q[1];
h q[0];
rz(-pi) q[0];
h q[1];
rz(-pi) q[1];
rz(pi/4) q[2];
h q[2];
rz(-15*pi/8) q[2];
rz(pi/8) flag[0];
cx q[2], flag[0];
rz(-pi/8) flag[0];
cx q[2], flag[0];
cx q[2], q[1];
rz(-pi/8) q[1];
rz(pi/8) flag[0];
cx q[1], flag[0];
rz(pi/8) flag[0];
cx q[1], flag[0];
cx q[2], q[1];
rz(-7*pi/8) q[1];
rz(-pi/8) flag[0];
cx q[1], flag[0];
rz(-pi/8) flag[0];
cx q[1], flag[0];
cx q[1], q[0];
rz(-pi/8) q[0];
rz(pi/8) flag[0];
cx q[0], flag[0];
rz(pi/8) flag[0];
cx q[0], flag[0];
cx q[2], q[0];
rz(pi/8) q[0];
rz(-pi/8) flag[0];
cx q[0], flag[0];
rz(-pi/8) flag[0];
cx q[0], flag[0];
cx q[1], q[0];
rz(-pi/8) q[0];
h q[1];
rz(pi/4) q[1];
rz(pi/8) flag[0];
cx q[0], flag[0];
rz(pi/8) flag[0];
cx q[0], flag[0];
cx q[2], q[0];
rz(-7*pi/8) q[0];
h q[2];
cx q[1], q[2];
rz(-pi/4) q[2];
rz(-pi/8) flag[0];
cx q[0], flag[0];
rz(-pi/8) flag[0];
cx q[0], flag[0];
h q[0];
rz(-7*pi/4) q[0];
cx q[0], q[2];
rz(pi/4) q[2];
cx q[1], q[2];
rz(-pi/4) q[2];
cx q[0], q[2];
cx q[0], q[1];
rz(-pi/4) q[1];
cx q[0], q[1];
h q[0];
rz(-pi) q[0];
h q[1];
rz(-pi) q[1];
rz(pi/4) q[2];
h q[2];
rz(-pi) q[2];
rz(pi/8) flag[0];
barrier q[0], q[1], q[2], flag[0];
meas[0] = measure q[0];
meas[1] = measure q[1];
meas[2] = measure q[2];
meas[3] = measure flag[0];