OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;
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
h psi[0];
s psi[0];
s psi[0];
h psi[0];
rz(0.10200972239439514) psi[0];
cx psi[0], q[0];
rz(-0.10200972239439514) q[0];
cx psi[0], q[0];
rz(0.10200972239439514) q[0];
rz(0.20401944478879028) psi[0];
cx psi[0], q[1];
rz(-0.20401944478879028) q[1];
cx psi[0], q[1];
rz(0.20401944478879028) q[1];
rz(0.40803888957758055) psi[0];
cx psi[0], q[2];
rz(-0.40803888957758055) q[2];
cx psi[0], q[2];
rz(0.40803888957758055) q[2];
rz(0.8160777791551611) psi[0];
cx psi[0], q[3];
rz(-0.8160777791551611) q[3];
cx psi[0], q[3];
rz(0.8160777791551611) q[3];
rz(-1.509437095279471) psi[0];
cx psi[0], q[4];
rz(1.509437095279471) q[4];
cx psi[0], q[4];
rz(-1.509437095279471) q[4];
rz(0.1227184630308513) psi[0];
cx psi[0], q[5];
rz(-0.1227184630308513) q[5];
cx psi[0], q[5];
rz(0.1227184630308513) q[5];
rz(-pi/64) q[5];
rz(0.2454369260617026) psi[0];
cx psi[0], q[6];
rz(-0.2454369260617026) q[6];
cx psi[0], q[6];
rz(0.2454369260617026) q[6];
cx q[4], q[6];
cx q[6], q[4];
cx q[4], q[6];
rz(-pi/32) q[4];
rz(-pi/128) q[6];
rz(0.4908738521234052) psi[0];
cx psi[0], q[7];
rz(-0.4908738521234052) q[7];
cx psi[0], q[7];
rz(0.4908738521234052) q[7];
cx q[3], q[7];
cx q[7], q[3];
cx q[3], q[7];
rz(-pi/16) q[3];
rz(-pi/256) q[7];
rz(5*pi/16) psi[0];
cx psi[0], q[8];
rz(-5*pi/16) q[8];
cx psi[0], q[8];
rz(5*pi/16) q[8];
cx q[2], q[8];
cx q[8], q[2];
cx q[2], q[8];
rz(-pi/8) q[2];
rz(-pi/512) q[8];
rz(-3*pi/8) psi[0];
cx psi[0], q[9];
rz(3*pi/8) q[9];
cx psi[0], q[9];
rz(-3*pi/8) q[9];
cx q[1], q[9];
cx q[9], q[1];
cx q[1], q[9];
rz(-pi/4) q[1];
rz(-pi/1024) q[9];
rz(pi/4) psi[0];
cx psi[0], q[10];
rz(-pi/4) q[10];
cx psi[0], q[10];
rz(pi/4) q[10];
cx q[0], q[10];
cx q[10], q[0];
cx q[0], q[10];
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
rz(-pi/4) q[2];
cx q[2], q[1];
rz(pi/4) q[1];
cx q[2], q[1];
rz(-pi/4) q[1];
h q[2];
cx q[3], q[0];
rz(pi/16) q[0];
cx q[3], q[0];
rz(-pi/16) q[0];
rz(-pi/8) q[3];
cx q[3], q[1];
rz(pi/8) q[1];
cx q[3], q[1];
rz(-pi/8) q[1];
rz(-pi/4) q[3];
cx q[3], q[2];
rz(pi/4) q[2];
cx q[3], q[2];
rz(-pi/4) q[2];
h q[3];
cx q[4], q[0];
rz(pi/32) q[0];
cx q[4], q[0];
rz(-pi/32) q[0];
rz(-pi/16) q[4];
cx q[4], q[1];
rz(pi/16) q[1];
cx q[4], q[1];
rz(-pi/16) q[1];
rz(-pi/8) q[4];
cx q[4], q[2];
rz(pi/8) q[2];
cx q[4], q[2];
rz(-pi/8) q[2];
rz(-pi/4) q[4];
cx q[4], q[3];
rz(pi/4) q[3];
cx q[4], q[3];
rz(-pi/4) q[3];
h q[4];
cx q[5], q[0];
rz(pi/64) q[0];
cx q[5], q[0];
rz(-pi/64) q[0];
rz(-pi/32) q[5];
cx q[5], q[1];
rz(pi/32) q[1];
cx q[5], q[1];
rz(-pi/32) q[1];
rz(-pi/16) q[5];
cx q[5], q[2];
rz(pi/16) q[2];
cx q[5], q[2];
rz(-pi/16) q[2];
rz(-pi/8) q[5];
cx q[5], q[3];
rz(pi/8) q[3];
cx q[5], q[3];
rz(-pi/8) q[3];
rz(-pi/4) q[5];
cx q[5], q[4];
rz(pi/4) q[4];
cx q[5], q[4];
rz(-pi/4) q[4];
h q[5];
cx q[6], q[0];
rz(pi/128) q[0];
cx q[6], q[0];
rz(-pi/128) q[0];
rz(-pi/64) q[6];
cx q[6], q[1];
rz(pi/64) q[1];
cx q[6], q[1];
rz(-pi/64) q[1];
rz(-pi/32) q[6];
cx q[6], q[2];
rz(pi/32) q[2];
cx q[6], q[2];
rz(-pi/32) q[2];
rz(-pi/16) q[6];
cx q[6], q[3];
rz(pi/16) q[3];
cx q[6], q[3];
rz(-pi/16) q[3];
rz(-pi/8) q[6];
cx q[6], q[4];
rz(pi/8) q[4];
cx q[6], q[4];
rz(-pi/8) q[4];
rz(-pi/4) q[6];
cx q[6], q[5];
rz(pi/4) q[5];
cx q[6], q[5];
rz(-pi/4) q[5];
h q[6];
cx q[7], q[0];
rz(pi/256) q[0];
cx q[7], q[0];
rz(-pi/256) q[0];
rz(-pi/128) q[7];
cx q[7], q[1];
rz(pi/128) q[1];
cx q[7], q[1];
rz(-pi/128) q[1];
rz(-pi/64) q[7];
cx q[7], q[2];
rz(pi/64) q[2];
cx q[7], q[2];
rz(-pi/64) q[2];
rz(-pi/32) q[7];
cx q[7], q[3];
rz(pi/32) q[3];
cx q[7], q[3];
rz(-pi/32) q[3];
rz(-pi/16) q[7];
cx q[7], q[4];
rz(pi/16) q[4];
cx q[7], q[4];
rz(-pi/16) q[4];
rz(-pi/8) q[7];
cx q[7], q[5];
rz(pi/8) q[5];
cx q[7], q[5];
rz(-pi/8) q[5];
rz(-pi/4) q[7];
cx q[7], q[6];
rz(pi/4) q[6];
cx q[7], q[6];
rz(-pi/4) q[6];
h q[7];
cx q[8], q[0];
rz(pi/512) q[0];
cx q[8], q[0];
rz(-pi/512) q[0];
rz(-pi/256) q[8];
cx q[8], q[1];
rz(pi/256) q[1];
cx q[8], q[1];
rz(-pi/256) q[1];
rz(-pi/128) q[8];
cx q[8], q[2];
rz(pi/128) q[2];
cx q[8], q[2];
rz(-pi/128) q[2];
rz(-pi/64) q[8];
cx q[8], q[3];
rz(pi/64) q[3];
cx q[8], q[3];
rz(-pi/64) q[3];
rz(-pi/32) q[8];
cx q[8], q[4];
rz(pi/32) q[4];
cx q[8], q[4];
rz(-pi/32) q[4];
rz(-pi/16) q[8];
cx q[8], q[5];
rz(pi/16) q[5];
cx q[8], q[5];
rz(-pi/16) q[5];
rz(-pi/8) q[8];
cx q[8], q[6];
rz(pi/8) q[6];
cx q[8], q[6];
rz(-pi/8) q[6];
rz(-pi/4) q[8];
cx q[8], q[7];
rz(pi/4) q[7];
cx q[8], q[7];
rz(-pi/4) q[7];
h q[8];
cx q[9], q[0];
rz(pi/1024) q[0];
cx q[9], q[0];
rz(-pi/1024) q[0];
rz(-pi/512) q[9];
cx q[9], q[1];
rz(pi/512) q[1];
cx q[9], q[1];
rz(-pi/512) q[1];
rz(-pi/256) q[9];
cx q[9], q[2];
rz(pi/256) q[2];
cx q[9], q[2];
rz(-pi/256) q[2];
rz(-pi/128) q[9];
cx q[9], q[3];
rz(pi/128) q[3];
cx q[9], q[3];
rz(-pi/128) q[3];
rz(-pi/64) q[9];
cx q[9], q[4];
rz(pi/64) q[4];
cx q[9], q[4];
rz(-pi/64) q[4];
rz(-pi/32) q[9];
cx q[9], q[5];
rz(pi/32) q[5];
cx q[9], q[5];
rz(-pi/32) q[5];
rz(-pi/16) q[9];
cx q[9], q[6];
rz(pi/16) q[6];
cx q[9], q[6];
rz(-pi/16) q[6];
rz(-pi/8) q[9];
cx q[9], q[7];
rz(pi/8) q[7];
cx q[9], q[7];
rz(-pi/8) q[7];
rz(-pi/4) q[9];
cx q[9], q[8];
rz(pi/4) q[8];
cx q[9], q[8];
rz(-pi/4) q[8];
h q[9];
rz(-pi/2048) q[10];
cx q[10], q[0];
rz(pi/2048) q[0];
cx q[10], q[0];
rz(-pi/2048) q[0];
rz(-pi/1024) q[10];
cx q[10], q[1];
rz(pi/1024) q[1];
cx q[10], q[1];
rz(-pi/1024) q[1];
rz(-pi/512) q[10];
cx q[10], q[2];
rz(pi/512) q[2];
cx q[10], q[2];
rz(-pi/512) q[2];
rz(-pi/256) q[10];
cx q[10], q[3];
rz(pi/256) q[3];
cx q[10], q[3];
rz(-pi/256) q[3];
rz(-pi/128) q[10];
cx q[10], q[4];
rz(pi/128) q[4];
cx q[10], q[4];
rz(-pi/128) q[4];
rz(-pi/64) q[10];
cx q[10], q[5];
rz(pi/64) q[5];
cx q[10], q[5];
rz(-pi/64) q[5];
rz(-pi/32) q[10];
cx q[10], q[6];
rz(pi/32) q[6];
cx q[10], q[6];
rz(-pi/32) q[6];
rz(-pi/16) q[10];
cx q[10], q[7];
rz(pi/16) q[7];
cx q[10], q[7];
rz(-pi/16) q[7];
rz(-pi/8) q[10];
cx q[10], q[8];
rz(pi/8) q[8];
cx q[10], q[8];
rz(-pi/8) q[8];
rz(-pi/4) q[10];
cx q[10], q[9];
rz(pi/4) q[9];
cx q[10], q[9];
rz(-pi/4) q[9];
h q[10];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], psi[0];
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