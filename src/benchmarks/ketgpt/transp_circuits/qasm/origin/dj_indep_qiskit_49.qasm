OPENQASM 3.0;
include "stdgates.inc";
bit[48] c;
qubit[49] q;
rz(-pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(pi/2) q[0];
rz(-pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(pi/2) q[1];
h q[2];
rz(-pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(pi/2) q[3];
h q[4];
rz(-pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(pi/2) q[5];
rz(-pi/2) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(pi/2) q[6];
h q[7];
rz(-pi/2) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(pi/2) q[8];
rz(-pi/2) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(pi/2) q[9];
h q[10];
rz(-pi/2) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(pi/2) q[11];
rz(-pi/2) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(pi/2) q[12];
h q[13];
h q[14];
rz(-pi/2) q[15];
rz(-pi/2) q[15];
h q[15];
rz(-pi/2) q[15];
rz(pi/2) q[15];
h q[16];
h q[17];
h q[18];
h q[19];
h q[20];
rz(-pi/2) q[21];
rz(-pi/2) q[21];
h q[21];
rz(-pi/2) q[21];
rz(pi/2) q[21];
h q[22];
h q[23];
rz(-pi/2) q[24];
rz(-pi/2) q[24];
h q[24];
rz(-pi/2) q[24];
rz(pi/2) q[24];
rz(-pi/2) q[25];
rz(-pi/2) q[25];
h q[25];
rz(-pi/2) q[25];
rz(pi/2) q[25];
h q[26];
h q[27];
rz(-pi/2) q[28];
rz(-pi/2) q[28];
h q[28];
rz(-pi/2) q[28];
rz(pi/2) q[28];
h q[29];
h q[30];
rz(-pi/2) q[31];
rz(-pi/2) q[31];
h q[31];
rz(-pi/2) q[31];
rz(pi/2) q[31];
h q[32];
h q[33];
h q[34];
rz(-pi/2) q[35];
rz(-pi/2) q[35];
h q[35];
rz(-pi/2) q[35];
rz(pi/2) q[35];
rz(-pi/2) q[36];
rz(-pi/2) q[36];
h q[36];
rz(-pi/2) q[36];
rz(pi/2) q[36];
h q[37];
rz(-pi/2) q[38];
rz(-pi/2) q[38];
h q[38];
rz(-pi/2) q[38];
rz(pi/2) q[38];
rz(-pi/2) q[39];
rz(-pi/2) q[39];
h q[39];
rz(-pi/2) q[39];
rz(pi/2) q[39];
rz(-pi/2) q[40];
rz(-pi/2) q[40];
h q[40];
rz(-pi/2) q[40];
rz(pi/2) q[40];
rz(-pi/2) q[41];
rz(-pi/2) q[41];
h q[41];
rz(-pi/2) q[41];
rz(pi/2) q[41];
rz(-pi/2) q[42];
rz(-pi/2) q[42];
h q[42];
rz(-pi/2) q[42];
rz(pi/2) q[42];
h q[43];
rz(-pi/2) q[44];
rz(-pi/2) q[44];
h q[44];
rz(-pi/2) q[44];
rz(pi/2) q[44];
h q[45];
h q[46];
h q[47];
rz(-3*pi/2) q[48];
rz(-pi/2) q[48];
h q[48];
rz(-pi/2) q[48];
rz(-pi/2) q[48];
cx q[0], q[48];
rz(-3*pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(-pi/2) q[0];
cx q[1], q[48];
rz(-3*pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(-pi/2) q[1];
cx q[2], q[48];
h q[2];
cx q[3], q[48];
rz(-3*pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(-pi/2) q[3];
cx q[4], q[48];
h q[4];
cx q[5], q[48];
rz(-3*pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(-pi/2) q[5];
cx q[6], q[48];
rz(-3*pi/2) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(-pi/2) q[6];
cx q[7], q[48];
h q[7];
cx q[8], q[48];
rz(-3*pi/2) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(-pi/2) q[8];
cx q[9], q[48];
rz(-3*pi/2) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(-pi/2) q[9];
cx q[10], q[48];
h q[10];
cx q[11], q[48];
rz(-3*pi/2) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(-pi/2) q[11];
cx q[12], q[48];
rz(-3*pi/2) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(-pi/2) q[12];
cx q[13], q[48];
h q[13];
cx q[14], q[48];
h q[14];
cx q[15], q[48];
rz(-3*pi/2) q[15];
rz(-pi/2) q[15];
h q[15];
rz(-pi/2) q[15];
rz(-pi/2) q[15];
cx q[16], q[48];
h q[16];
cx q[17], q[48];
h q[17];
cx q[18], q[48];
h q[18];
cx q[19], q[48];
h q[19];
cx q[20], q[48];
h q[20];
cx q[21], q[48];
rz(-3*pi/2) q[21];
rz(-pi/2) q[21];
h q[21];
rz(-pi/2) q[21];
rz(-pi/2) q[21];
cx q[22], q[48];
h q[22];
cx q[23], q[48];
h q[23];
cx q[24], q[48];
rz(-3*pi/2) q[24];
rz(-pi/2) q[24];
h q[24];
rz(-pi/2) q[24];
rz(-pi/2) q[24];
cx q[25], q[48];
rz(-3*pi/2) q[25];
rz(-pi/2) q[25];
h q[25];
rz(-pi/2) q[25];
rz(-pi/2) q[25];
cx q[26], q[48];
h q[26];
cx q[27], q[48];
h q[27];
cx q[28], q[48];
rz(-3*pi/2) q[28];
rz(-pi/2) q[28];
h q[28];
rz(-pi/2) q[28];
rz(-pi/2) q[28];
cx q[29], q[48];
h q[29];
cx q[30], q[48];
h q[30];
cx q[31], q[48];
rz(-3*pi/2) q[31];
rz(-pi/2) q[31];
h q[31];
rz(-pi/2) q[31];
rz(-pi/2) q[31];
cx q[32], q[48];
h q[32];
cx q[33], q[48];
h q[33];
cx q[34], q[48];
h q[34];
cx q[35], q[48];
rz(-3*pi/2) q[35];
rz(-pi/2) q[35];
h q[35];
rz(-pi/2) q[35];
rz(-pi/2) q[35];
cx q[36], q[48];
rz(-3*pi/2) q[36];
rz(-pi/2) q[36];
h q[36];
rz(-pi/2) q[36];
rz(-pi/2) q[36];
cx q[37], q[48];
h q[37];
cx q[38], q[48];
rz(-3*pi/2) q[38];
rz(-pi/2) q[38];
h q[38];
rz(-pi/2) q[38];
rz(-pi/2) q[38];
cx q[39], q[48];
rz(-3*pi/2) q[39];
rz(-pi/2) q[39];
h q[39];
rz(-pi/2) q[39];
rz(-pi/2) q[39];
cx q[40], q[48];
rz(-3*pi/2) q[40];
rz(-pi/2) q[40];
h q[40];
rz(-pi/2) q[40];
rz(-pi/2) q[40];
cx q[41], q[48];
rz(-3*pi/2) q[41];
rz(-pi/2) q[41];
h q[41];
rz(-pi/2) q[41];
rz(-pi/2) q[41];
cx q[42], q[48];
rz(-3*pi/2) q[42];
rz(-pi/2) q[42];
h q[42];
rz(-pi/2) q[42];
rz(-pi/2) q[42];
cx q[43], q[48];
h q[43];
cx q[44], q[48];
rz(-3*pi/2) q[44];
rz(-pi/2) q[44];
h q[44];
rz(-pi/2) q[44];
rz(-pi/2) q[44];
cx q[45], q[48];
h q[45];
cx q[46], q[48];
h q[46];
cx q[47], q[48];
h q[47];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], q[11], q[12], q[13], q[14], q[15], q[16], q[17], q[18], q[19], q[20], q[21], q[22], q[23], q[24], q[25], q[26], q[27], q[28], q[29], q[30], q[31], q[32], q[33], q[34], q[35], q[36], q[37], q[38], q[39], q[40], q[41], q[42], q[43], q[44], q[45], q[46], q[47], q[48];
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
c[22] = measure q[22];
c[23] = measure q[23];
c[24] = measure q[24];
c[25] = measure q[25];
c[26] = measure q[26];
c[27] = measure q[27];
c[28] = measure q[28];
c[29] = measure q[29];
c[30] = measure q[30];
c[31] = measure q[31];
c[32] = measure q[32];
c[33] = measure q[33];
c[34] = measure q[34];
c[35] = measure q[35];
c[36] = measure q[36];
c[37] = measure q[37];
c[38] = measure q[38];
c[39] = measure q[39];
c[40] = measure q[40];
c[41] = measure q[41];
c[42] = measure q[42];
c[43] = measure q[43];
c[44] = measure q[44];
c[45] = measure q[45];
c[46] = measure q[46];
c[47] = measure q[47];