OPENQASM 3.0;
include "stdgates.inc";
bit[5] meas;
qubit[5] q;
rz(-pi/2) q[0];
h q[0];
rz(-5.48681214738515) q[0];
h q[0];
rz(-pi/2) q[1];
h q[1];
rz(6.174303587384841) q[1];
h q[1];
rz(5*pi/2) q[1];
h q[1];
cx q[0], q[1];
h q[1];
rz(-pi/2) q[2];
h q[2];
rz(-2.48211471276918) q[2];
h q[2];
rz(5*pi/2) q[2];
h q[2];
cx q[0], q[2];
cx q[1], q[2];
h q[2];
rz(-pi/2) q[3];
h q[3];
rz(-4.87073612147293) q[3];
h q[3];
rz(5*pi/2) q[3];
h q[3];
cx q[0], q[3];
cx q[1], q[3];
cx q[2], q[3];
h q[3];
rz(-pi/2) q[4];
h q[4];
rz(-1.13225298444705) q[4];
h q[4];
rz(5*pi/2) q[4];
h q[4];
cx q[0], q[4];
h q[0];
rz(1.4897600642608904) q[0];
h q[0];
cx q[1], q[4];
rz(-pi/2) q[1];
h q[1];
rz(-5.70472180821892) q[1];
h q[1];
rz(5*pi/2) q[1];
h q[1];
cx q[0], q[1];
h q[1];
cx q[2], q[4];
rz(-pi/2) q[2];
h q[2];
rz(4.73160065476197) q[2];
h q[2];
rz(5*pi/2) q[2];
h q[2];
cx q[0], q[2];
cx q[1], q[2];
h q[2];
cx q[3], q[4];
rz(-pi/2) q[3];
h q[3];
rz(-0.976675728274714) q[3];
h q[3];
rz(5*pi/2) q[3];
h q[3];
cx q[0], q[3];
cx q[1], q[3];
cx q[2], q[3];
h q[3];
h q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(3.9427563329761206) q[4];
h q[4];
rz(5*pi/2) q[4];
h q[4];
cx q[0], q[4];
h q[0];
rz(-0.9306009761970588) q[0];
h q[0];
cx q[1], q[4];
rz(-pi/2) q[1];
h q[1];
rz(-4.09301167598876) q[1];
h q[1];
rz(5*pi/2) q[1];
h q[1];
cx q[0], q[1];
h q[1];
cx q[2], q[4];
rz(-pi/2) q[2];
h q[2];
rz(-4.44929727040748) q[2];
h q[2];
rz(5*pi/2) q[2];
h q[2];
cx q[0], q[2];
cx q[1], q[2];
h q[2];
cx q[3], q[4];
rz(-pi/2) q[3];
h q[3];
rz(-5.14922111308235) q[3];
h q[3];
rz(5*pi/2) q[3];
h q[3];
cx q[0], q[3];
cx q[1], q[3];
cx q[2], q[3];
h q[3];
h q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(5.36795345777456) q[4];
h q[4];
rz(5*pi/2) q[4];
h q[4];
cx q[0], q[4];
h q[0];
rz(-4.94728127471714) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[4];
rz(-pi/2) q[1];
h q[1];
rz(-0.16620193668072103) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[4];
rz(-pi/2) q[2];
h q[2];
rz(-4.11536885095106) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[3], q[4];
rz(-pi/2) q[3];
h q[3];
rz(-0.8932011420314061) q[3];
h q[3];
rz(5*pi/2) q[3];
h q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-4.14563312095378) q[4];
h q[4];
rz(5*pi/2) q[4];
barrier q[0], q[1], q[2], q[3], q[4];
meas[0] = measure q[0];
meas[1] = measure q[1];
meas[2] = measure q[2];
meas[3] = measure q[3];
meas[4] = measure q[4];