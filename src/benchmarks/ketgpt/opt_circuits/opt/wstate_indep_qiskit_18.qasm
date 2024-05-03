OPENQASM 3.0;
include "stdgates.inc";
bit[18] meas;
qubit[18] q;
rz(-pi/2) q[0];
h q[0];
rz(-pi/4) q[0];
h q[0];
rz(5*pi/2) q[0];
h q[0];
rz(-pi/2) q[1];
h q[1];
rz(-0.9553166181245092) q[1];
h q[1];
rz(5*pi/2) q[1];
h q[1];
rz(-pi/2) q[2];
h q[2];
rz(-pi/3) q[2];
h q[2];
rz(5*pi/2) q[2];
h q[2];
rz(-pi/2) q[3];
h q[3];
rz(-1.1071487177940904) q[3];
h q[3];
rz(5*pi/2) q[3];
h q[3];
rz(-pi/2) q[4];
h q[4];
rz(-1.1502619915109316) q[4];
h q[4];
rz(5*pi/2) q[4];
h q[4];
rz(-pi/2) q[5];
h q[5];
rz(-1.183199640139716) q[5];
h q[5];
rz(5*pi/2) q[5];
h q[5];
rz(-pi/2) q[6];
h q[6];
rz(-1.2094292028881888) q[6];
h q[6];
rz(5*pi/2) q[6];
h q[6];
rz(-pi/2) q[7];
h q[7];
rz(-1.2309594173407747) q[7];
h q[7];
rz(5*pi/2) q[7];
h q[7];
rz(-pi/2) q[8];
h q[8];
rz(-1.2490457723982544) q[8];
h q[8];
rz(5*pi/2) q[8];
h q[8];
rz(-pi/2) q[9];
h q[9];
rz(-1.2645189576252271) q[9];
h q[9];
rz(5*pi/2) q[9];
h q[9];
rz(-pi/2) q[10];
h q[10];
rz(-1.277953555066321) q[10];
h q[10];
rz(5*pi/2) q[10];
h q[10];
rz(-pi/2) q[11];
h q[11];
rz(-1.2897614252920828) q[11];
h q[11];
rz(5*pi/2) q[11];
h q[11];
rz(-pi/2) q[12];
h q[12];
rz(-1.3002465638163236) q[12];
h q[12];
rz(5*pi/2) q[12];
h q[12];
rz(-pi/2) q[13];
h q[13];
rz(-1.3096389158918722) q[13];
h q[13];
rz(5*pi/2) q[13];
h q[13];
rz(-pi/2) q[14];
h q[14];
rz(-1.318116071652818) q[14];
h q[14];
rz(5*pi/2) q[14];
h q[14];
rz(-pi/2) q[15];
h q[15];
rz(-1.3258176636680323) q[15];
h q[15];
rz(5*pi/2) q[15];
h q[15];
rz(-pi/2) q[16];
h q[16];
rz(-1.3328552019646882) q[16];
h q[16];
rz(5*pi/2) q[16];
h q[16];
h q[17];
rz(pi) q[17];
h q[17];
cx q[17], q[16];
h q[16];
rz(0) q[16];
rz(-pi/2) q[16];
h q[16];
rz(1.332855201964688) q[16];
h q[16];
rz(5*pi/2) q[16];
cx q[16], q[15];
h q[15];
rz(0) q[15];
rz(-pi/2) q[15];
h q[15];
rz(1.3258176636680323) q[15];
h q[15];
rz(5*pi/2) q[15];
cx q[15], q[14];
h q[14];
rz(0) q[14];
rz(-pi/2) q[14];
h q[14];
rz(1.3181160716528177) q[14];
h q[14];
rz(5*pi/2) q[14];
cx q[14], q[13];
h q[13];
rz(0) q[13];
rz(-pi/2) q[13];
h q[13];
rz(1.3096389158918722) q[13];
h q[13];
rz(5*pi/2) q[13];
cx q[13], q[12];
h q[12];
rz(0) q[12];
rz(-pi/2) q[12];
h q[12];
rz(1.3002465638163239) q[12];
h q[12];
rz(5*pi/2) q[12];
cx q[12], q[11];
h q[11];
rz(0) q[11];
rz(-pi/2) q[11];
h q[11];
rz(1.2897614252920828) q[11];
h q[11];
rz(5*pi/2) q[11];
cx q[11], q[10];
h q[10];
rz(0) q[10];
rz(-pi/2) q[10];
h q[10];
rz(1.277953555066321) q[10];
h q[10];
rz(5*pi/2) q[10];
cx q[10], q[9];
h q[9];
rz(0) q[9];
rz(-pi/2) q[9];
h q[9];
rz(1.264518957625227) q[9];
h q[9];
rz(5*pi/2) q[9];
cx q[9], q[8];
h q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(1.2490457723982544) q[8];
h q[8];
rz(5*pi/2) q[8];
cx q[8], q[7];
h q[7];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(1.2309594173407747) q[7];
h q[7];
rz(5*pi/2) q[7];
cx q[7], q[6];
h q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(1.209429202888189) q[6];
h q[6];
rz(5*pi/2) q[6];
cx q[6], q[5];
h q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(1.1831996401397156) q[5];
h q[5];
rz(5*pi/2) q[5];
cx q[5], q[4];
h q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(1.1502619915109316) q[4];
h q[4];
rz(5*pi/2) q[4];
cx q[4], q[3];
h q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(1.1071487177940904) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[3], q[2];
h q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(pi/3) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[2], q[1];
h q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.9553166181245096) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[1], q[0];
h q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(pi/4) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[16], q[17];
cx q[15], q[16];
cx q[14], q[15];
cx q[13], q[14];
cx q[12], q[13];
cx q[11], q[12];
cx q[10], q[11];
cx q[9], q[10];
cx q[8], q[9];
cx q[7], q[8];
cx q[6], q[7];
cx q[5], q[6];
cx q[4], q[5];
cx q[3], q[4];
cx q[2], q[3];
cx q[1], q[2];
cx q[0], q[1];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], q[11], q[12], q[13], q[14], q[15], q[16], q[17];
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
