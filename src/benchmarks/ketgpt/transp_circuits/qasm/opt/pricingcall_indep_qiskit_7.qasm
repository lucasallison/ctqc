OPENQASM 3.0;
include "stdgates.inc";
bit[7] meas;
qubit[7] q;
rz(-pi/2) q[0];
h q[0];
rz(1.7092511325680473) q[0];
h q[0];
rz(5*pi/2) q[0];
rz(-pi/2) q[1];
h q[1];
rz(1.682873047977714) q[1];
h q[1];
rz(5*pi/2) q[1];
rz(-pi/2) q[2];
h q[2];
rz(1.5108045268930201) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(1.035450767474285) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.3177499787899434) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[2], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.1536890792886707) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.6814046158063358) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[2], q[0];
h q[2];
rz(pi) q[2];
h q[2];
rz(-pi/2) q[3];
h q[3];
rz(3*pi/8) q[3];
h q[3];
rz(5*pi/2) q[3];
h q[4];
rz(pi) q[4];
cx q[0], q[5];
h q[6];
cx q[5], q[6];
rz(-pi/4) q[6];
cx q[1], q[6];
rz(pi/4) q[6];
cx q[5], q[6];
rz(pi/4) q[5];
rz(-pi/4) q[6];
cx q[1], q[6];
cx q[1], q[5];
rz(3*pi/4) q[1];
rz(-pi/4) q[5];
cx q[1], q[5];
rz(5*pi/4) q[6];
h q[6];
cx q[6], q[4];
rz(-pi/4) q[4];
cx q[2], q[4];
rz(pi/4) q[4];
cx q[6], q[4];
rz(-pi/4) q[4];
cx q[2], q[4];
rz(pi/4) q[4];
h q[4];
cx q[4], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(0.29425236476954275) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[4], q[3];
rz(-3*pi/2) q[3];
h q[3];
rz(0.29425236476954275) q[3];
h q[3];
rz(3*pi/2) q[3];
cx q[4], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-0.04906796046201922) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[4], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(0.04906796046201922) q[3];
h q[3];
rz(5*pi/2) q[3];
h q[3];
rz(pi/4) q[6];
cx q[2], q[6];
rz(pi/4) q[2];
rz(-pi/4) q[6];
cx q[2], q[6];
h q[2];
rz(pi) q[2];
h q[2];
h q[6];
rz(pi) q[6];
cx q[5], q[6];
rz(-pi/4) q[6];
cx q[1], q[6];
rz(pi/4) q[6];
cx q[5], q[6];
rz(pi/4) q[5];
rz(-pi/4) q[6];
cx q[1], q[6];
cx q[1], q[5];
rz(-pi/4) q[5];
cx q[1], q[5];
cx q[0], q[5];
cx q[0], q[3];
rz(-pi/4) q[3];
cx q[4], q[3];
rz(pi/4) q[3];
cx q[0], q[3];
rz(pi/4) q[0];
rz(-pi/4) q[3];
cx q[4], q[3];
rz(pi/4) q[3];
h q[3];
cx q[4], q[0];
rz(-pi/4) q[0];
rz(3*pi/2) q[4];
cx q[4], q[0];
cx q[4], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(0.04906796046201922) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[4], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-0.04906796046201922) q[3];
h q[3];
rz(5*pi/2) q[3];
h q[3];
cx q[0], q[3];
rz(-pi/4) q[3];
cx q[4], q[3];
rz(pi/4) q[3];
cx q[0], q[3];
rz(pi/4) q[0];
rz(-pi/4) q[3];
cx q[4], q[3];
rz(pi/4) q[3];
h q[3];
cx q[4], q[0];
rz(-pi/4) q[0];
cx q[4], q[0];
cx q[0], q[5];
cx q[4], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-0.098135920924038) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[4], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(0.098135920924038) q[3];
h q[3];
rz(5*pi/2) q[3];
h q[3];
cx q[1], q[3];
rz(-pi/4) q[3];
cx q[4], q[3];
rz(pi/4) q[3];
cx q[1], q[3];
rz(-pi/4) q[3];
cx q[4], q[3];
rz(pi/4) q[3];
h q[3];
cx q[4], q[1];
rz(-pi/4) q[1];
cx q[4], q[1];
cx q[4], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(0.098135920924038) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[4], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-0.098135920924038) q[3];
h q[3];
rz(5*pi/2) q[3];
h q[3];
cx q[1], q[3];
rz(-pi/4) q[3];
cx q[4], q[3];
rz(pi/4) q[3];
cx q[1], q[3];
rz(pi/4) q[1];
rz(-pi/4) q[3];
cx q[4], q[3];
rz(pi/4) q[3];
h q[3];
cx q[4], q[1];
rz(-pi/4) q[1];
cx q[4], q[1];
cx q[4], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-0.196271841848076) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[4], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(0.196271841848076) q[3];
h q[3];
rz(5*pi/2) q[3];
h q[3];
cx q[2], q[3];
rz(-pi/4) q[3];
cx q[4], q[3];
rz(pi/4) q[3];
cx q[2], q[3];
rz(pi/4) q[2];
rz(-pi/4) q[3];
cx q[4], q[3];
rz(pi/4) q[3];
h q[3];
cx q[4], q[2];
rz(-pi/4) q[2];
cx q[4], q[2];
cx q[4], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(0.196271841848076) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[4], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-0.196271841848076) q[3];
h q[3];
rz(5*pi/2) q[3];
h q[3];
cx q[2], q[3];
rz(-pi/4) q[3];
cx q[4], q[3];
rz(pi/4) q[3];
cx q[2], q[3];
rz(pi/4) q[2];
rz(-pi/4) q[3];
cx q[4], q[3];
rz(pi/4) q[3];
h q[3];
cx q[4], q[2];
rz(-pi/4) q[2];
cx q[4], q[2];
h q[2];
rz(pi) q[2];
h q[2];
h q[4];
rz(pi/4) q[6];
cx q[5], q[6];
rz(-pi/4) q[6];
cx q[1], q[6];
rz(pi/4) q[6];
cx q[5], q[6];
rz(pi/4) q[5];
rz(-pi/4) q[6];
cx q[1], q[6];
cx q[1], q[5];
rz(pi/2) q[1];
rz(-pi/4) q[5];
cx q[1], q[5];
rz(5*pi/4) q[6];
h q[6];
cx q[6], q[4];
rz(-pi/4) q[4];
cx q[2], q[4];
rz(pi/4) q[4];
cx q[6], q[4];
rz(-pi/4) q[4];
cx q[2], q[4];
rz(5*pi/4) q[4];
h q[4];
rz(pi/4) q[6];
cx q[2], q[6];
rz(pi/4) q[2];
rz(-pi/4) q[6];
cx q[2], q[6];
h q[2];
rz(pi) q[2];
h q[2];
h q[6];
rz(pi) q[6];
cx q[5], q[6];
rz(-pi/4) q[6];
cx q[1], q[6];
rz(pi/4) q[6];
cx q[5], q[6];
rz(pi/4) q[5];
rz(-pi/4) q[6];
cx q[1], q[6];
cx q[1], q[5];
rz(-pi/4) q[5];
cx q[1], q[5];
cx q[0], q[5];
rz(pi/4) q[6];
h q[6];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6];
meas[0] = measure q[0];
meas[1] = measure q[1];
meas[2] = measure q[2];
meas[3] = measure q[3];
meas[4] = measure q[4];
meas[5] = measure q[5];
meas[6] = measure q[6];