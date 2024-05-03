OPENQASM 3.0;
include "stdgates.inc";
bit[23] meas;
qubit[23] q;
h q[0];
rz(-4.283185307179586) q[0];
h q[1];
rz(2.0) q[1];
cx q[0], q[1];
rz(9.17283818781952) q[1];
cx q[0], q[1];
h q[2];
rz(2.0) q[2];
cx q[0], q[2];
rz(9.17283818781952) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(9.17283818781952) q[2];
cx q[1], q[2];
h q[3];
rz(2.0) q[3];
cx q[0], q[3];
rz(9.17283818781952) q[3];
cx q[0], q[3];
cx q[1], q[3];
rz(9.17283818781952) q[3];
cx q[1], q[3];
cx q[2], q[3];
rz(9.17283818781952) q[3];
cx q[2], q[3];
h q[4];
rz(2.0) q[4];
cx q[0], q[4];
rz(9.17283818781952) q[4];
cx q[0], q[4];
cx q[1], q[4];
rz(9.17283818781952) q[4];
cx q[1], q[4];
cx q[2], q[4];
rz(9.17283818781952) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(9.17283818781952) q[4];
cx q[3], q[4];
h q[5];
rz(2.0) q[5];
cx q[0], q[5];
rz(9.17283818781952) q[5];
cx q[0], q[5];
cx q[1], q[5];
rz(9.17283818781952) q[5];
cx q[1], q[5];
cx q[2], q[5];
rz(9.17283818781952) q[5];
cx q[2], q[5];
cx q[3], q[5];
rz(9.17283818781952) q[5];
cx q[3], q[5];
cx q[4], q[5];
rz(9.17283818781952) q[5];
cx q[4], q[5];
h q[6];
rz(2.0) q[6];
cx q[0], q[6];
rz(9.17283818781952) q[6];
cx q[0], q[6];
cx q[1], q[6];
rz(9.17283818781952) q[6];
cx q[1], q[6];
cx q[2], q[6];
rz(9.17283818781952) q[6];
cx q[2], q[6];
cx q[3], q[6];
rz(9.17283818781952) q[6];
cx q[3], q[6];
cx q[4], q[6];
rz(9.17283818781952) q[6];
cx q[4], q[6];
cx q[5], q[6];
rz(9.17283818781952) q[6];
cx q[5], q[6];
h q[7];
rz(2.0) q[7];
cx q[0], q[7];
rz(9.17283818781952) q[7];
cx q[0], q[7];
cx q[1], q[7];
rz(9.17283818781952) q[7];
cx q[1], q[7];
cx q[2], q[7];
rz(9.17283818781952) q[7];
cx q[2], q[7];
cx q[3], q[7];
rz(9.17283818781952) q[7];
cx q[3], q[7];
cx q[4], q[7];
rz(9.17283818781952) q[7];
cx q[4], q[7];
cx q[5], q[7];
rz(9.17283818781952) q[7];
cx q[5], q[7];
cx q[6], q[7];
rz(9.17283818781952) q[7];
cx q[6], q[7];
h q[8];
rz(2.0) q[8];
cx q[0], q[8];
rz(9.17283818781952) q[8];
cx q[0], q[8];
cx q[1], q[8];
rz(9.17283818781952) q[8];
cx q[1], q[8];
cx q[2], q[8];
rz(9.17283818781952) q[8];
cx q[2], q[8];
cx q[3], q[8];
rz(9.17283818781952) q[8];
cx q[3], q[8];
cx q[4], q[8];
rz(9.17283818781952) q[8];
cx q[4], q[8];
cx q[5], q[8];
rz(9.17283818781952) q[8];
cx q[5], q[8];
cx q[6], q[8];
rz(9.17283818781952) q[8];
cx q[6], q[8];
cx q[7], q[8];
rz(9.17283818781952) q[8];
cx q[7], q[8];
h q[9];
rz(2.0) q[9];
cx q[0], q[9];
rz(9.17283818781952) q[9];
cx q[0], q[9];
cx q[1], q[9];
rz(9.17283818781952) q[9];
cx q[1], q[9];
cx q[2], q[9];
rz(9.17283818781952) q[9];
cx q[2], q[9];
cx q[3], q[9];
rz(9.17283818781952) q[9];
cx q[3], q[9];
cx q[4], q[9];
rz(9.17283818781952) q[9];
cx q[4], q[9];
cx q[5], q[9];
rz(9.17283818781952) q[9];
cx q[5], q[9];
cx q[6], q[9];
rz(9.17283818781952) q[9];
cx q[6], q[9];
cx q[7], q[9];
rz(9.17283818781952) q[9];
cx q[7], q[9];
cx q[8], q[9];
rz(9.17283818781952) q[9];
cx q[8], q[9];
h q[10];
rz(2.0) q[10];
cx q[0], q[10];
rz(9.17283818781952) q[10];
cx q[0], q[10];
cx q[1], q[10];
rz(9.17283818781952) q[10];
cx q[1], q[10];
cx q[2], q[10];
rz(9.17283818781952) q[10];
cx q[2], q[10];
cx q[3], q[10];
rz(9.17283818781952) q[10];
cx q[3], q[10];
cx q[4], q[10];
rz(9.17283818781952) q[10];
cx q[4], q[10];
cx q[5], q[10];
rz(9.17283818781952) q[10];
cx q[5], q[10];
cx q[6], q[10];
rz(9.17283818781952) q[10];
cx q[6], q[10];
cx q[7], q[10];
rz(9.17283818781952) q[10];
cx q[7], q[10];
cx q[8], q[10];
rz(9.17283818781952) q[10];
cx q[8], q[10];
cx q[9], q[10];
rz(9.17283818781952) q[10];
cx q[9], q[10];
h q[11];
rz(2.0) q[11];
cx q[0], q[11];
rz(9.17283818781952) q[11];
cx q[0], q[11];
cx q[1], q[11];
rz(9.17283818781952) q[11];
cx q[1], q[11];
cx q[2], q[11];
rz(9.17283818781952) q[11];
cx q[2], q[11];
cx q[3], q[11];
rz(9.17283818781952) q[11];
cx q[3], q[11];
cx q[4], q[11];
rz(9.17283818781952) q[11];
cx q[4], q[11];
cx q[5], q[11];
rz(9.17283818781952) q[11];
cx q[5], q[11];
cx q[6], q[11];
rz(9.17283818781952) q[11];
cx q[6], q[11];
cx q[7], q[11];
rz(9.17283818781952) q[11];
cx q[7], q[11];
cx q[8], q[11];
rz(9.17283818781952) q[11];
cx q[8], q[11];
cx q[9], q[11];
rz(9.17283818781952) q[11];
cx q[9], q[11];
cx q[10], q[11];
rz(9.17283818781952) q[11];
cx q[10], q[11];
h q[12];
rz(2.0) q[12];
cx q[0], q[12];
rz(9.17283818781952) q[12];
cx q[0], q[12];
cx q[1], q[12];
rz(9.17283818781952) q[12];
cx q[1], q[12];
cx q[2], q[12];
rz(9.17283818781952) q[12];
cx q[2], q[12];
cx q[3], q[12];
rz(9.17283818781952) q[12];
cx q[3], q[12];
cx q[4], q[12];
rz(9.17283818781952) q[12];
cx q[4], q[12];
cx q[5], q[12];
rz(9.17283818781952) q[12];
cx q[5], q[12];
cx q[6], q[12];
rz(9.17283818781952) q[12];
cx q[6], q[12];
cx q[7], q[12];
rz(9.17283818781952) q[12];
cx q[7], q[12];
cx q[8], q[12];
rz(9.17283818781952) q[12];
cx q[8], q[12];
cx q[9], q[12];
rz(9.17283818781952) q[12];
cx q[9], q[12];
cx q[10], q[12];
rz(9.17283818781952) q[12];
cx q[10], q[12];
cx q[11], q[12];
rz(9.17283818781952) q[12];
cx q[11], q[12];
h q[13];
rz(2.0) q[13];
cx q[0], q[13];
rz(9.17283818781952) q[13];
cx q[0], q[13];
cx q[1], q[13];
rz(9.17283818781952) q[13];
cx q[1], q[13];
cx q[2], q[13];
rz(9.17283818781952) q[13];
cx q[2], q[13];
cx q[3], q[13];
rz(9.17283818781952) q[13];
cx q[3], q[13];
cx q[4], q[13];
rz(9.17283818781952) q[13];
cx q[4], q[13];
cx q[5], q[13];
rz(9.17283818781952) q[13];
cx q[5], q[13];
cx q[6], q[13];
rz(9.17283818781952) q[13];
cx q[6], q[13];
cx q[7], q[13];
rz(9.17283818781952) q[13];
cx q[7], q[13];
cx q[8], q[13];
rz(9.17283818781952) q[13];
cx q[8], q[13];
cx q[9], q[13];
rz(9.17283818781952) q[13];
cx q[9], q[13];
cx q[10], q[13];
rz(9.17283818781952) q[13];
cx q[10], q[13];
cx q[11], q[13];
rz(9.17283818781952) q[13];
cx q[11], q[13];
cx q[12], q[13];
rz(9.17283818781952) q[13];
cx q[12], q[13];
h q[14];
rz(2.0) q[14];
cx q[0], q[14];
rz(9.17283818781952) q[14];
cx q[0], q[14];
cx q[1], q[14];
rz(9.17283818781952) q[14];
cx q[1], q[14];
cx q[2], q[14];
rz(9.17283818781952) q[14];
cx q[2], q[14];
cx q[3], q[14];
rz(9.17283818781952) q[14];
cx q[3], q[14];
cx q[4], q[14];
rz(9.17283818781952) q[14];
cx q[4], q[14];
cx q[5], q[14];
rz(9.17283818781952) q[14];
cx q[5], q[14];
cx q[6], q[14];
rz(9.17283818781952) q[14];
cx q[6], q[14];
cx q[7], q[14];
rz(9.17283818781952) q[14];
cx q[7], q[14];
cx q[8], q[14];
rz(9.17283818781952) q[14];
cx q[8], q[14];
cx q[9], q[14];
rz(9.17283818781952) q[14];
cx q[9], q[14];
cx q[10], q[14];
rz(9.17283818781952) q[14];
cx q[10], q[14];
cx q[11], q[14];
rz(9.17283818781952) q[14];
cx q[11], q[14];
cx q[12], q[14];
rz(9.17283818781952) q[14];
cx q[12], q[14];
cx q[13], q[14];
rz(9.17283818781952) q[14];
cx q[13], q[14];
h q[15];
rz(2.0) q[15];
cx q[0], q[15];
rz(9.17283818781952) q[15];
cx q[0], q[15];
cx q[1], q[15];
rz(9.17283818781952) q[15];
cx q[1], q[15];
cx q[2], q[15];
rz(9.17283818781952) q[15];
cx q[2], q[15];
cx q[3], q[15];
rz(9.17283818781952) q[15];
cx q[3], q[15];
cx q[4], q[15];
rz(9.17283818781952) q[15];
cx q[4], q[15];
cx q[5], q[15];
rz(9.17283818781952) q[15];
cx q[5], q[15];
cx q[6], q[15];
rz(9.17283818781952) q[15];
cx q[6], q[15];
cx q[7], q[15];
rz(9.17283818781952) q[15];
cx q[7], q[15];
cx q[8], q[15];
rz(9.17283818781952) q[15];
cx q[8], q[15];
cx q[9], q[15];
rz(9.17283818781952) q[15];
cx q[9], q[15];
cx q[10], q[15];
rz(9.17283818781952) q[15];
cx q[10], q[15];
cx q[11], q[15];
rz(9.17283818781952) q[15];
cx q[11], q[15];
cx q[12], q[15];
rz(9.17283818781952) q[15];
cx q[12], q[15];
cx q[13], q[15];
rz(9.17283818781952) q[15];
cx q[13], q[15];
cx q[14], q[15];
rz(9.17283818781952) q[15];
cx q[14], q[15];
h q[16];
rz(2.0) q[16];
cx q[0], q[16];
rz(9.17283818781952) q[16];
cx q[0], q[16];
cx q[1], q[16];
rz(9.17283818781952) q[16];
cx q[1], q[16];
cx q[2], q[16];
rz(9.17283818781952) q[16];
cx q[2], q[16];
cx q[3], q[16];
rz(9.17283818781952) q[16];
cx q[3], q[16];
cx q[4], q[16];
rz(9.17283818781952) q[16];
cx q[4], q[16];
cx q[5], q[16];
rz(9.17283818781952) q[16];
cx q[5], q[16];
cx q[6], q[16];
rz(9.17283818781952) q[16];
cx q[6], q[16];
cx q[7], q[16];
rz(9.17283818781952) q[16];
cx q[7], q[16];
cx q[8], q[16];
rz(9.17283818781952) q[16];
cx q[8], q[16];
cx q[9], q[16];
rz(9.17283818781952) q[16];
cx q[9], q[16];
cx q[10], q[16];
rz(9.17283818781952) q[16];
cx q[10], q[16];
cx q[11], q[16];
rz(9.17283818781952) q[16];
cx q[11], q[16];
cx q[12], q[16];
rz(9.17283818781952) q[16];
cx q[12], q[16];
cx q[13], q[16];
rz(9.17283818781952) q[16];
cx q[13], q[16];
cx q[14], q[16];
rz(9.17283818781952) q[16];
cx q[14], q[16];
cx q[15], q[16];
rz(9.17283818781952) q[16];
cx q[15], q[16];
h q[17];
rz(2.0) q[17];
cx q[0], q[17];
rz(9.17283818781952) q[17];
cx q[0], q[17];
cx q[1], q[17];
rz(9.17283818781952) q[17];
cx q[1], q[17];
cx q[2], q[17];
rz(9.17283818781952) q[17];
cx q[2], q[17];
cx q[3], q[17];
rz(9.17283818781952) q[17];
cx q[3], q[17];
cx q[4], q[17];
rz(9.17283818781952) q[17];
cx q[4], q[17];
cx q[5], q[17];
rz(9.17283818781952) q[17];
cx q[5], q[17];
cx q[6], q[17];
rz(9.17283818781952) q[17];
cx q[6], q[17];
cx q[7], q[17];
rz(9.17283818781952) q[17];
cx q[7], q[17];
cx q[8], q[17];
rz(9.17283818781952) q[17];
cx q[8], q[17];
cx q[9], q[17];
rz(9.17283818781952) q[17];
cx q[9], q[17];
cx q[10], q[17];
rz(9.17283818781952) q[17];
cx q[10], q[17];
cx q[11], q[17];
rz(9.17283818781952) q[17];
cx q[11], q[17];
cx q[12], q[17];
rz(9.17283818781952) q[17];
cx q[12], q[17];
cx q[13], q[17];
rz(9.17283818781952) q[17];
cx q[13], q[17];
cx q[14], q[17];
rz(9.17283818781952) q[17];
cx q[14], q[17];
cx q[15], q[17];
rz(9.17283818781952) q[17];
cx q[15], q[17];
cx q[16], q[17];
rz(9.17283818781952) q[17];
cx q[16], q[17];
h q[18];
rz(2.0) q[18];
cx q[0], q[18];
rz(9.17283818781952) q[18];
cx q[0], q[18];
cx q[1], q[18];
rz(9.17283818781952) q[18];
cx q[1], q[18];
cx q[2], q[18];
rz(9.17283818781952) q[18];
cx q[2], q[18];
cx q[3], q[18];
rz(9.17283818781952) q[18];
cx q[3], q[18];
cx q[4], q[18];
rz(9.17283818781952) q[18];
cx q[4], q[18];
cx q[5], q[18];
rz(9.17283818781952) q[18];
cx q[5], q[18];
cx q[6], q[18];
rz(9.17283818781952) q[18];
cx q[6], q[18];
cx q[7], q[18];
rz(9.17283818781952) q[18];
cx q[7], q[18];
cx q[8], q[18];
rz(9.17283818781952) q[18];
cx q[8], q[18];
cx q[9], q[18];
rz(9.17283818781952) q[18];
cx q[9], q[18];
cx q[10], q[18];
rz(9.17283818781952) q[18];
cx q[10], q[18];
cx q[11], q[18];
rz(9.17283818781952) q[18];
cx q[11], q[18];
cx q[12], q[18];
rz(9.17283818781952) q[18];
cx q[12], q[18];
cx q[13], q[18];
rz(9.17283818781952) q[18];
cx q[13], q[18];
cx q[14], q[18];
rz(9.17283818781952) q[18];
cx q[14], q[18];
cx q[15], q[18];
rz(9.17283818781952) q[18];
cx q[15], q[18];
cx q[16], q[18];
rz(9.17283818781952) q[18];
cx q[16], q[18];
cx q[17], q[18];
rz(9.17283818781952) q[18];
cx q[17], q[18];
h q[19];
rz(2.0) q[19];
cx q[0], q[19];
rz(9.17283818781952) q[19];
cx q[0], q[19];
cx q[1], q[19];
rz(9.17283818781952) q[19];
cx q[1], q[19];
cx q[2], q[19];
rz(9.17283818781952) q[19];
cx q[2], q[19];
cx q[3], q[19];
rz(9.17283818781952) q[19];
cx q[3], q[19];
cx q[4], q[19];
rz(9.17283818781952) q[19];
cx q[4], q[19];
cx q[5], q[19];
rz(9.17283818781952) q[19];
cx q[5], q[19];
cx q[6], q[19];
rz(9.17283818781952) q[19];
cx q[6], q[19];
cx q[7], q[19];
rz(9.17283818781952) q[19];
cx q[7], q[19];
cx q[8], q[19];
rz(9.17283818781952) q[19];
cx q[8], q[19];
cx q[9], q[19];
rz(9.17283818781952) q[19];
cx q[9], q[19];
cx q[10], q[19];
rz(9.17283818781952) q[19];
cx q[10], q[19];
cx q[11], q[19];
rz(9.17283818781952) q[19];
cx q[11], q[19];
cx q[12], q[19];
rz(9.17283818781952) q[19];
cx q[12], q[19];
cx q[13], q[19];
rz(9.17283818781952) q[19];
cx q[13], q[19];
cx q[14], q[19];
rz(9.17283818781952) q[19];
cx q[14], q[19];
cx q[15], q[19];
rz(9.17283818781952) q[19];
cx q[15], q[19];
cx q[16], q[19];
rz(9.17283818781952) q[19];
cx q[16], q[19];
cx q[17], q[19];
rz(9.17283818781952) q[19];
cx q[17], q[19];
cx q[18], q[19];
rz(9.17283818781952) q[19];
cx q[18], q[19];
h q[20];
rz(2.0) q[20];
cx q[0], q[20];
rz(9.17283818781952) q[20];
cx q[0], q[20];
cx q[1], q[20];
rz(9.17283818781952) q[20];
cx q[1], q[20];
cx q[2], q[20];
rz(9.17283818781952) q[20];
cx q[2], q[20];
cx q[3], q[20];
rz(9.17283818781952) q[20];
cx q[3], q[20];
cx q[4], q[20];
rz(9.17283818781952) q[20];
cx q[4], q[20];
cx q[5], q[20];
rz(9.17283818781952) q[20];
cx q[5], q[20];
cx q[6], q[20];
rz(9.17283818781952) q[20];
cx q[6], q[20];
cx q[7], q[20];
rz(9.17283818781952) q[20];
cx q[7], q[20];
cx q[8], q[20];
rz(9.17283818781952) q[20];
cx q[8], q[20];
cx q[9], q[20];
rz(9.17283818781952) q[20];
cx q[9], q[20];
cx q[10], q[20];
rz(9.17283818781952) q[20];
cx q[10], q[20];
cx q[11], q[20];
rz(9.17283818781952) q[20];
cx q[11], q[20];
cx q[12], q[20];
rz(9.17283818781952) q[20];
cx q[12], q[20];
cx q[13], q[20];
rz(9.17283818781952) q[20];
cx q[13], q[20];
cx q[14], q[20];
rz(9.17283818781952) q[20];
cx q[14], q[20];
cx q[15], q[20];
rz(9.17283818781952) q[20];
cx q[15], q[20];
cx q[16], q[20];
rz(9.17283818781952) q[20];
cx q[16], q[20];
cx q[17], q[20];
rz(9.17283818781952) q[20];
cx q[17], q[20];
cx q[18], q[20];
rz(9.17283818781952) q[20];
cx q[18], q[20];
cx q[19], q[20];
rz(9.17283818781952) q[20];
cx q[19], q[20];
h q[21];
rz(2.0) q[21];
cx q[0], q[21];
rz(9.17283818781952) q[21];
cx q[0], q[21];
cx q[1], q[21];
rz(9.17283818781952) q[21];
cx q[1], q[21];
cx q[2], q[21];
rz(9.17283818781952) q[21];
cx q[2], q[21];
cx q[3], q[21];
rz(9.17283818781952) q[21];
cx q[3], q[21];
cx q[4], q[21];
rz(9.17283818781952) q[21];
cx q[4], q[21];
cx q[5], q[21];
rz(9.17283818781952) q[21];
cx q[5], q[21];
cx q[6], q[21];
rz(9.17283818781952) q[21];
cx q[6], q[21];
cx q[7], q[21];
rz(9.17283818781952) q[21];
cx q[7], q[21];
cx q[8], q[21];
rz(9.17283818781952) q[21];
cx q[8], q[21];
cx q[9], q[21];
rz(9.17283818781952) q[21];
cx q[9], q[21];
cx q[10], q[21];
rz(9.17283818781952) q[21];
cx q[10], q[21];
cx q[11], q[21];
rz(9.17283818781952) q[21];
cx q[11], q[21];
cx q[12], q[21];
rz(9.17283818781952) q[21];
cx q[12], q[21];
cx q[13], q[21];
rz(9.17283818781952) q[21];
cx q[13], q[21];
cx q[14], q[21];
rz(9.17283818781952) q[21];
cx q[14], q[21];
cx q[15], q[21];
rz(9.17283818781952) q[21];
cx q[15], q[21];
cx q[16], q[21];
rz(9.17283818781952) q[21];
cx q[16], q[21];
cx q[17], q[21];
rz(9.17283818781952) q[21];
cx q[17], q[21];
cx q[18], q[21];
rz(9.17283818781952) q[21];
cx q[18], q[21];
cx q[19], q[21];
rz(9.17283818781952) q[21];
cx q[19], q[21];
cx q[20], q[21];
rz(9.17283818781952) q[21];
cx q[20], q[21];
h q[22];
rz(2.0) q[22];
cx q[0], q[22];
rz(9.17283818781952) q[22];
cx q[0], q[22];
h q[0];
rz(0.42920367320510344) q[0];
cx q[1], q[22];
rz(9.17283818781952) q[22];
cx q[1], q[22];
h q[1];
rz(2.0) q[1];
cx q[0], q[1];
rz(9.17283818781952) q[1];
cx q[0], q[1];
cx q[2], q[22];
rz(9.17283818781952) q[22];
cx q[2], q[22];
h q[2];
rz(2.0) q[2];
cx q[0], q[2];
rz(9.17283818781952) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(9.17283818781952) q[2];
cx q[1], q[2];
cx q[3], q[22];
rz(9.17283818781952) q[22];
cx q[3], q[22];
h q[3];
rz(2.0) q[3];
cx q[0], q[3];
rz(9.17283818781952) q[3];
cx q[0], q[3];
cx q[1], q[3];
rz(9.17283818781952) q[3];
cx q[1], q[3];
cx q[2], q[3];
rz(9.17283818781952) q[3];
cx q[2], q[3];
cx q[4], q[22];
rz(9.17283818781952) q[22];
cx q[4], q[22];
h q[4];
rz(2.0) q[4];
cx q[0], q[4];
rz(9.17283818781952) q[4];
cx q[0], q[4];
cx q[1], q[4];
rz(9.17283818781952) q[4];
cx q[1], q[4];
cx q[2], q[4];
rz(9.17283818781952) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(9.17283818781952) q[4];
cx q[3], q[4];
cx q[5], q[22];
rz(9.17283818781952) q[22];
cx q[5], q[22];
h q[5];
rz(2.0) q[5];
cx q[0], q[5];
rz(9.17283818781952) q[5];
cx q[0], q[5];
cx q[1], q[5];
rz(9.17283818781952) q[5];
cx q[1], q[5];
cx q[2], q[5];
rz(9.17283818781952) q[5];
cx q[2], q[5];
cx q[3], q[5];
rz(9.17283818781952) q[5];
cx q[3], q[5];
cx q[4], q[5];
rz(9.17283818781952) q[5];
cx q[4], q[5];
cx q[6], q[22];
rz(9.17283818781952) q[22];
cx q[6], q[22];
h q[6];
rz(2.0) q[6];
cx q[0], q[6];
rz(9.17283818781952) q[6];
cx q[0], q[6];
cx q[1], q[6];
rz(9.17283818781952) q[6];
cx q[1], q[6];
cx q[2], q[6];
rz(9.17283818781952) q[6];
cx q[2], q[6];
cx q[3], q[6];
rz(9.17283818781952) q[6];
cx q[3], q[6];
cx q[4], q[6];
rz(9.17283818781952) q[6];
cx q[4], q[6];
cx q[5], q[6];
rz(9.17283818781952) q[6];
cx q[5], q[6];
cx q[7], q[22];
rz(9.17283818781952) q[22];
cx q[7], q[22];
h q[7];
rz(2.0) q[7];
cx q[0], q[7];
rz(9.17283818781952) q[7];
cx q[0], q[7];
cx q[1], q[7];
rz(9.17283818781952) q[7];
cx q[1], q[7];
cx q[2], q[7];
rz(9.17283818781952) q[7];
cx q[2], q[7];
cx q[3], q[7];
rz(9.17283818781952) q[7];
cx q[3], q[7];
cx q[4], q[7];
rz(9.17283818781952) q[7];
cx q[4], q[7];
cx q[5], q[7];
rz(9.17283818781952) q[7];
cx q[5], q[7];
cx q[6], q[7];
rz(9.17283818781952) q[7];
cx q[6], q[7];
cx q[8], q[22];
rz(9.17283818781952) q[22];
cx q[8], q[22];
h q[8];
rz(2.0) q[8];
cx q[0], q[8];
rz(9.17283818781952) q[8];
cx q[0], q[8];
cx q[1], q[8];
rz(9.17283818781952) q[8];
cx q[1], q[8];
cx q[2], q[8];
rz(9.17283818781952) q[8];
cx q[2], q[8];
cx q[3], q[8];
rz(9.17283818781952) q[8];
cx q[3], q[8];
cx q[4], q[8];
rz(9.17283818781952) q[8];
cx q[4], q[8];
cx q[5], q[8];
rz(9.17283818781952) q[8];
cx q[5], q[8];
cx q[6], q[8];
rz(9.17283818781952) q[8];
cx q[6], q[8];
cx q[7], q[8];
rz(9.17283818781952) q[8];
cx q[7], q[8];
cx q[9], q[22];
rz(9.17283818781952) q[22];
cx q[9], q[22];
h q[9];
rz(2.0) q[9];
cx q[0], q[9];
rz(9.17283818781952) q[9];
cx q[0], q[9];
cx q[1], q[9];
rz(9.17283818781952) q[9];
cx q[1], q[9];
cx q[2], q[9];
rz(9.17283818781952) q[9];
cx q[2], q[9];
cx q[3], q[9];
rz(9.17283818781952) q[9];
cx q[3], q[9];
cx q[4], q[9];
rz(9.17283818781952) q[9];
cx q[4], q[9];
cx q[5], q[9];
rz(9.17283818781952) q[9];
cx q[5], q[9];
cx q[6], q[9];
rz(9.17283818781952) q[9];
cx q[6], q[9];
cx q[7], q[9];
rz(9.17283818781952) q[9];
cx q[7], q[9];
cx q[8], q[9];
rz(9.17283818781952) q[9];
cx q[8], q[9];
cx q[10], q[22];
rz(9.17283818781952) q[22];
cx q[10], q[22];
h q[10];
rz(2.0) q[10];
cx q[0], q[10];
rz(9.17283818781952) q[10];
cx q[0], q[10];
cx q[1], q[10];
rz(9.17283818781952) q[10];
cx q[1], q[10];
cx q[2], q[10];
rz(9.17283818781952) q[10];
cx q[2], q[10];
cx q[3], q[10];
rz(9.17283818781952) q[10];
cx q[3], q[10];
cx q[4], q[10];
rz(9.17283818781952) q[10];
cx q[4], q[10];
cx q[5], q[10];
rz(9.17283818781952) q[10];
cx q[5], q[10];
cx q[6], q[10];
rz(9.17283818781952) q[10];
cx q[6], q[10];
cx q[7], q[10];
rz(9.17283818781952) q[10];
cx q[7], q[10];
cx q[8], q[10];
rz(9.17283818781952) q[10];
cx q[8], q[10];
cx q[9], q[10];
rz(9.17283818781952) q[10];
cx q[9], q[10];
cx q[11], q[22];
rz(9.17283818781952) q[22];
cx q[11], q[22];
h q[11];
rz(2.0) q[11];
cx q[0], q[11];
rz(9.17283818781952) q[11];
cx q[0], q[11];
cx q[1], q[11];
rz(9.17283818781952) q[11];
cx q[1], q[11];
cx q[2], q[11];
rz(9.17283818781952) q[11];
cx q[2], q[11];
cx q[3], q[11];
rz(9.17283818781952) q[11];
cx q[3], q[11];
cx q[4], q[11];
rz(9.17283818781952) q[11];
cx q[4], q[11];
cx q[5], q[11];
rz(9.17283818781952) q[11];
cx q[5], q[11];
cx q[6], q[11];
rz(9.17283818781952) q[11];
cx q[6], q[11];
cx q[7], q[11];
rz(9.17283818781952) q[11];
cx q[7], q[11];
cx q[8], q[11];
rz(9.17283818781952) q[11];
cx q[8], q[11];
cx q[9], q[11];
rz(9.17283818781952) q[11];
cx q[9], q[11];
cx q[10], q[11];
rz(9.17283818781952) q[11];
cx q[10], q[11];
cx q[12], q[22];
rz(9.17283818781952) q[22];
cx q[12], q[22];
h q[12];
rz(2.0) q[12];
cx q[0], q[12];
rz(9.17283818781952) q[12];
cx q[0], q[12];
cx q[1], q[12];
rz(9.17283818781952) q[12];
cx q[1], q[12];
cx q[2], q[12];
rz(9.17283818781952) q[12];
cx q[2], q[12];
cx q[3], q[12];
rz(9.17283818781952) q[12];
cx q[3], q[12];
cx q[4], q[12];
rz(9.17283818781952) q[12];
cx q[4], q[12];
cx q[5], q[12];
rz(9.17283818781952) q[12];
cx q[5], q[12];
cx q[6], q[12];
rz(9.17283818781952) q[12];
cx q[6], q[12];
cx q[7], q[12];
rz(9.17283818781952) q[12];
cx q[7], q[12];
cx q[8], q[12];
rz(9.17283818781952) q[12];
cx q[8], q[12];
cx q[9], q[12];
rz(9.17283818781952) q[12];
cx q[9], q[12];
cx q[10], q[12];
rz(9.17283818781952) q[12];
cx q[10], q[12];
cx q[11], q[12];
rz(9.17283818781952) q[12];
cx q[11], q[12];
cx q[13], q[22];
rz(9.17283818781952) q[22];
cx q[13], q[22];
h q[13];
rz(2.0) q[13];
cx q[0], q[13];
rz(9.17283818781952) q[13];
cx q[0], q[13];
cx q[1], q[13];
rz(9.17283818781952) q[13];
cx q[1], q[13];
cx q[2], q[13];
rz(9.17283818781952) q[13];
cx q[2], q[13];
cx q[3], q[13];
rz(9.17283818781952) q[13];
cx q[3], q[13];
cx q[4], q[13];
rz(9.17283818781952) q[13];
cx q[4], q[13];
cx q[5], q[13];
rz(9.17283818781952) q[13];
cx q[5], q[13];
cx q[6], q[13];
rz(9.17283818781952) q[13];
cx q[6], q[13];
cx q[7], q[13];
rz(9.17283818781952) q[13];
cx q[7], q[13];
cx q[8], q[13];
rz(9.17283818781952) q[13];
cx q[8], q[13];
cx q[9], q[13];
rz(9.17283818781952) q[13];
cx q[9], q[13];
cx q[10], q[13];
rz(9.17283818781952) q[13];
cx q[10], q[13];
cx q[11], q[13];
rz(9.17283818781952) q[13];
cx q[11], q[13];
cx q[12], q[13];
rz(9.17283818781952) q[13];
cx q[12], q[13];
cx q[14], q[22];
rz(9.17283818781952) q[22];
cx q[14], q[22];
h q[14];
rz(2.0) q[14];
cx q[0], q[14];
rz(9.17283818781952) q[14];
cx q[0], q[14];
cx q[1], q[14];
rz(9.17283818781952) q[14];
cx q[1], q[14];
cx q[2], q[14];
rz(9.17283818781952) q[14];
cx q[2], q[14];
cx q[3], q[14];
rz(9.17283818781952) q[14];
cx q[3], q[14];
cx q[4], q[14];
rz(9.17283818781952) q[14];
cx q[4], q[14];
cx q[5], q[14];
rz(9.17283818781952) q[14];
cx q[5], q[14];
cx q[6], q[14];
rz(9.17283818781952) q[14];
cx q[6], q[14];
cx q[7], q[14];
rz(9.17283818781952) q[14];
cx q[7], q[14];
cx q[8], q[14];
rz(9.17283818781952) q[14];
cx q[8], q[14];
cx q[9], q[14];
rz(9.17283818781952) q[14];
cx q[9], q[14];
cx q[10], q[14];
rz(9.17283818781952) q[14];
cx q[10], q[14];
cx q[11], q[14];
rz(9.17283818781952) q[14];
cx q[11], q[14];
cx q[12], q[14];
rz(9.17283818781952) q[14];
cx q[12], q[14];
cx q[13], q[14];
rz(9.17283818781952) q[14];
cx q[13], q[14];
cx q[15], q[22];
rz(9.17283818781952) q[22];
cx q[15], q[22];
h q[15];
rz(2.0) q[15];
cx q[0], q[15];
rz(9.17283818781952) q[15];
cx q[0], q[15];
cx q[1], q[15];
rz(9.17283818781952) q[15];
cx q[1], q[15];
cx q[2], q[15];
rz(9.17283818781952) q[15];
cx q[2], q[15];
cx q[3], q[15];
rz(9.17283818781952) q[15];
cx q[3], q[15];
cx q[4], q[15];
rz(9.17283818781952) q[15];
cx q[4], q[15];
cx q[5], q[15];
rz(9.17283818781952) q[15];
cx q[5], q[15];
cx q[6], q[15];
rz(9.17283818781952) q[15];
cx q[6], q[15];
cx q[7], q[15];
rz(9.17283818781952) q[15];
cx q[7], q[15];
cx q[8], q[15];
rz(9.17283818781952) q[15];
cx q[8], q[15];
cx q[9], q[15];
rz(9.17283818781952) q[15];
cx q[9], q[15];
cx q[10], q[15];
rz(9.17283818781952) q[15];
cx q[10], q[15];
cx q[11], q[15];
rz(9.17283818781952) q[15];
cx q[11], q[15];
cx q[12], q[15];
rz(9.17283818781952) q[15];
cx q[12], q[15];
cx q[13], q[15];
rz(9.17283818781952) q[15];
cx q[13], q[15];
cx q[14], q[15];
rz(9.17283818781952) q[15];
cx q[14], q[15];
cx q[16], q[22];
rz(9.17283818781952) q[22];
cx q[16], q[22];
h q[16];
rz(2.0) q[16];
cx q[0], q[16];
rz(9.17283818781952) q[16];
cx q[0], q[16];
cx q[1], q[16];
rz(9.17283818781952) q[16];
cx q[1], q[16];
cx q[2], q[16];
rz(9.17283818781952) q[16];
cx q[2], q[16];
cx q[3], q[16];
rz(9.17283818781952) q[16];
cx q[3], q[16];
cx q[4], q[16];
rz(9.17283818781952) q[16];
cx q[4], q[16];
cx q[5], q[16];
rz(9.17283818781952) q[16];
cx q[5], q[16];
cx q[6], q[16];
rz(9.17283818781952) q[16];
cx q[6], q[16];
cx q[7], q[16];
rz(9.17283818781952) q[16];
cx q[7], q[16];
cx q[8], q[16];
rz(9.17283818781952) q[16];
cx q[8], q[16];
cx q[9], q[16];
rz(9.17283818781952) q[16];
cx q[9], q[16];
cx q[10], q[16];
rz(9.17283818781952) q[16];
cx q[10], q[16];
cx q[11], q[16];
rz(9.17283818781952) q[16];
cx q[11], q[16];
cx q[12], q[16];
rz(9.17283818781952) q[16];
cx q[12], q[16];
cx q[13], q[16];
rz(9.17283818781952) q[16];
cx q[13], q[16];
cx q[14], q[16];
rz(9.17283818781952) q[16];
cx q[14], q[16];
cx q[15], q[16];
rz(9.17283818781952) q[16];
cx q[15], q[16];
cx q[17], q[22];
rz(9.17283818781952) q[22];
cx q[17], q[22];
h q[17];
rz(2.0) q[17];
cx q[0], q[17];
rz(9.17283818781952) q[17];
cx q[0], q[17];
cx q[1], q[17];
rz(9.17283818781952) q[17];
cx q[1], q[17];
cx q[2], q[17];
rz(9.17283818781952) q[17];
cx q[2], q[17];
cx q[3], q[17];
rz(9.17283818781952) q[17];
cx q[3], q[17];
cx q[4], q[17];
rz(9.17283818781952) q[17];
cx q[4], q[17];
cx q[5], q[17];
rz(9.17283818781952) q[17];
cx q[5], q[17];
cx q[6], q[17];
rz(9.17283818781952) q[17];
cx q[6], q[17];
cx q[7], q[17];
rz(9.17283818781952) q[17];
cx q[7], q[17];
cx q[8], q[17];
rz(9.17283818781952) q[17];
cx q[8], q[17];
cx q[9], q[17];
rz(9.17283818781952) q[17];
cx q[9], q[17];
cx q[10], q[17];
rz(9.17283818781952) q[17];
cx q[10], q[17];
cx q[11], q[17];
rz(9.17283818781952) q[17];
cx q[11], q[17];
cx q[12], q[17];
rz(9.17283818781952) q[17];
cx q[12], q[17];
cx q[13], q[17];
rz(9.17283818781952) q[17];
cx q[13], q[17];
cx q[14], q[17];
rz(9.17283818781952) q[17];
cx q[14], q[17];
cx q[15], q[17];
rz(9.17283818781952) q[17];
cx q[15], q[17];
cx q[16], q[17];
rz(9.17283818781952) q[17];
cx q[16], q[17];
cx q[18], q[22];
rz(9.17283818781952) q[22];
cx q[18], q[22];
h q[18];
rz(2.0) q[18];
cx q[0], q[18];
rz(9.17283818781952) q[18];
cx q[0], q[18];
cx q[1], q[18];
rz(9.17283818781952) q[18];
cx q[1], q[18];
cx q[2], q[18];
rz(9.17283818781952) q[18];
cx q[2], q[18];
cx q[3], q[18];
rz(9.17283818781952) q[18];
cx q[3], q[18];
cx q[4], q[18];
rz(9.17283818781952) q[18];
cx q[4], q[18];
cx q[5], q[18];
rz(9.17283818781952) q[18];
cx q[5], q[18];
cx q[6], q[18];
rz(9.17283818781952) q[18];
cx q[6], q[18];
cx q[7], q[18];
rz(9.17283818781952) q[18];
cx q[7], q[18];
cx q[8], q[18];
rz(9.17283818781952) q[18];
cx q[8], q[18];
cx q[9], q[18];
rz(9.17283818781952) q[18];
cx q[9], q[18];
cx q[10], q[18];
rz(9.17283818781952) q[18];
cx q[10], q[18];
cx q[11], q[18];
rz(9.17283818781952) q[18];
cx q[11], q[18];
cx q[12], q[18];
rz(9.17283818781952) q[18];
cx q[12], q[18];
cx q[13], q[18];
rz(9.17283818781952) q[18];
cx q[13], q[18];
cx q[14], q[18];
rz(9.17283818781952) q[18];
cx q[14], q[18];
cx q[15], q[18];
rz(9.17283818781952) q[18];
cx q[15], q[18];
cx q[16], q[18];
rz(9.17283818781952) q[18];
cx q[16], q[18];
cx q[17], q[18];
rz(9.17283818781952) q[18];
cx q[17], q[18];
cx q[19], q[22];
rz(9.17283818781952) q[22];
cx q[19], q[22];
h q[19];
rz(2.0) q[19];
cx q[0], q[19];
rz(9.17283818781952) q[19];
cx q[0], q[19];
cx q[1], q[19];
rz(9.17283818781952) q[19];
cx q[1], q[19];
cx q[2], q[19];
rz(9.17283818781952) q[19];
cx q[2], q[19];
cx q[3], q[19];
rz(9.17283818781952) q[19];
cx q[3], q[19];
cx q[4], q[19];
rz(9.17283818781952) q[19];
cx q[4], q[19];
cx q[5], q[19];
rz(9.17283818781952) q[19];
cx q[5], q[19];
cx q[6], q[19];
rz(9.17283818781952) q[19];
cx q[6], q[19];
cx q[7], q[19];
rz(9.17283818781952) q[19];
cx q[7], q[19];
cx q[8], q[19];
rz(9.17283818781952) q[19];
cx q[8], q[19];
cx q[9], q[19];
rz(9.17283818781952) q[19];
cx q[9], q[19];
cx q[10], q[19];
rz(9.17283818781952) q[19];
cx q[10], q[19];
cx q[11], q[19];
rz(9.17283818781952) q[19];
cx q[11], q[19];
cx q[12], q[19];
rz(9.17283818781952) q[19];
cx q[12], q[19];
cx q[13], q[19];
rz(9.17283818781952) q[19];
cx q[13], q[19];
cx q[14], q[19];
rz(9.17283818781952) q[19];
cx q[14], q[19];
cx q[15], q[19];
rz(9.17283818781952) q[19];
cx q[15], q[19];
cx q[16], q[19];
rz(9.17283818781952) q[19];
cx q[16], q[19];
cx q[17], q[19];
rz(9.17283818781952) q[19];
cx q[17], q[19];
cx q[18], q[19];
rz(9.17283818781952) q[19];
cx q[18], q[19];
cx q[20], q[22];
rz(9.17283818781952) q[22];
cx q[20], q[22];
h q[20];
rz(2.0) q[20];
cx q[0], q[20];
rz(9.17283818781952) q[20];
cx q[0], q[20];
cx q[1], q[20];
rz(9.17283818781952) q[20];
cx q[1], q[20];
cx q[2], q[20];
rz(9.17283818781952) q[20];
cx q[2], q[20];
cx q[3], q[20];
rz(9.17283818781952) q[20];
cx q[3], q[20];
cx q[4], q[20];
rz(9.17283818781952) q[20];
cx q[4], q[20];
cx q[5], q[20];
rz(9.17283818781952) q[20];
cx q[5], q[20];
cx q[6], q[20];
rz(9.17283818781952) q[20];
cx q[6], q[20];
cx q[7], q[20];
rz(9.17283818781952) q[20];
cx q[7], q[20];
cx q[8], q[20];
rz(9.17283818781952) q[20];
cx q[8], q[20];
cx q[9], q[20];
rz(9.17283818781952) q[20];
cx q[9], q[20];
cx q[10], q[20];
rz(9.17283818781952) q[20];
cx q[10], q[20];
cx q[11], q[20];
rz(9.17283818781952) q[20];
cx q[11], q[20];
cx q[12], q[20];
rz(9.17283818781952) q[20];
cx q[12], q[20];
cx q[13], q[20];
rz(9.17283818781952) q[20];
cx q[13], q[20];
cx q[14], q[20];
rz(9.17283818781952) q[20];
cx q[14], q[20];
cx q[15], q[20];
rz(9.17283818781952) q[20];
cx q[15], q[20];
cx q[16], q[20];
rz(9.17283818781952) q[20];
cx q[16], q[20];
cx q[17], q[20];
rz(9.17283818781952) q[20];
cx q[17], q[20];
cx q[18], q[20];
rz(9.17283818781952) q[20];
cx q[18], q[20];
cx q[19], q[20];
rz(9.17283818781952) q[20];
cx q[19], q[20];
cx q[21], q[22];
rz(9.17283818781952) q[22];
cx q[21], q[22];
h q[21];
rz(2.0) q[21];
cx q[0], q[21];
rz(9.17283818781952) q[21];
cx q[0], q[21];
cx q[1], q[21];
rz(9.17283818781952) q[21];
cx q[1], q[21];
cx q[2], q[21];
rz(9.17283818781952) q[21];
cx q[2], q[21];
cx q[3], q[21];
rz(9.17283818781952) q[21];
cx q[3], q[21];
cx q[4], q[21];
rz(9.17283818781952) q[21];
cx q[4], q[21];
cx q[5], q[21];
rz(9.17283818781952) q[21];
cx q[5], q[21];
cx q[6], q[21];
rz(9.17283818781952) q[21];
cx q[6], q[21];
cx q[7], q[21];
rz(9.17283818781952) q[21];
cx q[7], q[21];
cx q[8], q[21];
rz(9.17283818781952) q[21];
cx q[8], q[21];
cx q[9], q[21];
rz(9.17283818781952) q[21];
cx q[9], q[21];
cx q[10], q[21];
rz(9.17283818781952) q[21];
cx q[10], q[21];
cx q[11], q[21];
rz(9.17283818781952) q[21];
cx q[11], q[21];
cx q[12], q[21];
rz(9.17283818781952) q[21];
cx q[12], q[21];
cx q[13], q[21];
rz(9.17283818781952) q[21];
cx q[13], q[21];
cx q[14], q[21];
rz(9.17283818781952) q[21];
cx q[14], q[21];
cx q[15], q[21];
rz(9.17283818781952) q[21];
cx q[15], q[21];
cx q[16], q[21];
rz(9.17283818781952) q[21];
cx q[16], q[21];
cx q[17], q[21];
rz(9.17283818781952) q[21];
cx q[17], q[21];
cx q[18], q[21];
rz(9.17283818781952) q[21];
cx q[18], q[21];
cx q[19], q[21];
rz(9.17283818781952) q[21];
cx q[19], q[21];
cx q[20], q[21];
rz(9.17283818781952) q[21];
cx q[20], q[21];
h q[22];
rz(2.0) q[22];
cx q[0], q[22];
rz(9.17283818781952) q[22];
cx q[0], q[22];
h q[0];
rz(0.44425274861157016) q[0];
h q[0];
cx q[1], q[22];
rz(9.17283818781952) q[22];
cx q[1], q[22];
rz(-pi/2) q[1];
h q[1];
rz(0.1938865432356982) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[22];
rz(9.17283818781952) q[22];
cx q[2], q[22];
rz(-pi/2) q[2];
h q[2];
rz(0.44307718947074193) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[3], q[22];
rz(9.17283818781952) q[22];
cx q[3], q[22];
rz(-pi/2) q[3];
h q[3];
rz(0.30873244501584685) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[4], q[22];
rz(9.17283818781952) q[22];
cx q[4], q[22];
rz(-pi/2) q[4];
h q[4];
rz(0.7249491746562611) q[4];
h q[4];
rz(5*pi/2) q[4];
cx q[5], q[22];
rz(9.17283818781952) q[22];
cx q[5], q[22];
rz(-pi/2) q[5];
h q[5];
rz(0.18627032340238703) q[5];
h q[5];
rz(5*pi/2) q[5];
cx q[6], q[22];
rz(9.17283818781952) q[22];
cx q[6], q[22];
rz(-pi/2) q[6];
h q[6];
rz(0.21292442810162582) q[6];
h q[6];
rz(5*pi/2) q[6];
cx q[7], q[22];
rz(9.17283818781952) q[22];
cx q[7], q[22];
rz(-pi/2) q[7];
h q[7];
rz(0.6295784965679059) q[7];
h q[7];
rz(5*pi/2) q[7];
cx q[8], q[22];
rz(9.17283818781952) q[22];
cx q[8], q[22];
rz(-pi/2) q[8];
h q[8];
rz(0.5848674672867871) q[8];
h q[8];
rz(5*pi/2) q[8];
cx q[9], q[22];
rz(9.17283818781952) q[22];
cx q[9], q[22];
rz(-pi/2) q[9];
h q[9];
rz(0.9474255900507691) q[9];
h q[9];
rz(5*pi/2) q[9];
cx q[10], q[22];
rz(9.17283818781952) q[22];
cx q[10], q[22];
rz(-pi/2) q[10];
h q[10];
rz(0.8047344601400739) q[10];
h q[10];
rz(5*pi/2) q[10];
cx q[11], q[22];
rz(9.17283818781952) q[22];
cx q[11], q[22];
rz(-pi/2) q[11];
h q[11];
rz(0.05237272522831615) q[11];
h q[11];
rz(5*pi/2) q[11];
cx q[12], q[22];
rz(9.17283818781952) q[22];
cx q[12], q[22];
rz(-pi/2) q[12];
h q[12];
rz(0.26477489176703184) q[12];
h q[12];
rz(5*pi/2) q[12];
cx q[13], q[22];
rz(9.17283818781952) q[22];
cx q[13], q[22];
rz(-pi/2) q[13];
h q[13];
rz(0.022973738326701465) q[13];
h q[13];
rz(5*pi/2) q[13];
cx q[14], q[22];
rz(9.17283818781952) q[22];
cx q[14], q[22];
rz(-pi/2) q[14];
h q[14];
rz(0.8715164254502987) q[14];
h q[14];
rz(5*pi/2) q[14];
cx q[15], q[22];
rz(9.17283818781952) q[22];
cx q[15], q[22];
rz(-pi/2) q[15];
h q[15];
rz(0.694273406174942) q[15];
h q[15];
rz(5*pi/2) q[15];
cx q[16], q[22];
rz(9.17283818781952) q[22];
cx q[16], q[22];
rz(-pi/2) q[16];
h q[16];
rz(0.06564196103040043) q[16];
h q[16];
rz(5*pi/2) q[16];
cx q[17], q[22];
rz(9.17283818781952) q[22];
cx q[17], q[22];
rz(-pi/2) q[17];
h q[17];
rz(0.21068190660462083) q[17];
h q[17];
rz(5*pi/2) q[17];
cx q[18], q[22];
rz(9.17283818781952) q[22];
cx q[18], q[22];
rz(-pi/2) q[18];
h q[18];
rz(0.550660834026107) q[18];
h q[18];
rz(5*pi/2) q[18];
cx q[19], q[22];
rz(9.17283818781952) q[22];
cx q[19], q[22];
rz(-pi/2) q[19];
h q[19];
rz(0.2552103384700688) q[19];
h q[19];
rz(5*pi/2) q[19];
cx q[20], q[22];
rz(9.17283818781952) q[22];
cx q[20], q[22];
rz(-pi/2) q[20];
h q[20];
rz(0.25648260938727585) q[20];
h q[20];
rz(5*pi/2) q[20];
cx q[21], q[22];
rz(9.17283818781952) q[22];
cx q[21], q[22];
rz(-pi/2) q[21];
h q[21];
rz(0.307314893198253) q[21];
h q[21];
rz(5*pi/2) q[21];
rz(0) q[22];
rz(-pi/2) q[22];
h q[22];
rz(0.7754089333019469) q[22];
h q[22];
rz(5*pi/2) q[22];
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
h q[0];
rz(0.30105501997572093) q[0];
h q[0];
rz(5*pi/2) q[0];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.1562099091984468) q[1];
h q[1];
rz(5*pi/2) q[1];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.3482806824360032) q[2];
h q[2];
rz(5*pi/2) q[2];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(0.7847147026992451) q[3];
h q[3];
rz(5*pi/2) q[3];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(0.4791415795485481) q[4];
h q[4];
rz(5*pi/2) q[4];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(0.3494294761109318) q[5];
h q[5];
rz(5*pi/2) q[5];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(0.12120779776252011) q[6];
h q[6];
rz(5*pi/2) q[6];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(0.10368923250918716) q[7];
h q[7];
rz(5*pi/2) q[7];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(0.9649298420365024) q[8];
h q[8];
rz(5*pi/2) q[8];
rz(0) q[9];
rz(-pi/2) q[9];
h q[9];
rz(0.3911689462188912) q[9];
h q[9];
rz(5*pi/2) q[9];
rz(0) q[10];
rz(-pi/2) q[10];
h q[10];
rz(0.7087810817703541) q[10];
h q[10];
rz(5*pi/2) q[10];
rz(0) q[11];
rz(-pi/2) q[11];
h q[11];
rz(0.64663155072772) q[11];
h q[11];
rz(5*pi/2) q[11];
rz(0) q[12];
rz(-pi/2) q[12];
h q[12];
rz(0.38960297434750224) q[12];
h q[12];
rz(5*pi/2) q[12];
rz(0) q[13];
rz(-pi/2) q[13];
h q[13];
rz(0.5153260722881989) q[13];
h q[13];
rz(5*pi/2) q[13];
rz(0) q[14];
rz(-pi/2) q[14];
h q[14];
rz(0.3707110077163698) q[14];
h q[14];
rz(5*pi/2) q[14];
rz(0) q[15];
rz(-pi/2) q[15];
h q[15];
rz(0.6584771902035489) q[15];
h q[15];
rz(5*pi/2) q[15];
rz(0) q[16];
rz(-pi/2) q[16];
h q[16];
rz(0.9544128669168064) q[16];
h q[16];
rz(5*pi/2) q[16];
rz(0) q[17];
rz(-pi/2) q[17];
h q[17];
rz(0.44478222552897195) q[17];
h q[17];
rz(5*pi/2) q[17];
rz(0) q[18];
rz(-pi/2) q[18];
h q[18];
rz(0.4585778658538868) q[18];
h q[18];
rz(5*pi/2) q[18];
rz(0) q[19];
rz(-pi/2) q[19];
h q[19];
rz(0.9643523030678454) q[19];
h q[19];
rz(5*pi/2) q[19];
rz(0) q[20];
rz(-pi/2) q[20];
h q[20];
rz(0.901970925343079) q[20];
h q[20];
rz(5*pi/2) q[20];
rz(0) q[21];
rz(-pi/2) q[21];
h q[21];
rz(0.19547843187227087) q[21];
h q[21];
rz(5*pi/2) q[21];
rz(0) q[22];
rz(-pi/2) q[22];
h q[22];
rz(0.826398785765007) q[22];
h q[22];
rz(5*pi/2) q[22];
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
