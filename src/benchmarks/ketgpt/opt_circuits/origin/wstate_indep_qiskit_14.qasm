OPENQASM 3.0;
include "stdgates.inc";
bit[14] meas;
qubit[14] q;
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
h q[13];
s q[13];
s q[13];
h q[13];
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
