OPENQASM 3.0;
include "stdgates.inc";
bit[10] meas;
qubit[10] q;
h q[9];
cx q[9], q[8];
cx q[8], q[7];
cx q[7], q[6];
cx q[6], q[5];
cx q[5], q[4];
cx q[4], q[3];
cx q[3], q[2];
cx q[2], q[1];
cx q[1], q[0];
h q[9];
rz(pi/4) q[9];
cx q[9], q[8];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
h q[8];
rz(pi/4) q[8];
rz(pi/8) q[9];
cx q[9], q[7];
rz(-pi/8) q[7];
cx q[9], q[7];
rz(pi/8) q[7];
cx q[8], q[7];
rz(-pi/4) q[7];
cx q[8], q[7];
rz(pi/4) q[7];
h q[7];
rz(pi/4) q[7];
rz(pi/8) q[8];
rz(pi/16) q[9];
cx q[9], q[6];
rz(-pi/16) q[6];
cx q[9], q[6];
rz(pi/16) q[6];
cx q[8], q[6];
rz(-pi/8) q[6];
cx q[8], q[6];
rz(pi/8) q[6];
cx q[7], q[6];
rz(-pi/4) q[6];
cx q[7], q[6];
rz(pi/4) q[6];
h q[6];
rz(pi/4) q[6];
rz(pi/8) q[7];
rz(pi/16) q[8];
rz(pi/32) q[9];
cx q[9], q[5];
rz(-pi/32) q[5];
cx q[9], q[5];
rz(pi/32) q[5];
cx q[8], q[5];
rz(-pi/16) q[5];
cx q[8], q[5];
rz(pi/16) q[5];
cx q[7], q[5];
rz(-pi/8) q[5];
cx q[7], q[5];
rz(pi/8) q[5];
cx q[6], q[5];
rz(-pi/4) q[5];
cx q[6], q[5];
rz(pi/4) q[5];
h q[5];
rz(pi/4) q[5];
rz(pi/8) q[6];
rz(pi/16) q[7];
rz(pi/32) q[8];
rz(pi/64) q[9];
cx q[9], q[4];
rz(-pi/64) q[4];
cx q[9], q[4];
rz(pi/64) q[4];
cx q[8], q[4];
rz(-pi/32) q[4];
cx q[8], q[4];
rz(pi/32) q[4];
cx q[7], q[4];
rz(-pi/16) q[4];
cx q[7], q[4];
rz(pi/16) q[4];
cx q[6], q[4];
rz(-pi/8) q[4];
cx q[6], q[4];
rz(pi/8) q[4];
cx q[5], q[4];
rz(-pi/4) q[4];
cx q[5], q[4];
rz(pi/4) q[4];
h q[4];
rz(pi/4) q[4];
rz(pi/8) q[5];
rz(pi/16) q[6];
rz(pi/32) q[7];
rz(pi/64) q[8];
rz(pi/128) q[9];
cx q[9], q[3];
rz(-pi/128) q[3];
cx q[9], q[3];
rz(pi/128) q[3];
cx q[8], q[3];
rz(-pi/64) q[3];
cx q[8], q[3];
rz(pi/64) q[3];
cx q[7], q[3];
rz(-pi/32) q[3];
cx q[7], q[3];
rz(pi/32) q[3];
cx q[6], q[3];
rz(-pi/16) q[3];
cx q[6], q[3];
rz(pi/16) q[3];
cx q[5], q[3];
rz(-pi/8) q[3];
cx q[5], q[3];
rz(pi/8) q[3];
cx q[4], q[3];
rz(-pi/4) q[3];
cx q[4], q[3];
rz(pi/4) q[3];
h q[3];
rz(pi/4) q[3];
rz(pi/8) q[4];
rz(pi/16) q[5];
rz(pi/32) q[6];
rz(pi/64) q[7];
rz(pi/128) q[8];
rz(pi/256) q[9];
cx q[9], q[2];
rz(-pi/256) q[2];
cx q[9], q[2];
rz(pi/256) q[2];
cx q[8], q[2];
rz(-pi/128) q[2];
cx q[8], q[2];
rz(pi/128) q[2];
cx q[7], q[2];
rz(-pi/64) q[2];
cx q[7], q[2];
rz(pi/64) q[2];
cx q[6], q[2];
rz(-pi/32) q[2];
cx q[6], q[2];
rz(pi/32) q[2];
cx q[5], q[2];
rz(-pi/16) q[2];
cx q[5], q[2];
rz(pi/16) q[2];
cx q[4], q[2];
rz(-pi/8) q[2];
cx q[4], q[2];
rz(pi/8) q[2];
cx q[3], q[2];
rz(-pi/4) q[2];
cx q[3], q[2];
rz(pi/4) q[2];
h q[2];
rz(pi/4) q[2];
rz(pi/8) q[3];
rz(pi/16) q[4];
rz(pi/32) q[5];
rz(pi/64) q[6];
rz(pi/128) q[7];
rz(pi/256) q[8];
rz(pi/512) q[9];
cx q[9], q[1];
rz(-pi/512) q[1];
cx q[9], q[1];
rz(pi/512) q[1];
cx q[8], q[1];
rz(-pi/256) q[1];
cx q[8], q[1];
rz(pi/256) q[1];
cx q[7], q[1];
rz(-pi/128) q[1];
cx q[7], q[1];
rz(pi/128) q[1];
cx q[6], q[1];
rz(-pi/64) q[1];
cx q[6], q[1];
rz(pi/64) q[1];
cx q[5], q[1];
rz(-pi/32) q[1];
cx q[5], q[1];
rz(pi/32) q[1];
cx q[4], q[1];
rz(-pi/16) q[1];
cx q[4], q[1];
rz(pi/16) q[1];
cx q[3], q[1];
rz(-pi/8) q[1];
cx q[3], q[1];
rz(pi/8) q[1];
cx q[2], q[1];
rz(-pi/4) q[1];
cx q[2], q[1];
rz(pi/4) q[1];
h q[1];
rz(pi/4) q[1];
rz(pi/8) q[2];
rz(pi/16) q[3];
rz(pi/32) q[4];
rz(pi/64) q[5];
rz(pi/128) q[6];
rz(pi/256) q[7];
rz(pi/512) q[8];
rz(pi/1024) q[9];
cx q[9], q[0];
rz(-pi/1024) q[0];
cx q[9], q[0];
rz(pi/1024) q[0];
cx q[8], q[0];
rz(-pi/512) q[0];
cx q[8], q[0];
rz(pi/512) q[0];
cx q[7], q[0];
rz(-pi/256) q[0];
cx q[7], q[0];
rz(pi/256) q[0];
cx q[6], q[0];
rz(-pi/128) q[0];
cx q[6], q[0];
rz(pi/128) q[0];
cx q[5], q[0];
rz(-pi/64) q[0];
cx q[5], q[0];
rz(pi/64) q[0];
cx q[4], q[0];
rz(-pi/32) q[0];
cx q[4], q[0];
rz(pi/32) q[0];
cx q[3], q[0];
rz(-pi/16) q[0];
cx q[3], q[0];
rz(pi/16) q[0];
cx q[2], q[0];
rz(-pi/8) q[0];
cx q[2], q[0];
rz(pi/8) q[0];
cx q[1], q[0];
rz(-pi/4) q[0];
cx q[1], q[0];
rz(pi/4) q[0];
h q[0];
cx q[0], q[9];
cx q[1], q[8];
cx q[2], q[7];
cx q[3], q[6];
cx q[4], q[5];
cx q[5], q[4];
cx q[4], q[5];
cx q[6], q[3];
cx q[3], q[6];
cx q[7], q[2];
cx q[2], q[7];
cx q[8], q[1];
cx q[1], q[8];
cx q[9], q[0];
cx q[0], q[9];
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