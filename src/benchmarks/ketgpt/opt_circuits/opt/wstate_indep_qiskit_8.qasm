OPENQASM 3.0;
include "stdgates.inc";
bit[8] meas;
qubit[8] q;
rz(-pi/2) q[0];
h q[0];
rz(-pi/4) q[0];
h q[0];
rz(5*pi/2) q[0];
h q[0];
rz(-pi/2) q[1];
h q[1];
rz(-0.9553166181245092) q[1];
h q[1];
rz(5*pi/2) q[1];
h q[1];
rz(-pi/2) q[2];
h q[2];
rz(-pi/3) q[2];
h q[2];
rz(5*pi/2) q[2];
h q[2];
rz(-pi/2) q[3];
h q[3];
rz(-1.1071487177940904) q[3];
h q[3];
rz(5*pi/2) q[3];
h q[3];
rz(-pi/2) q[4];
h q[4];
rz(-1.1502619915109316) q[4];
h q[4];
rz(5*pi/2) q[4];
h q[4];
rz(-pi/2) q[5];
h q[5];
rz(-1.183199640139716) q[5];
h q[5];
rz(5*pi/2) q[5];
h q[5];
rz(-pi/2) q[6];
h q[6];
rz(-1.2094292028881888) q[6];
h q[6];
rz(5*pi/2) q[6];
h q[6];
h q[7];
rz(pi) q[7];
h q[7];
cx q[7], q[6];
h q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(1.209429202888189) q[6];
h q[6];
rz(5*pi/2) q[6];
cx q[6], q[5];
h q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(1.1831996401397156) q[5];
h q[5];
rz(5*pi/2) q[5];
cx q[5], q[4];
h q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(1.1502619915109316) q[4];
h q[4];
rz(5*pi/2) q[4];
cx q[4], q[3];
h q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(1.1071487177940904) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[3], q[2];
h q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(pi/3) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[2], q[1];
h q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.9553166181245096) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[1], q[0];
h q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(pi/4) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[6], q[7];
cx q[5], q[6];
cx q[4], q[5];
cx q[3], q[4];
cx q[2], q[3];
cx q[1], q[2];
cx q[0], q[1];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7];
meas[0] = measure q[0];
meas[1] = measure q[1];
meas[2] = measure q[2];
meas[3] = measure q[3];
meas[4] = measure q[4];
meas[5] = measure q[5];
meas[6] = measure q[6];
meas[7] = measure q[7];
