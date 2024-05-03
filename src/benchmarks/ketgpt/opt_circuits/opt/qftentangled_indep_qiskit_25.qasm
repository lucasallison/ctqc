OPENQASM 3.0;
include "stdgates.inc";
bit[25] meas;
qubit[25] q;
h q[24];
cx q[24], q[23];
cx q[23], q[22];
cx q[22], q[21];
cx q[21], q[20];
cx q[20], q[19];
cx q[19], q[18];
cx q[18], q[17];
cx q[17], q[16];
cx q[16], q[15];
cx q[15], q[14];
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
h q[24];
rz(1.5707962331681393) q[24];
cx q[24], q[23];
rz(-pi/4) q[23];
cx q[24], q[23];
rz(pi/4) q[23];
h q[23];
rz(1.5707961395413823) q[23];
cx q[24], q[22];
rz(-pi/8) q[22];
cx q[24], q[22];
rz(pi/8) q[22];
cx q[23], q[22];
rz(-pi/4) q[22];
cx q[23], q[22];
rz(pi/4) q[22];
h q[22];
rz(1.570795952287868) q[22];
cx q[24], q[21];
rz(-pi/16) q[21];
cx q[24], q[21];
rz(pi/16) q[21];
cx q[23], q[21];
rz(-pi/8) q[21];
cx q[23], q[21];
rz(pi/8) q[21];
cx q[22], q[21];
rz(-pi/4) q[21];
cx q[22], q[21];
rz(pi/4) q[21];
h q[21];
rz(1.5707955777808398) q[21];
cx q[24], q[20];
rz(-pi/32) q[20];
cx q[24], q[20];
rz(pi/32) q[20];
cx q[23], q[20];
rz(-pi/16) q[20];
cx q[23], q[20];
rz(pi/16) q[20];
cx q[22], q[20];
rz(-pi/8) q[20];
cx q[22], q[20];
rz(pi/8) q[20];
cx q[21], q[20];
rz(-pi/4) q[20];
cx q[21], q[20];
rz(pi/4) q[20];
h q[20];
rz(1.5707948287667832) q[20];
cx q[24], q[19];
rz(-pi/64) q[19];
cx q[24], q[19];
rz(pi/64) q[19];
cx q[23], q[19];
rz(-pi/32) q[19];
cx q[23], q[19];
rz(pi/32) q[19];
cx q[22], q[19];
rz(-pi/16) q[19];
cx q[22], q[19];
rz(pi/16) q[19];
cx q[21], q[19];
rz(-pi/8) q[19];
cx q[21], q[19];
rz(pi/8) q[19];
cx q[20], q[19];
rz(-pi/4) q[19];
cx q[20], q[19];
rz(pi/4) q[19];
h q[19];
rz(1.5707933307386701) q[19];
cx q[24], q[18];
rz(-pi/128) q[18];
cx q[24], q[18];
rz(pi/128) q[18];
cx q[23], q[18];
rz(-pi/64) q[18];
cx q[23], q[18];
rz(pi/64) q[18];
cx q[22], q[18];
rz(-pi/32) q[18];
cx q[22], q[18];
rz(pi/32) q[18];
cx q[21], q[18];
rz(-pi/16) q[18];
cx q[21], q[18];
rz(pi/16) q[18];
cx q[20], q[18];
rz(-pi/8) q[18];
cx q[20], q[18];
rz(pi/8) q[18];
cx q[19], q[18];
rz(-pi/4) q[18];
cx q[19], q[18];
rz(pi/4) q[18];
h q[18];
rz(1.5707903346824437) q[18];
cx q[24], q[17];
rz(-pi/256) q[17];
cx q[24], q[17];
rz(pi/256) q[17];
cx q[23], q[17];
rz(-pi/128) q[17];
cx q[23], q[17];
rz(pi/128) q[17];
cx q[22], q[17];
rz(-pi/64) q[17];
cx q[22], q[17];
rz(pi/64) q[17];
cx q[21], q[17];
rz(-pi/32) q[17];
cx q[21], q[17];
rz(pi/32) q[17];
cx q[20], q[17];
rz(-pi/16) q[17];
cx q[20], q[17];
rz(pi/16) q[17];
cx q[19], q[17];
rz(-pi/8) q[17];
cx q[19], q[17];
rz(pi/8) q[17];
cx q[18], q[17];
rz(-pi/4) q[17];
cx q[18], q[17];
rz(pi/4) q[17];
h q[17];
rz(1.570784342569991) q[17];
cx q[24], q[16];
rz(-pi/512) q[16];
cx q[24], q[16];
rz(pi/512) q[16];
cx q[23], q[16];
rz(-pi/256) q[16];
cx q[23], q[16];
rz(pi/256) q[16];
cx q[22], q[16];
rz(-pi/128) q[16];
cx q[22], q[16];
rz(pi/128) q[16];
cx q[21], q[16];
rz(-pi/64) q[16];
cx q[21], q[16];
rz(pi/64) q[16];
cx q[20], q[16];
rz(-pi/32) q[16];
cx q[20], q[16];
rz(pi/32) q[16];
cx q[19], q[16];
rz(-pi/16) q[16];
cx q[19], q[16];
rz(pi/16) q[16];
cx q[18], q[16];
rz(-pi/8) q[16];
cx q[18], q[16];
rz(pi/8) q[16];
cx q[17], q[16];
rz(-pi/4) q[16];
cx q[17], q[16];
rz(pi/4) q[16];
h q[16];
rz(1.5707723583450857) q[16];
cx q[24], q[15];
rz(-pi/1024) q[15];
cx q[24], q[15];
rz(pi/1024) q[15];
cx q[23], q[15];
rz(-pi/512) q[15];
cx q[23], q[15];
rz(pi/512) q[15];
cx q[22], q[15];
rz(-pi/256) q[15];
cx q[22], q[15];
rz(pi/256) q[15];
cx q[21], q[15];
rz(-pi/128) q[15];
cx q[21], q[15];
rz(pi/128) q[15];
cx q[20], q[15];
rz(-pi/64) q[15];
cx q[20], q[15];
rz(pi/64) q[15];
cx q[19], q[15];
rz(-pi/32) q[15];
cx q[19], q[15];
rz(pi/32) q[15];
cx q[18], q[15];
rz(-pi/16) q[15];
cx q[18], q[15];
rz(pi/16) q[15];
cx q[17], q[15];
rz(-pi/8) q[15];
cx q[17], q[15];
rz(pi/8) q[15];
cx q[16], q[15];
rz(-pi/4) q[15];
cx q[16], q[15];
rz(pi/4) q[15];
h q[15];
rz(1.570748389895275) q[15];
cx q[24], q[14];
rz(-pi/2048) q[14];
cx q[24], q[14];
rz(pi/2048) q[14];
cx q[23], q[14];
rz(-pi/1024) q[14];
cx q[23], q[14];
rz(pi/1024) q[14];
cx q[22], q[14];
rz(-pi/512) q[14];
cx q[22], q[14];
rz(pi/512) q[14];
cx q[21], q[14];
rz(-pi/256) q[14];
cx q[21], q[14];
rz(pi/256) q[14];
cx q[20], q[14];
rz(-pi/128) q[14];
cx q[20], q[14];
rz(pi/128) q[14];
cx q[19], q[14];
rz(-pi/64) q[14];
cx q[19], q[14];
rz(pi/64) q[14];
cx q[18], q[14];
rz(-pi/32) q[14];
cx q[18], q[14];
rz(pi/32) q[14];
cx q[17], q[14];
rz(-pi/16) q[14];
cx q[17], q[14];
rz(pi/16) q[14];
cx q[16], q[14];
rz(-pi/8) q[14];
cx q[16], q[14];
rz(pi/8) q[14];
cx q[15], q[14];
rz(-pi/4) q[14];
cx q[15], q[14];
rz(pi/4) q[14];
h q[14];
rz(1.5707004529956536) q[14];
cx q[24], q[13];
rz(-pi/4096) q[13];
cx q[24], q[13];
rz(pi/4096) q[13];
cx q[23], q[13];
rz(-pi/2048) q[13];
cx q[23], q[13];
rz(pi/2048) q[13];
cx q[22], q[13];
rz(-pi/1024) q[13];
cx q[22], q[13];
rz(pi/1024) q[13];
cx q[21], q[13];
rz(-pi/512) q[13];
cx q[21], q[13];
rz(pi/512) q[13];
cx q[20], q[13];
rz(-pi/256) q[13];
cx q[20], q[13];
rz(pi/256) q[13];
cx q[19], q[13];
rz(-pi/128) q[13];
cx q[19], q[13];
rz(pi/128) q[13];
cx q[18], q[13];
rz(-pi/64) q[13];
cx q[18], q[13];
rz(pi/64) q[13];
cx q[17], q[13];
rz(-pi/32) q[13];
cx q[17], q[13];
rz(pi/32) q[13];
cx q[16], q[13];
rz(-pi/16) q[13];
cx q[16], q[13];
rz(pi/16) q[13];
cx q[15], q[13];
rz(-pi/8) q[13];
cx q[15], q[13];
rz(pi/8) q[13];
cx q[14], q[13];
rz(-pi/4) q[13];
cx q[14], q[13];
rz(pi/4) q[13];
h q[13];
rz(1.5706045791964107) q[13];
cx q[24], q[12];
rz(-pi/8192) q[12];
cx q[24], q[12];
rz(pi/8192) q[12];
cx q[23], q[12];
rz(-pi/4096) q[12];
cx q[23], q[12];
rz(pi/4096) q[12];
cx q[22], q[12];
rz(-pi/2048) q[12];
cx q[22], q[12];
rz(pi/2048) q[12];
cx q[21], q[12];
rz(-pi/1024) q[12];
cx q[21], q[12];
rz(pi/1024) q[12];
cx q[20], q[12];
rz(-pi/512) q[12];
cx q[20], q[12];
rz(pi/512) q[12];
cx q[19], q[12];
rz(-pi/256) q[12];
cx q[19], q[12];
rz(pi/256) q[12];
cx q[18], q[12];
rz(-pi/128) q[12];
cx q[18], q[12];
rz(pi/128) q[12];
cx q[17], q[12];
rz(-pi/64) q[12];
cx q[17], q[12];
rz(pi/64) q[12];
cx q[16], q[12];
rz(-pi/32) q[12];
cx q[16], q[12];
rz(pi/32) q[12];
cx q[15], q[12];
rz(-pi/16) q[12];
cx q[15], q[12];
rz(pi/16) q[12];
cx q[14], q[12];
rz(-pi/8) q[12];
cx q[14], q[12];
rz(pi/8) q[12];
cx q[13], q[12];
rz(-pi/4) q[12];
cx q[13], q[12];
rz(pi/4) q[12];
h q[12];
rz(1.570412831597925) q[12];
cx q[24], q[11];
rz(-pi/16384) q[11];
cx q[24], q[11];
rz(pi/16384) q[11];
cx q[23], q[11];
rz(-pi/8192) q[11];
cx q[23], q[11];
rz(pi/8192) q[11];
cx q[22], q[11];
rz(-pi/4096) q[11];
cx q[22], q[11];
rz(pi/4096) q[11];
cx q[21], q[11];
rz(-pi/2048) q[11];
cx q[21], q[11];
rz(pi/2048) q[11];
cx q[20], q[11];
rz(-pi/1024) q[11];
cx q[20], q[11];
rz(pi/1024) q[11];
cx q[19], q[11];
rz(-pi/512) q[11];
cx q[19], q[11];
rz(pi/512) q[11];
cx q[18], q[11];
rz(-pi/256) q[11];
cx q[18], q[11];
rz(pi/256) q[11];
cx q[17], q[11];
rz(-pi/128) q[11];
cx q[17], q[11];
rz(pi/128) q[11];
cx q[16], q[11];
rz(-pi/64) q[11];
cx q[16], q[11];
rz(pi/64) q[11];
cx q[15], q[11];
rz(-pi/32) q[11];
cx q[15], q[11];
rz(pi/32) q[11];
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
rz(1.5700293364009537) q[11];
cx q[24], q[10];
rz(-pi/32768) q[10];
cx q[24], q[10];
rz(pi/32768) q[10];
cx q[23], q[10];
rz(-pi/16384) q[10];
cx q[23], q[10];
rz(pi/16384) q[10];
cx q[22], q[10];
rz(-pi/8192) q[10];
cx q[22], q[10];
rz(pi/8192) q[10];
cx q[21], q[10];
rz(-pi/4096) q[10];
cx q[21], q[10];
rz(pi/4096) q[10];
cx q[20], q[10];
rz(-pi/2048) q[10];
cx q[20], q[10];
rz(pi/2048) q[10];
cx q[19], q[10];
rz(-pi/1024) q[10];
cx q[19], q[10];
rz(pi/1024) q[10];
cx q[18], q[10];
rz(-pi/512) q[10];
cx q[18], q[10];
rz(pi/512) q[10];
cx q[17], q[10];
rz(-pi/256) q[10];
cx q[17], q[10];
rz(pi/256) q[10];
cx q[16], q[10];
rz(-pi/128) q[10];
cx q[16], q[10];
rz(pi/128) q[10];
cx q[15], q[10];
rz(-pi/64) q[10];
cx q[15], q[10];
rz(pi/64) q[10];
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
rz(1.5692623460070108) q[10];
cx q[24], q[9];
rz(-pi/65536) q[9];
cx q[24], q[9];
rz(pi/65536) q[9];
cx q[23], q[9];
rz(-pi/32768) q[9];
cx q[23], q[9];
rz(pi/32768) q[9];
cx q[22], q[9];
rz(-pi/16384) q[9];
cx q[22], q[9];
rz(pi/16384) q[9];
cx q[21], q[9];
rz(-pi/8192) q[9];
cx q[21], q[9];
rz(pi/8192) q[9];
cx q[20], q[9];
rz(-pi/4096) q[9];
cx q[20], q[9];
rz(pi/4096) q[9];
cx q[19], q[9];
rz(-pi/2048) q[9];
cx q[19], q[9];
rz(pi/2048) q[9];
cx q[18], q[9];
rz(-pi/1024) q[9];
cx q[18], q[9];
rz(pi/1024) q[9];
cx q[17], q[9];
rz(-pi/512) q[9];
cx q[17], q[9];
rz(pi/512) q[9];
cx q[16], q[9];
rz(-pi/256) q[9];
cx q[16], q[9];
rz(pi/256) q[9];
cx q[15], q[9];
rz(-pi/128) q[9];
cx q[15], q[9];
rz(pi/128) q[9];
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
rz(1.5677283652191252) q[9];
cx q[24], q[8];
rz(-pi/131072) q[8];
cx q[24], q[8];
rz(pi/131072) q[8];
cx q[23], q[8];
rz(-pi/65536) q[8];
cx q[23], q[8];
rz(pi/65536) q[8];
cx q[22], q[8];
rz(-pi/32768) q[8];
cx q[22], q[8];
rz(pi/32768) q[8];
cx q[21], q[8];
rz(-pi/16384) q[8];
cx q[21], q[8];
rz(pi/16384) q[8];
cx q[20], q[8];
rz(-pi/8192) q[8];
cx q[20], q[8];
rz(pi/8192) q[8];
cx q[19], q[8];
rz(-pi/4096) q[8];
cx q[19], q[8];
rz(pi/4096) q[8];
cx q[18], q[8];
rz(-pi/2048) q[8];
cx q[18], q[8];
rz(pi/2048) q[8];
cx q[17], q[8];
rz(-pi/1024) q[8];
cx q[17], q[8];
rz(pi/1024) q[8];
cx q[16], q[8];
rz(-pi/512) q[8];
cx q[16], q[8];
rz(pi/512) q[8];
cx q[15], q[8];
rz(-pi/256) q[8];
cx q[15], q[8];
rz(pi/256) q[8];
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
rz(1.5646604036433538) q[8];
cx q[24], q[7];
rz(-pi/262144) q[7];
cx q[24], q[7];
rz(pi/262144) q[7];
cx q[23], q[7];
rz(-pi/131072) q[7];
cx q[23], q[7];
rz(pi/131072) q[7];
cx q[22], q[7];
rz(-pi/65536) q[7];
cx q[22], q[7];
rz(pi/65536) q[7];
cx q[21], q[7];
rz(-pi/32768) q[7];
cx q[21], q[7];
rz(pi/32768) q[7];
cx q[20], q[7];
rz(-pi/16384) q[7];
cx q[20], q[7];
rz(pi/16384) q[7];
cx q[19], q[7];
rz(-pi/8192) q[7];
cx q[19], q[7];
rz(pi/8192) q[7];
cx q[18], q[7];
rz(-pi/4096) q[7];
cx q[18], q[7];
rz(pi/4096) q[7];
cx q[17], q[7];
rz(-pi/2048) q[7];
cx q[17], q[7];
rz(pi/2048) q[7];
cx q[16], q[7];
rz(-pi/1024) q[7];
cx q[16], q[7];
rz(pi/1024) q[7];
cx q[15], q[7];
rz(-pi/512) q[7];
cx q[15], q[7];
rz(pi/512) q[7];
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
rz(1.5585244804918112) q[7];
cx q[23], q[6];
rz(-pi/262144) q[6];
cx q[23], q[6];
rz(pi/262144) q[6];
cx q[22], q[6];
rz(-pi/131072) q[6];
cx q[22], q[6];
rz(pi/131072) q[6];
cx q[21], q[6];
rz(-pi/65536) q[6];
cx q[21], q[6];
rz(pi/65536) q[6];
cx q[20], q[6];
rz(-pi/32768) q[6];
cx q[20], q[6];
rz(pi/32768) q[6];
cx q[19], q[6];
rz(-pi/16384) q[6];
cx q[19], q[6];
rz(pi/16384) q[6];
cx q[18], q[6];
rz(-pi/8192) q[6];
cx q[18], q[6];
rz(pi/8192) q[6];
cx q[17], q[6];
rz(-pi/4096) q[6];
cx q[17], q[6];
rz(pi/4096) q[6];
cx q[16], q[6];
rz(-pi/2048) q[6];
cx q[16], q[6];
rz(pi/2048) q[6];
cx q[15], q[6];
rz(-pi/1024) q[6];
cx q[15], q[6];
rz(pi/1024) q[6];
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
rz(1.5462526341887262) q[6];
cx q[22], q[5];
rz(-pi/262144) q[5];
cx q[22], q[5];
rz(pi/262144) q[5];
cx q[21], q[5];
rz(-pi/131072) q[5];
cx q[21], q[5];
rz(pi/131072) q[5];
cx q[20], q[5];
rz(-pi/65536) q[5];
cx q[20], q[5];
rz(pi/65536) q[5];
cx q[19], q[5];
rz(-pi/32768) q[5];
cx q[19], q[5];
rz(pi/32768) q[5];
cx q[18], q[5];
rz(-pi/16384) q[5];
cx q[18], q[5];
rz(pi/16384) q[5];
cx q[17], q[5];
rz(-pi/8192) q[5];
cx q[17], q[5];
rz(pi/8192) q[5];
cx q[16], q[5];
rz(-pi/4096) q[5];
cx q[16], q[5];
rz(pi/4096) q[5];
cx q[15], q[5];
rz(-pi/2048) q[5];
cx q[15], q[5];
rz(pi/2048) q[5];
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
rz(1.521708941582556) q[5];
cx q[21], q[4];
rz(-pi/262144) q[4];
cx q[21], q[4];
rz(pi/262144) q[4];
cx q[20], q[4];
rz(-pi/131072) q[4];
cx q[20], q[4];
rz(pi/131072) q[4];
cx q[19], q[4];
rz(-pi/65536) q[4];
cx q[19], q[4];
rz(pi/65536) q[4];
cx q[18], q[4];
rz(-pi/32768) q[4];
cx q[18], q[4];
rz(pi/32768) q[4];
cx q[17], q[4];
rz(-pi/16384) q[4];
cx q[17], q[4];
rz(pi/16384) q[4];
cx q[16], q[4];
rz(-pi/8192) q[4];
cx q[16], q[4];
rz(pi/8192) q[4];
cx q[15], q[4];
rz(-pi/4096) q[4];
cx q[15], q[4];
rz(pi/4096) q[4];
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
rz(1.4726215563702154) q[4];
cx q[20], q[3];
rz(-pi/262144) q[3];
cx q[20], q[3];
rz(pi/262144) q[3];
cx q[19], q[3];
rz(-pi/131072) q[3];
cx q[19], q[3];
rz(pi/131072) q[3];
cx q[18], q[3];
rz(-pi/65536) q[3];
cx q[18], q[3];
rz(pi/65536) q[3];
cx q[17], q[3];
rz(-pi/32768) q[3];
cx q[17], q[3];
rz(pi/32768) q[3];
cx q[16], q[3];
rz(-pi/16384) q[3];
cx q[16], q[3];
rz(pi/16384) q[3];
cx q[15], q[3];
rz(-pi/8192) q[3];
cx q[15], q[3];
rz(pi/8192) q[3];
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
rz(7*pi/16) q[3];
cx q[19], q[2];
rz(-pi/262144) q[2];
cx q[19], q[2];
rz(pi/262144) q[2];
cx q[18], q[2];
rz(-pi/131072) q[2];
cx q[18], q[2];
rz(pi/131072) q[2];
cx q[17], q[2];
rz(-pi/65536) q[2];
cx q[17], q[2];
rz(pi/65536) q[2];
cx q[16], q[2];
rz(-pi/32768) q[2];
cx q[16], q[2];
rz(pi/32768) q[2];
cx q[15], q[2];
rz(-pi/16384) q[2];
cx q[15], q[2];
rz(pi/16384) q[2];
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
rz(3*pi/8) q[2];
cx q[18], q[1];
rz(-pi/262144) q[1];
cx q[18], q[1];
rz(pi/262144) q[1];
cx q[17], q[1];
rz(-pi/131072) q[1];
cx q[17], q[1];
rz(pi/131072) q[1];
cx q[16], q[1];
rz(-pi/65536) q[1];
cx q[16], q[1];
rz(pi/65536) q[1];
cx q[15], q[1];
rz(-pi/32768) q[1];
cx q[15], q[1];
rz(pi/32768) q[1];
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
cx q[17], q[0];
rz(-pi/262144) q[0];
cx q[17], q[0];
rz(pi/262144) q[0];
cx q[16], q[0];
rz(-pi/131072) q[0];
cx q[16], q[0];
rz(pi/131072) q[0];
cx q[15], q[0];
rz(-pi/65536) q[0];
cx q[15], q[0];
rz(pi/65536) q[0];
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
cx q[0], q[24];
cx q[1], q[23];
cx q[2], q[22];
cx q[3], q[21];
cx q[4], q[20];
cx q[5], q[19];
cx q[6], q[18];
cx q[7], q[17];
cx q[8], q[16];
cx q[9], q[15];
cx q[10], q[14];
cx q[11], q[13];
cx q[13], q[11];
cx q[11], q[13];
cx q[14], q[10];
cx q[10], q[14];
cx q[15], q[9];
cx q[9], q[15];
cx q[16], q[8];
cx q[8], q[16];
cx q[17], q[7];
cx q[7], q[17];
cx q[18], q[6];
cx q[6], q[18];
cx q[19], q[5];
cx q[5], q[19];
cx q[20], q[4];
cx q[4], q[20];
cx q[21], q[3];
cx q[3], q[21];
cx q[22], q[2];
cx q[2], q[22];
cx q[23], q[1];
cx q[1], q[23];
cx q[24], q[0];
cx q[0], q[24];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], q[11], q[12], q[13], q[14], q[15], q[16], q[17], q[18], q[19], q[20], q[21], q[22], q[23], q[24];
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
meas[15] = measure q[15];
meas[16] = measure q[16];
meas[17] = measure q[17];
meas[18] = measure q[18];
meas[19] = measure q[19];
meas[20] = measure q[20];
meas[21] = measure q[21];
meas[22] = measure q[22];
meas[23] = measure q[23];
meas[24] = measure q[24];
