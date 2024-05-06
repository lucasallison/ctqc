OPENQASM 3.0;
include "stdgates.inc";
bit[4] meas;
qubit[4] q;
h q[0];
h q[1];
cx q[0], q[1];
rz(5.378896346311991) q[1];
cx q[0], q[1];
h q[2];
cx q[0], q[2];
rz(5.378896346311991) q[2];
cx q[0], q[2];
rz(pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(-8.306306083329158) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(5*pi/2) q[0];
h q[3];
cx q[1], q[3];
rz(5.378896346311991) q[3];
cx q[1], q[3];
rz(pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(-8.306306083329158) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(5*pi/2) q[1];
cx q[0], q[1];
rz(2.022750163574247) q[1];
cx q[0], q[1];
cx q[2], q[3];
rz(5.378896346311991) q[3];
cx q[2], q[3];
rz(pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(-8.306306083329158) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(5*pi/2) q[2];
cx q[0], q[2];
rz(2.022750163574247) q[2];
cx q[0], q[2];
rz(pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(7.187601695038185) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(5*pi/2) q[0];
rz(pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(-8.306306083329158) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(5*pi/2) q[3];
cx q[1], q[3];
rz(2.022750163574247) q[3];
cx q[1], q[3];
rz(pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(7.187601695038185) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(5*pi/2) q[1];
cx q[2], q[3];
rz(2.022750163574247) q[3];
cx q[2], q[3];
rz(pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(7.187601695038185) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(5*pi/2) q[2];
rz(pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(7.187601695038185) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(5*pi/2) q[3];
barrier q[0], q[1], q[2], q[3];
meas[0] = measure q[0];
meas[1] = measure q[1];
meas[2] = measure q[2];
meas[3] = measure q[3];