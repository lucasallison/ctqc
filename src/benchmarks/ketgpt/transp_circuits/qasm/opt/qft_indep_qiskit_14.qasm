OPENQASM 3.0;
include "stdgates.inc";
bit[14] c;
bit[14] meas;
qubit[14] q;
h q[13];
rz(1.5706045791964107) q[13];
cx q[13], q[12];
rz(-pi/4) q[12];
cx q[13], q[12];
rz(pi/4) q[12];
h q[12];
rz(1.570412831597925) q[12];
cx q[13], q[11];
rz(-pi/8) q[11];
cx q[13], q[11];
rz(pi/8) q[11];
cx q[12], q[11];
rz(-pi/4) q[11];
cx q[12], q[11];
rz(pi/4) q[11];
h q[11];
rz(1.5700293364009537) q[11];
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
rz(1.5692623460070108) q[10];
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
rz(1.5677283652191252) q[9];
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
rz(1.5646604036433538) q[8];
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
rz(1.5585244804918112) q[7];
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
rz(1.5462526341887262) q[6];
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
rz(1.521708941582556) q[5];
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
rz(1.4726215563702154) q[4];
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
rz(7*pi/16) q[3];
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
rz(3*pi/8) q[2];
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
cx q[0], q[13];
cx q[1], q[12];
cx q[2], q[11];
cx q[3], q[10];
cx q[4], q[9];
cx q[5], q[8];
cx q[6], q[7];
cx q[7], q[6];
cx q[6], q[7];
cx q[8], q[5];
cx q[5], q[8];
cx q[9], q[4];
cx q[4], q[9];
cx q[10], q[3];
cx q[3], q[10];
cx q[11], q[2];
cx q[2], q[11];
cx q[12], q[1];
cx q[1], q[12];
cx q[13], q[0];
cx q[0], q[13];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], q[11], q[12], q[13];
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