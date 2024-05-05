OPENQASM 3.0;
include "stdgates.inc";
bit[23] meas;
qubit[23] q;
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi/4) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
h q[0];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(2.186276035465284) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
h q[1];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(2*pi/3) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
h q[2];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(2.0344439357957027) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi) q[3];
h q[3];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(1.9913306620788616) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi) q[4];
h q[4];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(1.958393013450077) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi) q[5];
h q[5];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(1.9321634507016043) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
h q[6];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(1.9106332362490184) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi) q[7];
h q[7];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(1.8925468811915387) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3*pi) q[8];
h q[8];
rz(0) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(1.877073695964566) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3*pi) q[9];
h q[9];
rz(0) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(1.863639098523472) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(3*pi) q[10];
h q[10];
rz(0) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(1.8518312282977103) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(3*pi) q[11];
h q[11];
rz(0) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(1.8413460897734695) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(3*pi) q[12];
h q[12];
rz(0) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(1.831953737697921) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(3*pi) q[13];
h q[13];
rz(0) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(1.8234765819369751) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(3*pi) q[14];
h q[14];
rz(0) q[15];
rz(-pi/2) q[15];
h q[15];
rz(-pi/2) q[15];
rz(1.8157749899217608) q[15];
rz(-pi/2) q[15];
h q[15];
rz(-pi/2) q[15];
rz(3*pi) q[15];
h q[15];
rz(0) q[16];
rz(-pi/2) q[16];
h q[16];
rz(-pi/2) q[16];
rz(1.808737451625105) q[16];
rz(-pi/2) q[16];
h q[16];
rz(-pi/2) q[16];
rz(3*pi) q[16];
h q[16];
rz(0) q[17];
rz(-pi/2) q[17];
h q[17];
rz(-pi/2) q[17];
rz(1.802273690765075) q[17];
rz(-pi/2) q[17];
h q[17];
rz(-pi/2) q[17];
rz(3*pi) q[17];
h q[17];
rz(0) q[18];
rz(-pi/2) q[18];
h q[18];
rz(-pi/2) q[18];
rz(1.7963097326930277) q[18];
rz(-pi/2) q[18];
h q[18];
rz(-pi/2) q[18];
rz(3*pi) q[18];
h q[18];
rz(0) q[19];
rz(-pi/2) q[19];
h q[19];
rz(-pi/2) q[19];
rz(1.790784304190356) q[19];
rz(-pi/2) q[19];
h q[19];
rz(-pi/2) q[19];
rz(3*pi) q[19];
h q[19];
rz(0) q[20];
rz(-pi/2) q[20];
h q[20];
rz(-pi/2) q[20];
rz(1.7856461598706088) q[20];
rz(-pi/2) q[20];
h q[20];
rz(-pi/2) q[20];
rz(3*pi) q[20];
h q[20];
rz(0) q[21];
rz(-pi/2) q[21];
h q[21];
rz(-pi/2) q[21];
rz(1.7808520658661355) q[21];
rz(-pi/2) q[21];
h q[21];
rz(-pi/2) q[21];
rz(3*pi) q[21];
h q[21];
h q[22];
s q[22];
s q[22];
h q[22];
cx q[22], q[21];
h q[21];
rz(0) q[21];
rz(-pi/2) q[21];
h q[21];
rz(-pi/2) q[21];
rz(4.502333241313451) q[21];
rz(-pi/2) q[21];
h q[21];
rz(-pi/2) q[21];
rz(3*pi) q[21];
cx q[21], q[20];
h q[20];
rz(0) q[20];
rz(-pi/2) q[20];
h q[20];
rz(-pi/2) q[20];
rz(4.497539147308977) q[20];
rz(-pi/2) q[20];
h q[20];
rz(-pi/2) q[20];
rz(3*pi) q[20];
cx q[20], q[19];
h q[19];
rz(0) q[19];
rz(-pi/2) q[19];
h q[19];
rz(-pi/2) q[19];
rz(4.49240100298923) q[19];
rz(-pi/2) q[19];
h q[19];
rz(-pi/2) q[19];
rz(3*pi) q[19];
cx q[19], q[18];
h q[18];
rz(0) q[18];
rz(-pi/2) q[18];
h q[18];
rz(-pi/2) q[18];
rz(4.486875574486558) q[18];
rz(-pi/2) q[18];
h q[18];
rz(-pi/2) q[18];
rz(3*pi) q[18];
cx q[18], q[17];
h q[17];
rz(0) q[17];
rz(-pi/2) q[17];
h q[17];
rz(-pi/2) q[17];
rz(4.480911616414511) q[17];
rz(-pi/2) q[17];
h q[17];
rz(-pi/2) q[17];
rz(3*pi) q[17];
cx q[17], q[16];
h q[16];
rz(0) q[16];
rz(-pi/2) q[16];
h q[16];
rz(-pi/2) q[16];
rz(4.474447855554481) q[16];
rz(-pi/2) q[16];
h q[16];
rz(-pi/2) q[16];
rz(3*pi) q[16];
cx q[16], q[15];
h q[15];
rz(0) q[15];
rz(-pi/2) q[15];
h q[15];
rz(-pi/2) q[15];
rz(4.4674103172578254) q[15];
rz(-pi/2) q[15];
h q[15];
rz(-pi/2) q[15];
rz(3*pi) q[15];
cx q[15], q[14];
h q[14];
rz(0) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(4.459708725242611) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(3*pi) q[14];
cx q[14], q[13];
h q[13];
rz(0) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(4.451231569481665) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(3*pi) q[13];
cx q[13], q[12];
h q[12];
rz(0) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(4.441839217406117) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(3*pi) q[12];
cx q[12], q[11];
h q[11];
rz(0) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(4.431354078881876) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(3*pi) q[11];
cx q[11], q[10];
h q[10];
rz(0) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(4.419546208656114) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(3*pi) q[10];
cx q[10], q[9];
h q[9];
rz(0) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(4.40611161121502) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3*pi) q[9];
cx q[9], q[8];
h q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(4.3906384259880475) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3*pi) q[8];
cx q[8], q[7];
h q[7];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(4.372552070930568) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi) q[7];
cx q[7], q[6];
h q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(4.351021856477982) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
cx q[6], q[5];
h q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(4.324792293729509) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi) q[5];
cx q[5], q[4];
h q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(4.291854645100725) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi) q[4];
cx q[4], q[3];
h q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(4.2487413713838835) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi) q[3];
cx q[3], q[2];
h q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(4*pi/3) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
cx q[2], q[1];
h q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(4.096909271714303) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
cx q[1], q[0];
h q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(5*pi/4) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[21], q[22];
cx q[20], q[21];
cx q[19], q[20];
cx q[18], q[19];
cx q[17], q[18];
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
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], q[11], q[12], q[13], q[14], q[15], q[16], q[17], q[18], q[19], q[20], q[21], q[22];
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