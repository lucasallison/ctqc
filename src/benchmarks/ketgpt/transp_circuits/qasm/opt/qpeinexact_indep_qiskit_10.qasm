OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;
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
h psi[0];
rz(pi) psi[0];
h psi[0];
rz(-0.22396119503130363) psi[0];
cx psi[0], q[0];
rz(1.346835131763593) q[0];
cx psi[0], q[0];
rz(-1.346835131763593) q[0];
cx psi[0], q[1];
rz(-0.4479223900626072) q[1];
cx psi[0], q[1];
rz(0.4479223900626072) q[1];
cx psi[0], q[2];
rz(-0.8958447801252144) q[2];
cx psi[0], q[2];
rz(0.8958447801252144) q[2];
cx psi[0], q[3];
rz(1.3499030933393643) q[3];
cx psi[0], q[3];
rz(-1.3499030933393643) q[3];
cx psi[0], q[4];
rz(-0.44178646691106466) q[4];
cx psi[0], q[4];
rz(-1.030835089459151) q[4];
cx psi[0], q[5];
rz(-0.8835729338221293) q[5];
cx psi[0], q[5];
rz(0.8835729338221293) q[5];
cx q[3], q[5];
cx q[5], q[3];
cx q[3], q[5];
rz(-7*pi/16) q[3];
rz(-1.521708941582556) q[5];
cx psi[0], q[6];
rz(7*pi/16) q[6];
cx psi[0], q[6];
rz(-7*pi/16) q[6];
cx q[2], q[6];
cx q[6], q[2];
cx q[2], q[6];
rz(-3*pi/8) q[2];
rz(-1.5462526341887264) q[6];
cx psi[0], q[7];
rz(-pi/8) q[7];
cx psi[0], q[7];
rz(pi/8) q[7];
cx q[1], q[7];
cx q[7], q[1];
cx q[1], q[7];
rz(-pi/4) q[1];
rz(-1.5585244804918115) q[7];
cx psi[0], q[8];
rz(-pi/4) q[8];
cx psi[0], q[8];
rz(pi/4) q[8];
cx q[0], q[8];
cx q[8], q[0];
cx q[0], q[8];
h q[0];
cx q[1], q[0];
rz(pi/4) q[0];
cx q[1], q[0];
rz(-pi/4) q[0];
h q[1];
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
rz(-1.564660403643354) q[8];
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
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], psi[0];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];