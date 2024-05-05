OPENQASM 3.0;
include "stdgates.inc";
bit[6] meas;
qubit[6] q;
rz(-pi/2) q[0];
h q[0];
rz(1.9344020230960268e-05) q[0];
h q[0];
rz(-pi/2) q[1];
h q[1];
rz(2.10758205434165) q[1];
h q[1];
rz(5*pi/2) q[1];
rz(-pi/2) q[2];
h q[2];
rz(2.63943386492572) q[2];
h q[2];
rz(5*pi/2) q[2];
rz(-pi/2) q[3];
h q[3];
rz(-1.15448690368407) q[3];
h q[3];
rz(5*pi/2) q[3];
rz(-pi/2) q[4];
h q[4];
rz(-pi) q[4];
h q[4];
rz(5*pi/2) q[4];
rz(-pi/2) q[5];
h q[5];
rz(1.3386246843408305) q[5];
h q[5];
rz(5*pi/2) q[5];
cx q[4], q[5];
cx q[3], q[4];
cx q[2], q[3];
cx q[1], q[2];
cx q[0], q[1];
h q[0];
rz(pi) q[0];
h q[0];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-1.57064044552274) q[1];
h q[1];
rz(5*pi/2) q[1];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(1.5707237794238402) q[2];
h q[2];
rz(5*pi/2) q[2];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(1.5709134602949897) q[3];
h q[3];
rz(5*pi/2) q[3];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-1.57091507253759) q[4];
h q[4];
rz(5*pi/2) q[4];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(2.9092321352463397) q[5];
h q[5];
rz(5*pi/2) q[5];
cx q[4], q[5];
cx q[3], q[4];
cx q[2], q[3];
cx q[1], q[2];
cx q[0], q[1];
h q[0];
rz(pi) q[0];
h q[0];
rz(5*pi/2) q[0];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(1.5708258785060103) q[1];
h q[1];
rz(5*pi/2) q[1];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.5368606746180671) q[2];
h q[2];
rz(5*pi/2) q[2];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(2.07297807077887) q[3];
h q[3];
rz(5*pi/2) q[3];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(0.4165675737050982) q[4];
h q[4];
rz(5*pi/2) q[4];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(1.5708163163761801) q[5];
h q[5];
rz(5*pi/2) q[5];
barrier q[0], q[1], q[2], q[3], q[4], q[5];
meas[0] = measure q[0];
meas[1] = measure q[1];
meas[2] = measure q[2];
meas[3] = measure q[3];
meas[4] = measure q[4];
meas[5] = measure q[5];