OPENQASM 3.0;
include "stdgates.inc";
bit[15] meas;
qubit[15] q;
h q[14];
cx q[14], q[13];
cx q[13], q[12];
cx q[12], q[11];
cx q[11], q[10];
cx q[10], q[9];
cx q[9], q[8];
cx q[8], q[7];
cx q[7], q[6];
cx q[6], q[5];
cx q[5], q[4];
cx q[4], q[3];
cx q[3], q[2];
cx q[2], q[1];
cx q[1], q[0];
h q[14];
rz(pi/4) q[14];
cx q[14], q[13];
rz(-pi/4) q[13];
cx q[14], q[13];
rz(pi/4) q[13];
h q[13];
rz(pi/4) q[13];
rz(pi/8) q[14];
cx q[14], q[12];
rz(-pi/8) q[12];
cx q[14], q[12];
rz(pi/8) q[12];
cx q[13], q[12];
rz(-pi/4) q[12];
cx q[13], q[12];
rz(pi/4) q[12];
h q[12];
rz(pi/4) q[12];
rz(pi/8) q[13];
rz(pi/16) q[14];
cx q[14], q[11];
rz(-pi/16) q[11];
cx q[14], q[11];
rz(pi/16) q[11];
cx q[13], q[11];
rz(-pi/8) q[11];
cx q[13], q[11];
rz(pi/8) q[11];
cx q[12], q[11];
rz(-pi/4) q[11];
cx q[12], q[11];
rz(pi/4) q[11];
h q[11];
rz(pi/4) q[11];
rz(pi/8) q[12];
rz(pi/16) q[13];
rz(pi/32) q[14];
cx q[14], q[10];
rz(-pi/32) q[10];
cx q[14], q[10];
rz(pi/32) q[10];
cx q[13], q[10];
rz(-pi/16) q[10];
cx q[13], q[10];
rz(pi/16) q[10];
cx q[12], q[10];
rz(-pi/8) q[10];
cx q[12], q[10];
rz(pi/8) q[10];
cx q[11], q[10];
rz(-pi/4) q[10];
cx q[11], q[10];
rz(pi/4) q[10];
h q[10];
rz(pi/4) q[10];
rz(pi/8) q[11];
rz(pi/16) q[12];
rz(pi/32) q[13];
rz(pi/64) q[14];
cx q[14], q[9];
rz(-pi/64) q[9];
cx q[14], q[9];
rz(pi/64) q[9];
cx q[13], q[9];
rz(-pi/32) q[9];
cx q[13], q[9];
rz(pi/32) q[9];
cx q[12], q[9];
rz(-pi/16) q[9];
cx q[12], q[9];
rz(pi/16) q[9];
cx q[11], q[9];
rz(-pi/8) q[9];
cx q[11], q[9];
rz(pi/8) q[9];
cx q[10], q[9];
rz(-pi/4) q[9];
cx q[10], q[9];
rz(pi/4) q[9];
h q[9];
rz(pi/4) q[9];
rz(pi/8) q[10];
rz(pi/16) q[11];
rz(pi/32) q[12];
rz(pi/64) q[13];
rz(pi/128) q[14];
cx q[14], q[8];
rz(-pi/128) q[8];
cx q[14], q[8];
rz(pi/128) q[8];
cx q[13], q[8];
rz(-pi/64) q[8];
cx q[13], q[8];
rz(pi/64) q[8];
cx q[12], q[8];
rz(-pi/32) q[8];
cx q[12], q[8];
rz(pi/32) q[8];
cx q[11], q[8];
rz(-pi/16) q[8];
cx q[11], q[8];
rz(pi/16) q[8];
cx q[10], q[8];
rz(-pi/8) q[8];
cx q[10], q[8];
rz(pi/8) q[8];
cx q[9], q[8];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
h q[8];
rz(pi/4) q[8];
rz(pi/8) q[9];
rz(pi/16) q[10];
rz(pi/32) q[11];
rz(pi/64) q[12];
rz(pi/128) q[13];
rz(pi/256) q[14];
cx q[14], q[7];
rz(-pi/256) q[7];
cx q[14], q[7];
rz(pi/256) q[7];
cx q[13], q[7];
rz(-pi/128) q[7];
cx q[13], q[7];
rz(pi/128) q[7];
cx q[12], q[7];
rz(-pi/64) q[7];
cx q[12], q[7];
rz(pi/64) q[7];
cx q[11], q[7];
rz(-pi/32) q[7];
cx q[11], q[7];
rz(pi/32) q[7];
cx q[10], q[7];
rz(-pi/16) q[7];
cx q[10], q[7];
rz(pi/16) q[7];
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
rz(pi/32) q[10];
rz(pi/64) q[11];
rz(pi/128) q[12];
rz(pi/256) q[13];
rz(pi/512) q[14];
cx q[14], q[6];
rz(-pi/512) q[6];
cx q[14], q[6];
rz(pi/512) q[6];
cx q[13], q[6];
rz(-pi/256) q[6];
cx q[13], q[6];
rz(pi/256) q[6];
cx q[12], q[6];
rz(-pi/128) q[6];
cx q[12], q[6];
rz(pi/128) q[6];
cx q[11], q[6];
rz(-pi/64) q[6];
cx q[11], q[6];
rz(pi/64) q[6];
cx q[10], q[6];
rz(-pi/32) q[6];
cx q[10], q[6];
rz(pi/32) q[6];
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
rz(pi/64) q[10];
rz(pi/128) q[11];
rz(pi/256) q[12];
rz(pi/512) q[13];
rz(pi/1024) q[14];
cx q[14], q[5];
rz(-pi/1024) q[5];
cx q[14], q[5];
rz(pi/1024) q[5];
cx q[13], q[5];
rz(-pi/512) q[5];
cx q[13], q[5];
rz(pi/512) q[5];
cx q[12], q[5];
rz(-pi/256) q[5];
cx q[12], q[5];
rz(pi/256) q[5];
cx q[11], q[5];
rz(-pi/128) q[5];
cx q[11], q[5];
rz(pi/128) q[5];
cx q[10], q[5];
rz(-pi/64) q[5];
cx q[10], q[5];
rz(pi/64) q[5];
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
rz(pi/128) q[10];
rz(pi/256) q[11];
rz(pi/512) q[12];
rz(pi/1024) q[13];
rz(pi/2048) q[14];
cx q[14], q[4];
rz(-pi/2048) q[4];
cx q[14], q[4];
rz(pi/2048) q[4];
cx q[13], q[4];
rz(-pi/1024) q[4];
cx q[13], q[4];
rz(pi/1024) q[4];
cx q[12], q[4];
rz(-pi/512) q[4];
cx q[12], q[4];
rz(pi/512) q[4];
cx q[11], q[4];
rz(-pi/256) q[4];
cx q[11], q[4];
rz(pi/256) q[4];
cx q[10], q[4];
rz(-pi/128) q[4];
cx q[10], q[4];
rz(pi/128) q[4];
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
rz(pi/256) q[10];
rz(pi/512) q[11];
rz(pi/1024) q[12];
rz(pi/2048) q[13];
rz(pi/4096) q[14];
cx q[14], q[3];
rz(-pi/4096) q[3];
cx q[14], q[3];
rz(pi/4096) q[3];
cx q[13], q[3];
rz(-pi/2048) q[3];
cx q[13], q[3];
rz(pi/2048) q[3];
cx q[12], q[3];
rz(-pi/1024) q[3];
cx q[12], q[3];
rz(pi/1024) q[3];
cx q[11], q[3];
rz(-pi/512) q[3];
cx q[11], q[3];
rz(pi/512) q[3];
cx q[10], q[3];
rz(-pi/256) q[3];
cx q[10], q[3];
rz(pi/256) q[3];
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
rz(pi/512) q[10];
rz(pi/1024) q[11];
rz(pi/2048) q[12];
rz(pi/4096) q[13];
rz(pi/8192) q[14];
cx q[14], q[2];
rz(-pi/8192) q[2];
cx q[14], q[2];
rz(pi/8192) q[2];
cx q[13], q[2];
rz(-pi/4096) q[2];
cx q[13], q[2];
rz(pi/4096) q[2];
cx q[12], q[2];
rz(-pi/2048) q[2];
cx q[12], q[2];
rz(pi/2048) q[2];
cx q[11], q[2];
rz(-pi/1024) q[2];
cx q[11], q[2];
rz(pi/1024) q[2];
cx q[10], q[2];
rz(-pi/512) q[2];
cx q[10], q[2];
rz(pi/512) q[2];
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
rz(pi/1024) q[10];
rz(pi/2048) q[11];
rz(pi/4096) q[12];
rz(pi/8192) q[13];
rz(pi/16384) q[14];
cx q[14], q[1];
rz(-pi/16384) q[1];
cx q[14], q[1];
rz(pi/16384) q[1];
cx q[13], q[1];
rz(-pi/8192) q[1];
cx q[13], q[1];
rz(pi/8192) q[1];
cx q[12], q[1];
rz(-pi/4096) q[1];
cx q[12], q[1];
rz(pi/4096) q[1];
cx q[11], q[1];
rz(-pi/2048) q[1];
cx q[11], q[1];
rz(pi/2048) q[1];
cx q[10], q[1];
rz(-pi/1024) q[1];
cx q[10], q[1];
rz(pi/1024) q[1];
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
rz(pi/2048) q[10];
rz(pi/4096) q[11];
rz(pi/8192) q[12];
rz(pi/16384) q[13];
rz(pi/32768) q[14];
cx q[14], q[0];
rz(-pi/32768) q[0];
cx q[14], q[0];
rz(pi/32768) q[0];
cx q[13], q[0];
rz(-pi/16384) q[0];
cx q[13], q[0];
rz(pi/16384) q[0];
cx q[12], q[0];
rz(-pi/8192) q[0];
cx q[12], q[0];
rz(pi/8192) q[0];
cx q[11], q[0];
rz(-pi/4096) q[0];
cx q[11], q[0];
rz(pi/4096) q[0];
cx q[10], q[0];
rz(-pi/2048) q[0];
cx q[10], q[0];
rz(pi/2048) q[0];
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
cx q[0], q[14];
cx q[1], q[13];
cx q[2], q[12];
cx q[3], q[11];
cx q[4], q[10];
cx q[5], q[9];
cx q[6], q[8];
cx q[8], q[6];
cx q[6], q[8];
cx q[9], q[5];
cx q[5], q[9];
cx q[10], q[4];
cx q[4], q[10];
cx q[11], q[3];
cx q[3], q[11];
cx q[12], q[2];
cx q[2], q[12];
cx q[13], q[1];
cx q[1], q[13];
cx q[14], q[0];
cx q[0], q[14];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], q[11], q[12], q[13], q[14];
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
meas[10] = measure q[10];
meas[11] = measure q[11];
meas[12] = measure q[12];
meas[13] = measure q[13];
meas[14] = measure q[14];