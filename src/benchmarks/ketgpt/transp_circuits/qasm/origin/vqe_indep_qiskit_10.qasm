OPENQASM 3.0;
include "stdgates.inc";
bit[10] meas;
qubit[10] q;
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.1590528542834586) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(5.054386707887633) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(6.238744328130773) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3.141519655788255) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi) q[3];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(1.570722504314753) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi) q[4];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(6.283118800838784) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi) q[5];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(4.712393138297413) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3.141679647701965) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi) q[7];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(1.371320422677773) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3*pi) q[8];
rz(0) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3.159604977321101) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3*pi) q[9];
cx q[8], q[9];
cx q[7], q[8];
cx q[6], q[7];
cx q[5], q[6];
cx q[4], q[5];
cx q[3], q[4];
cx q[2], q[3];
cx q[1], q[2];
cx q[0], q[1];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(1.417670526314813) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(4.622792561679493) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(4.797244461272393) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(4.710310373479783) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi) q[3];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi) q[4];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(6.283060053141713) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi) q[5];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(6.283155237946783) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(2*pi) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi) q[7];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(4.6233449457164735) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3*pi) q[8];
rz(0) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(4.803266236429073) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3*pi) q[9];
cx q[8], q[9];
cx q[7], q[8];
cx q[6], q[7];
cx q[5], q[6];
cx q[4], q[5];
cx q[3], q[4];
cx q[2], q[3];
cx q[1], q[2];
cx q[0], q[1];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(4.547349990711953) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(4.015510116367453) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(5.942545470321863) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(1.618194076472363) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi) q[3];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(1.5708724204354632) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi) q[4];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi) q[5];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(1.570829766886653) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(0.8022972769514429) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi) q[7];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(1.5707400937174132) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3*pi) q[8];
rz(0) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(2.941426871973077) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3*pi) q[9];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9];
meas[0] = measure q[0];
meas[1] = measure q[1];
meas[2] = measure q[2];
meas[3] = measure q[3];
meas[4] = measure q[4];
meas[5] = measure q[5];
meas[6] = measure q[6];
meas[7] = measure q[7];
meas[8] = measure q[8];
meas[9] = measure q[9];