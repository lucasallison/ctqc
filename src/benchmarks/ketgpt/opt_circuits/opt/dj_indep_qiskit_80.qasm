OPENQASM 3.0;
include "stdgates.inc";
bit[79] c;
qubit[80] q;
rz(-pi) q[0];
h q[0];
rz(-pi) q[1];
h q[1];
h q[2];
rz(-pi) q[3];
h q[3];
h q[4];
rz(-pi) q[5];
h q[5];
rz(-pi) q[6];
h q[6];
h q[7];
rz(-pi) q[8];
h q[8];
rz(-pi) q[9];
h q[9];
h q[10];
rz(-pi) q[11];
h q[11];
rz(-pi) q[12];
h q[12];
h q[13];
h q[14];
rz(-pi) q[15];
h q[15];
h q[16];
h q[17];
h q[18];
h q[19];
h q[20];
rz(-pi) q[21];
h q[21];
h q[22];
h q[23];
rz(-pi) q[24];
h q[24];
rz(-pi) q[25];
h q[25];
h q[26];
h q[27];
rz(-pi) q[28];
h q[28];
h q[29];
h q[30];
rz(-pi) q[31];
h q[31];
h q[32];
h q[33];
h q[34];
rz(-pi) q[35];
h q[35];
rz(-pi) q[36];
h q[36];
h q[37];
rz(-pi) q[38];
h q[38];
rz(-pi) q[39];
h q[39];
rz(-pi) q[40];
h q[40];
rz(-pi) q[41];
h q[41];
rz(-pi) q[42];
h q[42];
h q[43];
rz(-pi) q[44];
h q[44];
h q[45];
h q[46];
h q[47];
h q[48];
rz(-pi) q[49];
h q[49];
h q[50];
rz(-pi) q[51];
h q[51];
rz(-pi) q[52];
h q[52];
rz(-pi) q[53];
h q[53];
h q[54];
rz(-pi) q[55];
h q[55];
h q[56];
rz(-pi) q[57];
h q[57];
rz(-pi) q[58];
h q[58];
h q[59];
rz(-pi) q[60];
h q[60];
h q[61];
h q[62];
rz(-pi) q[63];
h q[63];
h q[64];
h q[65];
h q[66];
rz(-pi) q[67];
h q[67];
rz(-pi) q[68];
h q[68];
h q[69];
h q[70];
h q[71];
rz(-pi) q[72];
h q[72];
h q[73];
rz(-pi) q[74];
h q[74];
rz(-pi) q[75];
h q[75];
h q[76];
rz(-pi) q[77];
h q[77];
rz(-pi) q[78];
h q[78];
h q[79];
rz(-pi) q[79];
cx q[0], q[79];
h q[0];
rz(-pi) q[0];
cx q[1], q[79];
h q[1];
rz(-pi) q[1];
cx q[2], q[79];
h q[2];
cx q[3], q[79];
h q[3];
rz(-pi) q[3];
cx q[4], q[79];
h q[4];
cx q[5], q[79];
h q[5];
rz(-pi) q[5];
cx q[6], q[79];
h q[6];
rz(-pi) q[6];
cx q[7], q[79];
h q[7];
cx q[8], q[79];
h q[8];
rz(-pi) q[8];
cx q[9], q[79];
h q[9];
rz(-pi) q[9];
cx q[10], q[79];
h q[10];
cx q[11], q[79];
h q[11];
rz(-pi) q[11];
cx q[12], q[79];
h q[12];
rz(-pi) q[12];
cx q[13], q[79];
h q[13];
cx q[14], q[79];
h q[14];
cx q[15], q[79];
h q[15];
rz(-pi) q[15];
cx q[16], q[79];
h q[16];
cx q[17], q[79];
h q[17];
cx q[18], q[79];
h q[18];
cx q[19], q[79];
h q[19];
cx q[20], q[79];
h q[20];
cx q[21], q[79];
h q[21];
rz(-pi) q[21];
cx q[22], q[79];
h q[22];
cx q[23], q[79];
h q[23];
cx q[24], q[79];
h q[24];
rz(-pi) q[24];
cx q[25], q[79];
h q[25];
rz(-pi) q[25];
cx q[26], q[79];
h q[26];
cx q[27], q[79];
h q[27];
cx q[28], q[79];
h q[28];
rz(-pi) q[28];
cx q[29], q[79];
h q[29];
cx q[30], q[79];
h q[30];
cx q[31], q[79];
h q[31];
rz(-pi) q[31];
cx q[32], q[79];
h q[32];
cx q[33], q[79];
h q[33];
cx q[34], q[79];
h q[34];
cx q[35], q[79];
h q[35];
rz(-pi) q[35];
cx q[36], q[79];
h q[36];
rz(-pi) q[36];
cx q[37], q[79];
h q[37];
cx q[38], q[79];
h q[38];
rz(-pi) q[38];
cx q[39], q[79];
h q[39];
rz(-pi) q[39];
cx q[40], q[79];
h q[40];
rz(-pi) q[40];
cx q[41], q[79];
h q[41];
rz(-pi) q[41];
cx q[42], q[79];
h q[42];
rz(-pi) q[42];
cx q[43], q[79];
h q[43];
cx q[44], q[79];
h q[44];
rz(-pi) q[44];
cx q[45], q[79];
h q[45];
cx q[46], q[79];
h q[46];
cx q[47], q[79];
h q[47];
cx q[48], q[79];
h q[48];
cx q[49], q[79];
h q[49];
rz(-pi) q[49];
cx q[50], q[79];
h q[50];
cx q[51], q[79];
h q[51];
rz(-pi) q[51];
cx q[52], q[79];
h q[52];
rz(-pi) q[52];
cx q[53], q[79];
h q[53];
rz(-pi) q[53];
cx q[54], q[79];
h q[54];
cx q[55], q[79];
h q[55];
rz(-pi) q[55];
cx q[56], q[79];
h q[56];
cx q[57], q[79];
h q[57];
rz(-pi) q[57];
cx q[58], q[79];
h q[58];
rz(-pi) q[58];
cx q[59], q[79];
h q[59];
cx q[60], q[79];
h q[60];
rz(-pi) q[60];
cx q[61], q[79];
h q[61];
cx q[62], q[79];
h q[62];
cx q[63], q[79];
h q[63];
rz(-pi) q[63];
cx q[64], q[79];
h q[64];
cx q[65], q[79];
h q[65];
cx q[66], q[79];
h q[66];
cx q[67], q[79];
h q[67];
rz(-pi) q[67];
cx q[68], q[79];
h q[68];
rz(-pi) q[68];
cx q[69], q[79];
h q[69];
cx q[70], q[79];
h q[70];
cx q[71], q[79];
h q[71];
cx q[72], q[79];
h q[72];
rz(-pi) q[72];
cx q[73], q[79];
h q[73];
cx q[74], q[79];
h q[74];
rz(-pi) q[74];
cx q[75], q[79];
h q[75];
rz(-pi) q[75];
cx q[76], q[79];
h q[76];
cx q[77], q[79];
h q[77];
rz(-pi) q[77];
cx q[78], q[79];
h q[78];
rz(-pi) q[78];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], q[11], q[12], q[13], q[14], q[15], q[16], q[17], q[18], q[19], q[20], q[21], q[22], q[23], q[24], q[25], q[26], q[27], q[28], q[29], q[30], q[31], q[32], q[33], q[34], q[35], q[36], q[37], q[38], q[39], q[40], q[41], q[42], q[43], q[44], q[45], q[46], q[47], q[48], q[49], q[50], q[51], q[52], q[53], q[54], q[55], q[56], q[57], q[58], q[59], q[60], q[61], q[62], q[63], q[64], q[65], q[66], q[67], q[68], q[69], q[70], q[71], q[72], q[73], q[74], q[75], q[76], q[77], q[78], q[79];
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
c[48] = measure q[48];
c[49] = measure q[49];
c[50] = measure q[50];
c[51] = measure q[51];
c[52] = measure q[52];
c[53] = measure q[53];
c[54] = measure q[54];
c[55] = measure q[55];
c[56] = measure q[56];
c[57] = measure q[57];
c[58] = measure q[58];
c[59] = measure q[59];
c[60] = measure q[60];
c[61] = measure q[61];
c[62] = measure q[62];
c[63] = measure q[63];
c[64] = measure q[64];
c[65] = measure q[65];
c[66] = measure q[66];
c[67] = measure q[67];
c[68] = measure q[68];
c[69] = measure q[69];
c[70] = measure q[70];
c[71] = measure q[71];
c[72] = measure q[72];
c[73] = measure q[73];
c[74] = measure q[74];
c[75] = measure q[75];
c[76] = measure q[76];
c[77] = measure q[77];
c[78] = measure q[78];
