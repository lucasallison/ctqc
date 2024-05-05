OPENQASM 3.0;
include "stdgates.inc";
bit[76] meas;
qubit[76] q;
h q[0];
h q[1];
h q[1];
cx q[0], q[1];
h q[1];
h q[2];
h q[3];
h q[3];
cx q[2], q[3];
h q[3];
h q[4];
h q[5];
h q[5];
cx q[4], q[5];
h q[5];
h q[6];
h q[7];
h q[7];
cx q[6], q[7];
h q[7];
h q[8];
h q[9];
h q[9];
cx q[8], q[9];
h q[9];
h q[10];
h q[11];
h q[11];
cx q[10], q[11];
h q[11];
h q[12];
h q[12];
cx q[6], q[12];
h q[12];
h q[13];
h q[13];
cx q[11], q[13];
h q[13];
h q[14];
h q[15];
h q[15];
cx q[14], q[15];
h q[15];
h q[16];
h q[17];
h q[17];
cx q[16], q[17];
h q[17];
h q[18];
h q[19];
h q[19];
cx q[18], q[19];
h q[19];
h q[20];
h q[21];
h q[21];
cx q[20], q[21];
h q[21];
h q[22];
h q[23];
h q[23];
cx q[22], q[23];
h q[23];
h q[24];
h q[25];
h q[25];
cx q[24], q[25];
h q[25];
h q[26];
h q[26];
cx q[23], q[26];
h q[26];
h q[27];
h q[27];
cx q[14], q[27];
h q[27];
h q[28];
h q[28];
cx q[0], q[28];
h q[28];
h q[28];
cx q[27], q[28];
h q[28];
h q[29];
h q[30];
h q[30];
cx q[29], q[30];
h q[30];
h q[31];
h q[31];
cx q[21], q[31];
h q[31];
h q[32];
h q[32];
cx q[20], q[32];
h q[32];
h q[33];
h q[33];
cx q[17], q[33];
h q[33];
h q[34];
h q[35];
h q[35];
cx q[25], q[35];
h q[35];
h q[35];
cx q[34], q[35];
h q[35];
h q[36];
h q[36];
cx q[26], q[36];
h q[36];
h q[37];
h q[38];
h q[38];
cx q[37], q[38];
h q[38];
h q[39];
h q[39];
cx q[2], q[39];
h q[39];
h q[39];
cx q[3], q[39];
h q[39];
h q[40];
h q[40];
cx q[29], q[40];
h q[40];
h q[41];
h q[41];
cx q[40], q[41];
h q[41];
h q[42];
h q[42];
cx q[33], q[42];
h q[42];
h q[43];
h q[43];
cx q[42], q[43];
h q[43];
h q[44];
h q[44];
cx q[34], q[44];
h q[44];
h q[45];
h q[45];
cx q[30], q[45];
h q[45];
h q[46];
h q[46];
cx q[45], q[46];
h q[46];
h q[47];
h q[47];
cx q[37], q[47];
h q[47];
h q[48];
h q[48];
cx q[47], q[48];
h q[48];
h q[49];
h q[49];
cx q[18], q[49];
h q[49];
h q[50];
h q[50];
cx q[49], q[50];
h q[50];
h q[51];
h q[51];
cx q[43], q[51];
h q[51];
h q[52];
h q[52];
cx q[1], q[52];
h q[52];
h q[52];
cx q[7], q[52];
h q[52];
h q[53];
h q[54];
h q[54];
cx q[53], q[54];
h q[54];
h q[55];
h q[55];
cx q[5], q[55];
h q[55];
h q[56];
h q[57];
h q[57];
cx q[15], q[57];
h q[57];
h q[57];
cx q[56], q[57];
h q[57];
h q[58];
h q[58];
cx q[51], q[58];
h q[58];
h q[59];
h q[59];
cx q[58], q[59];
h q[59];
h q[60];
h q[60];
cx q[24], q[60];
h q[60];
h q[61];
h q[61];
cx q[56], q[61];
h q[61];
h q[62];
h q[62];
cx q[61], q[62];
h q[62];
h q[63];
h q[63];
cx q[10], q[63];
h q[63];
h q[63];
cx q[41], q[63];
h q[63];
h q[64];
h q[64];
cx q[38], q[64];
h q[64];
h q[64];
cx q[62], q[64];
h q[64];
h q[65];
h q[65];
cx q[8], q[65];
h q[65];
h q[66];
h q[66];
cx q[13], q[66];
h q[66];
h q[66];
cx q[65], q[66];
h q[66];
h q[67];
h q[67];
cx q[55], q[67];
h q[67];
h q[67];
cx q[60], q[67];
h q[67];
h q[68];
h q[68];
cx q[4], q[68];
h q[68];
h q[68];
cx q[12], q[68];
h q[68];
h q[69];
h q[69];
cx q[9], q[69];
h q[69];
h q[69];
cx q[44], q[69];
h q[69];
h q[70];
h q[70];
cx q[32], q[70];
h q[70];
h q[70];
cx q[50], q[70];
h q[70];
h q[71];
h q[71];
cx q[19], q[71];
h q[71];
h q[71];
cx q[36], q[71];
h q[71];
h q[72];
h q[72];
cx q[16], q[72];
h q[72];
h q[72];
cx q[31], q[72];
h q[72];
h q[73];
h q[73];
cx q[22], q[73];
h q[73];
h q[73];
cx q[59], q[73];
h q[73];
h q[74];
h q[74];
cx q[46], q[74];
h q[74];
h q[74];
cx q[53], q[74];
h q[74];
h q[75];
h q[75];
cx q[48], q[75];
h q[75];
h q[75];
cx q[54], q[75];
h q[75];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], q[11], q[12], q[13], q[14], q[15], q[16], q[17], q[18], q[19], q[20], q[21], q[22], q[23], q[24], q[25], q[26], q[27], q[28], q[29], q[30], q[31], q[32], q[33], q[34], q[35], q[36], q[37], q[38], q[39], q[40], q[41], q[42], q[43], q[44], q[45], q[46], q[47], q[48], q[49], q[50], q[51], q[52], q[53], q[54], q[55], q[56], q[57], q[58], q[59], q[60], q[61], q[62], q[63], q[64], q[65], q[66], q[67], q[68], q[69], q[70], q[71], q[72], q[73], q[74], q[75];
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
meas[25] = measure q[25];
meas[26] = measure q[26];
meas[27] = measure q[27];
meas[28] = measure q[28];
meas[29] = measure q[29];
meas[30] = measure q[30];
meas[31] = measure q[31];
meas[32] = measure q[32];
meas[33] = measure q[33];
meas[34] = measure q[34];
meas[35] = measure q[35];
meas[36] = measure q[36];
meas[37] = measure q[37];
meas[38] = measure q[38];
meas[39] = measure q[39];
meas[40] = measure q[40];
meas[41] = measure q[41];
meas[42] = measure q[42];
meas[43] = measure q[43];
meas[44] = measure q[44];
meas[45] = measure q[45];
meas[46] = measure q[46];
meas[47] = measure q[47];
meas[48] = measure q[48];
meas[49] = measure q[49];
meas[50] = measure q[50];
meas[51] = measure q[51];
meas[52] = measure q[52];
meas[53] = measure q[53];
meas[54] = measure q[54];
meas[55] = measure q[55];
meas[56] = measure q[56];
meas[57] = measure q[57];
meas[58] = measure q[58];
meas[59] = measure q[59];
meas[60] = measure q[60];
meas[61] = measure q[61];
meas[62] = measure q[62];
meas[63] = measure q[63];
meas[64] = measure q[64];
meas[65] = measure q[65];
meas[66] = measure q[66];
meas[67] = measure q[67];
meas[68] = measure q[68];
meas[69] = measure q[69];
meas[70] = measure q[70];
meas[71] = measure q[71];
meas[72] = measure q[72];
meas[73] = measure q[73];
meas[74] = measure q[74];
meas[75] = measure q[75];