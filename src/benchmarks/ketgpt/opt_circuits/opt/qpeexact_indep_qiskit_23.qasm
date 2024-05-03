OPENQASM 3.0;
include "stdgates.inc";
bit[22] c;
qubit[22] q;
qubit[1] psi;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];
h q[12];
h q[13];
h q[14];
h q[15];
h q[16];
h q[17];
h q[18];
h q[19];
h q[20];
h q[21];
h psi[0];
rz(pi) psi[0];
h psi[0];
rz(1.3464786010726586) psi[0];
cx psi[0], q[0];
rz(1.3464786010726586) q[0];
cx psi[0], q[0];
rz(-1.3464786010726586) q[0];
cx q[0], q[21];
cx q[21], q[0];
cx q[0], q[21];
h q[0];
rz(-pi/4194304) q[21];
rz(-1.5707948287667834) q[21];
cx psi[0], q[1];
rz(-0.4486354514444759) q[1];
cx psi[0], q[1];
rz(0.4486354514444759) q[1];
cx q[1], q[20];
cx q[20], q[1];
cx q[1], q[20];
rz(-pi/4) q[1];
cx q[1], q[0];
rz(pi/4) q[0];
cx q[1], q[0];
rz(-pi/4) q[0];
h q[1];
rz(-pi/2097152) q[20];
rz(-1.5707933307386703) q[20];
cx psi[0], q[2];
rz(-0.8972709028889518) q[2];
cx psi[0], q[2];
rz(0.8972709028889518) q[2];
cx psi[0], q[3];
rz(1.3470508478118894) q[3];
cx psi[0], q[3];
rz(-1.3470508478118894) q[3];
cx psi[0], q[4];
rz(-0.4474909579660144) q[4];
cx psi[0], q[4];
rz(0.4474909579660144) q[4];
cx psi[0], q[5];
rz(-0.8949819159320288) q[5];
cx psi[0], q[5];
rz(0.8949819159320288) q[5];
cx psi[0], q[6];
rz(1.3516288217257355) q[6];
cx psi[0], q[6];
rz(-1.3516288217257355) q[6];
cx psi[0], q[7];
rz(-0.438335010138322) q[7];
cx psi[0], q[7];
rz(0.438335010138322) q[7];
cx psi[0], q[8];
rz(-0.876670020276644) q[8];
cx psi[0], q[8];
rz(0.876670020276644) q[8];
cx psi[0], q[9];
rz(1.3882526130365052) q[9];
cx psi[0], q[9];
rz(-1.3882526130365052) q[9];
cx psi[0], q[10];
rz(-0.3650874275167826) q[10];
cx psi[0], q[10];
rz(0.3650874275167826) q[10];
cx psi[0], q[11];
rz(-0.7301748550335652) q[11];
cx psi[0], q[11];
rz(0.7301748550335652) q[11];
cx q[10], q[11];
cx q[11], q[10];
cx q[10], q[11];
rz(-1.569262346007011) q[10];
rz(-1.5700293364009537) q[11];
cx psi[0], q[12];
rz(-1.4603497100671303) q[12];
cx psi[0], q[12];
rz(1.4603497100671303) q[12];
cx q[9], q[12];
cx q[12], q[9];
cx q[9], q[12];
rz(-1.5677283652191254) q[9];
rz(-1.570412831597925) q[12];
cx psi[0], q[13];
rz(0.22089323345553233) q[13];
cx psi[0], q[13];
rz(-0.22089323345553233) q[13];
cx q[8], q[13];
cx q[13], q[8];
cx q[8], q[13];
rz(-1.564660403643354) q[8];
rz(-1.5706045791964107) q[13];
cx psi[0], q[14];
rz(0.44178646691106466) q[14];
cx psi[0], q[14];
rz(-0.44178646691106466) q[14];
cx q[7], q[14];
cx q[14], q[7];
cx q[7], q[14];
rz(-1.5585244804918115) q[7];
rz(-1.5707004529956536) q[14];
cx psi[0], q[15];
rz(0.8835729338221293) q[15];
cx psi[0], q[15];
rz(-0.8835729338221293) q[15];
cx q[6], q[15];
cx q[15], q[6];
cx q[6], q[15];
rz(-1.5462526341887264) q[6];
rz(-1.5707483898952752) q[15];
cx psi[0], q[16];
rz(-7*pi/16) q[16];
cx psi[0], q[16];
rz(7*pi/16) q[16];
cx q[5], q[16];
cx q[16], q[5];
cx q[5], q[16];
rz(-1.521708941582556) q[5];
rz(-1.5707723583450859) q[16];
cx psi[0], q[17];
rz(pi/8) q[17];
cx psi[0], q[17];
rz(-pi/8) q[17];
cx q[4], q[17];
cx q[17], q[4];
cx q[4], q[17];
rz(-1.4726215563702154) q[4];
rz(-1.5707843425699912) q[17];
cx psi[0], q[18];
rz(pi/4) q[18];
cx psi[0], q[18];
rz(-pi/4) q[18];
cx q[3], q[18];
cx q[18], q[3];
cx q[3], q[18];
rz(-7*pi/16) q[3];
rz(-pi/524288) q[18];
rz(-1.5707843425699912) q[18];
cx psi[0], q[19];
rz(-pi/2) q[19];
cx psi[0], q[19];
rz(pi/2) q[19];
cx q[2], q[19];
cx q[19], q[2];
cx q[2], q[19];
rz(-3*pi/8) q[2];
cx q[2], q[0];
rz(pi/8) q[0];
cx q[2], q[0];
rz(-pi/8) q[0];
cx q[2], q[1];
rz(pi/4) q[1];
cx q[2], q[1];
rz(-pi/4) q[1];
h q[2];
cx q[3], q[0];
rz(pi/16) q[0];
cx q[3], q[0];
rz(-pi/16) q[0];
cx q[3], q[1];
rz(pi/8) q[1];
cx q[3], q[1];
rz(-pi/8) q[1];
cx q[3], q[2];
rz(pi/4) q[2];
cx q[3], q[2];
rz(-pi/4) q[2];
h q[3];
cx q[4], q[0];
rz(pi/32) q[0];
cx q[4], q[0];
rz(-pi/32) q[0];
cx q[4], q[1];
rz(pi/16) q[1];
cx q[4], q[1];
rz(-pi/16) q[1];
cx q[4], q[2];
rz(pi/8) q[2];
cx q[4], q[2];
rz(-pi/8) q[2];
cx q[4], q[3];
rz(pi/4) q[3];
cx q[4], q[3];
rz(-pi/4) q[3];
h q[4];
cx q[5], q[0];
rz(pi/64) q[0];
cx q[5], q[0];
rz(-pi/64) q[0];
cx q[5], q[1];
rz(pi/32) q[1];
cx q[5], q[1];
rz(-pi/32) q[1];
cx q[5], q[2];
rz(pi/16) q[2];
cx q[5], q[2];
rz(-pi/16) q[2];
cx q[5], q[3];
rz(pi/8) q[3];
cx q[5], q[3];
rz(-pi/8) q[3];
cx q[5], q[4];
rz(pi/4) q[4];
cx q[5], q[4];
rz(-pi/4) q[4];
h q[5];
cx q[6], q[0];
rz(pi/128) q[0];
cx q[6], q[0];
rz(-pi/128) q[0];
cx q[6], q[1];
rz(pi/64) q[1];
cx q[6], q[1];
rz(-pi/64) q[1];
cx q[6], q[2];
rz(pi/32) q[2];
cx q[6], q[2];
rz(-pi/32) q[2];
cx q[6], q[3];
rz(pi/16) q[3];
cx q[6], q[3];
rz(-pi/16) q[3];
cx q[6], q[4];
rz(pi/8) q[4];
cx q[6], q[4];
rz(-pi/8) q[4];
cx q[6], q[5];
rz(pi/4) q[5];
cx q[6], q[5];
rz(-pi/4) q[5];
h q[6];
cx q[7], q[0];
rz(pi/256) q[0];
cx q[7], q[0];
rz(-pi/256) q[0];
cx q[7], q[1];
rz(pi/128) q[1];
cx q[7], q[1];
rz(-pi/128) q[1];
cx q[7], q[2];
rz(pi/64) q[2];
cx q[7], q[2];
rz(-pi/64) q[2];
cx q[7], q[3];
rz(pi/32) q[3];
cx q[7], q[3];
rz(-pi/32) q[3];
cx q[7], q[4];
rz(pi/16) q[4];
cx q[7], q[4];
rz(-pi/16) q[4];
cx q[7], q[5];
rz(pi/8) q[5];
cx q[7], q[5];
rz(-pi/8) q[5];
cx q[7], q[6];
rz(pi/4) q[6];
cx q[7], q[6];
rz(-pi/4) q[6];
h q[7];
cx q[8], q[0];
rz(pi/512) q[0];
cx q[8], q[0];
rz(-pi/512) q[0];
cx q[8], q[1];
rz(pi/256) q[1];
cx q[8], q[1];
rz(-pi/256) q[1];
cx q[8], q[2];
rz(pi/128) q[2];
cx q[8], q[2];
rz(-pi/128) q[2];
cx q[8], q[3];
rz(pi/64) q[3];
cx q[8], q[3];
rz(-pi/64) q[3];
cx q[8], q[4];
rz(pi/32) q[4];
cx q[8], q[4];
rz(-pi/32) q[4];
cx q[8], q[5];
rz(pi/16) q[5];
cx q[8], q[5];
rz(-pi/16) q[5];
cx q[8], q[6];
rz(pi/8) q[6];
cx q[8], q[6];
rz(-pi/8) q[6];
cx q[8], q[7];
rz(pi/4) q[7];
cx q[8], q[7];
rz(-pi/4) q[7];
h q[8];
cx q[9], q[0];
rz(pi/1024) q[0];
cx q[9], q[0];
rz(-pi/1024) q[0];
cx q[9], q[1];
rz(pi/512) q[1];
cx q[9], q[1];
rz(-pi/512) q[1];
cx q[9], q[2];
rz(pi/256) q[2];
cx q[9], q[2];
rz(-pi/256) q[2];
cx q[9], q[3];
rz(pi/128) q[3];
cx q[9], q[3];
rz(-pi/128) q[3];
cx q[9], q[4];
rz(pi/64) q[4];
cx q[9], q[4];
rz(-pi/64) q[4];
cx q[9], q[5];
rz(pi/32) q[5];
cx q[9], q[5];
rz(-pi/32) q[5];
cx q[9], q[6];
rz(pi/16) q[6];
cx q[9], q[6];
rz(-pi/16) q[6];
cx q[9], q[7];
rz(pi/8) q[7];
cx q[9], q[7];
rz(-pi/8) q[7];
cx q[9], q[8];
rz(pi/4) q[8];
cx q[9], q[8];
rz(-pi/4) q[8];
h q[9];
cx q[10], q[0];
rz(pi/2048) q[0];
cx q[10], q[0];
rz(-pi/2048) q[0];
cx q[10], q[1];
rz(pi/1024) q[1];
cx q[10], q[1];
rz(-pi/1024) q[1];
cx q[10], q[2];
rz(pi/512) q[2];
cx q[10], q[2];
rz(-pi/512) q[2];
cx q[10], q[3];
rz(pi/256) q[3];
cx q[10], q[3];
rz(-pi/256) q[3];
cx q[10], q[4];
rz(pi/128) q[4];
cx q[10], q[4];
rz(-pi/128) q[4];
cx q[10], q[5];
rz(pi/64) q[5];
cx q[10], q[5];
rz(-pi/64) q[5];
cx q[10], q[6];
rz(pi/32) q[6];
cx q[10], q[6];
rz(-pi/32) q[6];
cx q[10], q[7];
rz(pi/16) q[7];
cx q[10], q[7];
rz(-pi/16) q[7];
cx q[10], q[8];
rz(pi/8) q[8];
cx q[10], q[8];
rz(-pi/8) q[8];
cx q[10], q[9];
rz(pi/4) q[9];
cx q[10], q[9];
rz(-pi/4) q[9];
h q[10];
cx q[11], q[0];
rz(pi/4096) q[0];
cx q[11], q[0];
rz(-pi/4096) q[0];
cx q[11], q[1];
rz(pi/2048) q[1];
cx q[11], q[1];
rz(-pi/2048) q[1];
cx q[11], q[2];
rz(pi/1024) q[2];
cx q[11], q[2];
rz(-pi/1024) q[2];
cx q[11], q[3];
rz(pi/512) q[3];
cx q[11], q[3];
rz(-pi/512) q[3];
cx q[11], q[4];
rz(pi/256) q[4];
cx q[11], q[4];
rz(-pi/256) q[4];
cx q[11], q[5];
rz(pi/128) q[5];
cx q[11], q[5];
rz(-pi/128) q[5];
cx q[11], q[6];
rz(pi/64) q[6];
cx q[11], q[6];
rz(-pi/64) q[6];
cx q[11], q[7];
rz(pi/32) q[7];
cx q[11], q[7];
rz(-pi/32) q[7];
cx q[11], q[8];
rz(pi/16) q[8];
cx q[11], q[8];
rz(-pi/16) q[8];
cx q[11], q[9];
rz(pi/8) q[9];
cx q[11], q[9];
rz(-pi/8) q[9];
cx q[11], q[10];
rz(pi/4) q[10];
cx q[11], q[10];
rz(-pi/4) q[10];
h q[11];
cx q[12], q[0];
rz(pi/8192) q[0];
cx q[12], q[0];
rz(-pi/8192) q[0];
cx q[12], q[1];
rz(pi/4096) q[1];
cx q[12], q[1];
rz(-pi/4096) q[1];
cx q[12], q[2];
rz(pi/2048) q[2];
cx q[12], q[2];
rz(-pi/2048) q[2];
cx q[12], q[3];
rz(pi/1024) q[3];
cx q[12], q[3];
rz(-pi/1024) q[3];
cx q[12], q[4];
rz(pi/512) q[4];
cx q[12], q[4];
rz(-pi/512) q[4];
cx q[12], q[5];
rz(pi/256) q[5];
cx q[12], q[5];
rz(-pi/256) q[5];
cx q[12], q[6];
rz(pi/128) q[6];
cx q[12], q[6];
rz(-pi/128) q[6];
cx q[12], q[7];
rz(pi/64) q[7];
cx q[12], q[7];
rz(-pi/64) q[7];
cx q[12], q[8];
rz(pi/32) q[8];
cx q[12], q[8];
rz(-pi/32) q[8];
cx q[12], q[9];
rz(pi/16) q[9];
cx q[12], q[9];
rz(-pi/16) q[9];
cx q[12], q[10];
rz(pi/8) q[10];
cx q[12], q[10];
rz(-pi/8) q[10];
cx q[12], q[11];
rz(pi/4) q[11];
cx q[12], q[11];
rz(-pi/4) q[11];
h q[12];
cx q[13], q[0];
rz(pi/16384) q[0];
cx q[13], q[0];
rz(-pi/16384) q[0];
cx q[13], q[1];
rz(pi/8192) q[1];
cx q[13], q[1];
rz(-pi/8192) q[1];
cx q[13], q[2];
rz(pi/4096) q[2];
cx q[13], q[2];
rz(-pi/4096) q[2];
cx q[13], q[3];
rz(pi/2048) q[3];
cx q[13], q[3];
rz(-pi/2048) q[3];
cx q[13], q[4];
rz(pi/1024) q[4];
cx q[13], q[4];
rz(-pi/1024) q[4];
cx q[13], q[5];
rz(pi/512) q[5];
cx q[13], q[5];
rz(-pi/512) q[5];
cx q[13], q[6];
rz(pi/256) q[6];
cx q[13], q[6];
rz(-pi/256) q[6];
cx q[13], q[7];
rz(pi/128) q[7];
cx q[13], q[7];
rz(-pi/128) q[7];
cx q[13], q[8];
rz(pi/64) q[8];
cx q[13], q[8];
rz(-pi/64) q[8];
cx q[13], q[9];
rz(pi/32) q[9];
cx q[13], q[9];
rz(-pi/32) q[9];
cx q[13], q[10];
rz(pi/16) q[10];
cx q[13], q[10];
rz(-pi/16) q[10];
cx q[13], q[11];
rz(pi/8) q[11];
cx q[13], q[11];
rz(-pi/8) q[11];
cx q[13], q[12];
rz(pi/4) q[12];
cx q[13], q[12];
rz(-pi/4) q[12];
h q[13];
cx q[14], q[0];
rz(pi/32768) q[0];
cx q[14], q[0];
rz(-pi/32768) q[0];
cx q[14], q[1];
rz(pi/16384) q[1];
cx q[14], q[1];
rz(-pi/16384) q[1];
cx q[14], q[2];
rz(pi/8192) q[2];
cx q[14], q[2];
rz(-pi/8192) q[2];
cx q[14], q[3];
rz(pi/4096) q[3];
cx q[14], q[3];
rz(-pi/4096) q[3];
cx q[14], q[4];
rz(pi/2048) q[4];
cx q[14], q[4];
rz(-pi/2048) q[4];
cx q[14], q[5];
rz(pi/1024) q[5];
cx q[14], q[5];
rz(-pi/1024) q[5];
cx q[14], q[6];
rz(pi/512) q[6];
cx q[14], q[6];
rz(-pi/512) q[6];
cx q[14], q[7];
rz(pi/256) q[7];
cx q[14], q[7];
rz(-pi/256) q[7];
cx q[14], q[8];
rz(pi/128) q[8];
cx q[14], q[8];
rz(-pi/128) q[8];
cx q[14], q[9];
rz(pi/64) q[9];
cx q[14], q[9];
rz(-pi/64) q[9];
cx q[14], q[10];
rz(pi/32) q[10];
cx q[14], q[10];
rz(-pi/32) q[10];
cx q[14], q[11];
rz(pi/16) q[11];
cx q[14], q[11];
rz(-pi/16) q[11];
cx q[14], q[12];
rz(pi/8) q[12];
cx q[14], q[12];
rz(-pi/8) q[12];
cx q[14], q[13];
rz(pi/4) q[13];
cx q[14], q[13];
rz(-pi/4) q[13];
h q[14];
cx q[15], q[0];
rz(pi/65536) q[0];
cx q[15], q[0];
rz(-pi/65536) q[0];
cx q[15], q[1];
rz(pi/32768) q[1];
cx q[15], q[1];
rz(-pi/32768) q[1];
cx q[15], q[2];
rz(pi/16384) q[2];
cx q[15], q[2];
rz(-pi/16384) q[2];
cx q[15], q[3];
rz(pi/8192) q[3];
cx q[15], q[3];
rz(-pi/8192) q[3];
cx q[15], q[4];
rz(pi/4096) q[4];
cx q[15], q[4];
rz(-pi/4096) q[4];
cx q[15], q[5];
rz(pi/2048) q[5];
cx q[15], q[5];
rz(-pi/2048) q[5];
cx q[15], q[6];
rz(pi/1024) q[6];
cx q[15], q[6];
rz(-pi/1024) q[6];
cx q[15], q[7];
rz(pi/512) q[7];
cx q[15], q[7];
rz(-pi/512) q[7];
cx q[15], q[8];
rz(pi/256) q[8];
cx q[15], q[8];
rz(-pi/256) q[8];
cx q[15], q[9];
rz(pi/128) q[9];
cx q[15], q[9];
rz(-pi/128) q[9];
cx q[15], q[10];
rz(pi/64) q[10];
cx q[15], q[10];
rz(-pi/64) q[10];
cx q[15], q[11];
rz(pi/32) q[11];
cx q[15], q[11];
rz(-pi/32) q[11];
cx q[15], q[12];
rz(pi/16) q[12];
cx q[15], q[12];
rz(-pi/16) q[12];
cx q[15], q[13];
rz(pi/8) q[13];
cx q[15], q[13];
rz(-pi/8) q[13];
cx q[15], q[14];
rz(pi/4) q[14];
cx q[15], q[14];
rz(-pi/4) q[14];
h q[15];
cx q[16], q[0];
rz(pi/131072) q[0];
cx q[16], q[0];
rz(-pi/131072) q[0];
cx q[16], q[1];
rz(pi/65536) q[1];
cx q[16], q[1];
rz(-pi/65536) q[1];
cx q[16], q[2];
rz(pi/32768) q[2];
cx q[16], q[2];
rz(-pi/32768) q[2];
cx q[16], q[3];
rz(pi/16384) q[3];
cx q[16], q[3];
rz(-pi/16384) q[3];
cx q[16], q[4];
rz(pi/8192) q[4];
cx q[16], q[4];
rz(-pi/8192) q[4];
cx q[16], q[5];
rz(pi/4096) q[5];
cx q[16], q[5];
rz(-pi/4096) q[5];
cx q[16], q[6];
rz(pi/2048) q[6];
cx q[16], q[6];
rz(-pi/2048) q[6];
cx q[16], q[7];
rz(pi/1024) q[7];
cx q[16], q[7];
rz(-pi/1024) q[7];
cx q[16], q[8];
rz(pi/512) q[8];
cx q[16], q[8];
rz(-pi/512) q[8];
cx q[16], q[9];
rz(pi/256) q[9];
cx q[16], q[9];
rz(-pi/256) q[9];
cx q[16], q[10];
rz(pi/128) q[10];
cx q[16], q[10];
rz(-pi/128) q[10];
cx q[16], q[11];
rz(pi/64) q[11];
cx q[16], q[11];
rz(-pi/64) q[11];
cx q[16], q[12];
rz(pi/32) q[12];
cx q[16], q[12];
rz(-pi/32) q[12];
cx q[16], q[13];
rz(pi/16) q[13];
cx q[16], q[13];
rz(-pi/16) q[13];
cx q[16], q[14];
rz(pi/8) q[14];
cx q[16], q[14];
rz(-pi/8) q[14];
cx q[16], q[15];
rz(pi/4) q[15];
cx q[16], q[15];
rz(-pi/4) q[15];
h q[16];
cx q[17], q[0];
rz(pi/262144) q[0];
cx q[17], q[0];
rz(-pi/262144) q[0];
cx q[17], q[1];
rz(pi/131072) q[1];
cx q[17], q[1];
rz(-pi/131072) q[1];
cx q[17], q[2];
rz(pi/65536) q[2];
cx q[17], q[2];
rz(-pi/65536) q[2];
cx q[17], q[3];
rz(pi/32768) q[3];
cx q[17], q[3];
rz(-pi/32768) q[3];
cx q[17], q[4];
rz(pi/16384) q[4];
cx q[17], q[4];
rz(-pi/16384) q[4];
cx q[17], q[5];
rz(pi/8192) q[5];
cx q[17], q[5];
rz(-pi/8192) q[5];
cx q[17], q[6];
rz(pi/4096) q[6];
cx q[17], q[6];
rz(-pi/4096) q[6];
cx q[17], q[7];
rz(pi/2048) q[7];
cx q[17], q[7];
rz(-pi/2048) q[7];
cx q[17], q[8];
rz(pi/1024) q[8];
cx q[17], q[8];
rz(-pi/1024) q[8];
cx q[17], q[9];
rz(pi/512) q[9];
cx q[17], q[9];
rz(-pi/512) q[9];
cx q[17], q[10];
rz(pi/256) q[10];
cx q[17], q[10];
rz(-pi/256) q[10];
cx q[17], q[11];
rz(pi/128) q[11];
cx q[17], q[11];
rz(-pi/128) q[11];
cx q[17], q[12];
rz(pi/64) q[12];
cx q[17], q[12];
rz(-pi/64) q[12];
cx q[17], q[13];
rz(pi/32) q[13];
cx q[17], q[13];
rz(-pi/32) q[13];
cx q[17], q[14];
rz(pi/16) q[14];
cx q[17], q[14];
rz(-pi/16) q[14];
cx q[17], q[15];
rz(pi/8) q[15];
cx q[17], q[15];
rz(-pi/8) q[15];
cx q[17], q[16];
rz(pi/4) q[16];
cx q[17], q[16];
rz(-pi/4) q[16];
h q[17];
cx q[18], q[1];
rz(pi/262144) q[1];
cx q[18], q[1];
rz(-pi/262144) q[1];
cx q[18], q[2];
rz(pi/131072) q[2];
cx q[18], q[2];
rz(-pi/131072) q[2];
cx q[18], q[3];
rz(pi/65536) q[3];
cx q[18], q[3];
rz(-pi/65536) q[3];
cx q[18], q[4];
rz(pi/32768) q[4];
cx q[18], q[4];
rz(-pi/32768) q[4];
cx q[18], q[5];
rz(pi/16384) q[5];
cx q[18], q[5];
rz(-pi/16384) q[5];
cx q[18], q[6];
rz(pi/8192) q[6];
cx q[18], q[6];
rz(-pi/8192) q[6];
cx q[18], q[7];
rz(pi/4096) q[7];
cx q[18], q[7];
rz(-pi/4096) q[7];
cx q[18], q[8];
rz(pi/2048) q[8];
cx q[18], q[8];
rz(-pi/2048) q[8];
cx q[18], q[9];
rz(pi/1024) q[9];
cx q[18], q[9];
rz(-pi/1024) q[9];
cx q[18], q[10];
rz(pi/512) q[10];
cx q[18], q[10];
rz(-pi/512) q[10];
cx q[18], q[11];
rz(pi/256) q[11];
cx q[18], q[11];
rz(-pi/256) q[11];
cx q[18], q[12];
rz(pi/128) q[12];
cx q[18], q[12];
rz(-pi/128) q[12];
cx q[18], q[13];
rz(pi/64) q[13];
cx q[18], q[13];
rz(-pi/64) q[13];
cx q[18], q[14];
rz(pi/32) q[14];
cx q[18], q[14];
rz(-pi/32) q[14];
cx q[18], q[15];
rz(pi/16) q[15];
cx q[18], q[15];
rz(-pi/16) q[15];
cx q[18], q[16];
rz(pi/8) q[16];
cx q[18], q[16];
rz(-pi/8) q[16];
cx q[18], q[17];
rz(pi/4) q[17];
cx q[18], q[17];
rz(-pi/4) q[17];
h q[18];
rz(-pi/1048576) q[19];
rz(-1.570790334682444) q[19];
cx q[19], q[2];
rz(pi/262144) q[2];
cx q[19], q[2];
rz(-pi/262144) q[2];
cx q[19], q[3];
rz(pi/131072) q[3];
cx q[19], q[3];
rz(-pi/131072) q[3];
cx q[19], q[4];
rz(pi/65536) q[4];
cx q[19], q[4];
rz(-pi/65536) q[4];
cx q[19], q[5];
rz(pi/32768) q[5];
cx q[19], q[5];
rz(-pi/32768) q[5];
cx q[19], q[6];
rz(pi/16384) q[6];
cx q[19], q[6];
rz(-pi/16384) q[6];
cx q[19], q[7];
rz(pi/8192) q[7];
cx q[19], q[7];
rz(-pi/8192) q[7];
cx q[19], q[8];
rz(pi/4096) q[8];
cx q[19], q[8];
rz(-pi/4096) q[8];
cx q[19], q[9];
rz(pi/2048) q[9];
cx q[19], q[9];
rz(-pi/2048) q[9];
cx q[19], q[10];
rz(pi/1024) q[10];
cx q[19], q[10];
rz(-pi/1024) q[10];
cx q[19], q[11];
rz(pi/512) q[11];
cx q[19], q[11];
rz(-pi/512) q[11];
cx q[19], q[12];
rz(pi/256) q[12];
cx q[19], q[12];
rz(-pi/256) q[12];
cx q[19], q[13];
rz(pi/128) q[13];
cx q[19], q[13];
rz(-pi/128) q[13];
cx q[19], q[14];
rz(pi/64) q[14];
cx q[19], q[14];
rz(-pi/64) q[14];
cx q[19], q[15];
rz(pi/32) q[15];
cx q[19], q[15];
rz(-pi/32) q[15];
cx q[19], q[16];
rz(pi/16) q[16];
cx q[19], q[16];
rz(-pi/16) q[16];
cx q[19], q[17];
rz(pi/8) q[17];
cx q[19], q[17];
rz(-pi/8) q[17];
cx q[19], q[18];
rz(pi/4) q[18];
cx q[19], q[18];
rz(-pi/4) q[18];
h q[19];
cx q[20], q[3];
rz(pi/262144) q[3];
cx q[20], q[3];
rz(-pi/262144) q[3];
cx q[20], q[4];
rz(pi/131072) q[4];
cx q[20], q[4];
rz(-pi/131072) q[4];
cx q[20], q[5];
rz(pi/65536) q[5];
cx q[20], q[5];
rz(-pi/65536) q[5];
cx q[20], q[6];
rz(pi/32768) q[6];
cx q[20], q[6];
rz(-pi/32768) q[6];
cx q[20], q[7];
rz(pi/16384) q[7];
cx q[20], q[7];
rz(-pi/16384) q[7];
cx q[20], q[8];
rz(pi/8192) q[8];
cx q[20], q[8];
rz(-pi/8192) q[8];
cx q[20], q[9];
rz(pi/4096) q[9];
cx q[20], q[9];
rz(-pi/4096) q[9];
cx q[20], q[10];
rz(pi/2048) q[10];
cx q[20], q[10];
rz(-pi/2048) q[10];
cx q[20], q[11];
rz(pi/1024) q[11];
cx q[20], q[11];
rz(-pi/1024) q[11];
cx q[20], q[12];
rz(pi/512) q[12];
cx q[20], q[12];
rz(-pi/512) q[12];
cx q[20], q[13];
rz(pi/256) q[13];
cx q[20], q[13];
rz(-pi/256) q[13];
cx q[20], q[14];
rz(pi/128) q[14];
cx q[20], q[14];
rz(-pi/128) q[14];
cx q[20], q[15];
rz(pi/64) q[15];
cx q[20], q[15];
rz(-pi/64) q[15];
cx q[20], q[16];
rz(pi/32) q[16];
cx q[20], q[16];
rz(-pi/32) q[16];
cx q[20], q[17];
rz(pi/16) q[17];
cx q[20], q[17];
rz(-pi/16) q[17];
cx q[20], q[18];
rz(pi/8) q[18];
cx q[20], q[18];
rz(-pi/8) q[18];
cx q[20], q[19];
rz(pi/4) q[19];
cx q[20], q[19];
rz(-pi/4) q[19];
h q[20];
cx q[21], q[4];
rz(pi/262144) q[4];
cx q[21], q[4];
rz(-pi/262144) q[4];
cx q[21], q[5];
rz(pi/131072) q[5];
cx q[21], q[5];
rz(-pi/131072) q[5];
cx q[21], q[6];
rz(pi/65536) q[6];
cx q[21], q[6];
rz(-pi/65536) q[6];
cx q[21], q[7];
rz(pi/32768) q[7];
cx q[21], q[7];
rz(-pi/32768) q[7];
cx q[21], q[8];
rz(pi/16384) q[8];
cx q[21], q[8];
rz(-pi/16384) q[8];
cx q[21], q[9];
rz(pi/8192) q[9];
cx q[21], q[9];
rz(-pi/8192) q[9];
cx q[21], q[10];
rz(pi/4096) q[10];
cx q[21], q[10];
rz(-pi/4096) q[10];
cx q[21], q[11];
rz(pi/2048) q[11];
cx q[21], q[11];
rz(-pi/2048) q[11];
cx q[21], q[12];
rz(pi/1024) q[12];
cx q[21], q[12];
rz(-pi/1024) q[12];
cx q[21], q[13];
rz(pi/512) q[13];
cx q[21], q[13];
rz(-pi/512) q[13];
cx q[21], q[14];
rz(pi/256) q[14];
cx q[21], q[14];
rz(-pi/256) q[14];
cx q[21], q[15];
rz(pi/128) q[15];
cx q[21], q[15];
rz(-pi/128) q[15];
cx q[21], q[16];
rz(pi/64) q[16];
cx q[21], q[16];
rz(-pi/64) q[16];
cx q[21], q[17];
rz(pi/32) q[17];
cx q[21], q[17];
rz(-pi/32) q[17];
cx q[21], q[18];
rz(pi/16) q[18];
cx q[21], q[18];
rz(-pi/16) q[18];
cx q[21], q[19];
rz(pi/8) q[19];
cx q[21], q[19];
rz(-pi/8) q[19];
cx q[21], q[20];
rz(pi/4) q[20];
cx q[21], q[20];
rz(-pi/4) q[20];
h q[21];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], q[11], q[12], q[13], q[14], q[15], q[16], q[17], q[18], q[19], q[20], q[21], psi[0];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];
c[9] = measure q[9];
c[10] = measure q[10];
c[11] = measure q[11];
c[12] = measure q[12];
c[13] = measure q[13];
c[14] = measure q[14];
c[15] = measure q[15];
c[16] = measure q[16];
c[17] = measure q[17];
c[18] = measure q[18];
c[19] = measure q[19];
c[20] = measure q[20];
c[21] = measure q[21];
