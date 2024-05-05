OPENQASM 3.0;
include "stdgates.inc";
bit[36] meas;
qubit[36] q;
h q[0];
cx q[0], q[1];
h q[1];
h q[2];
cx q[2], q[3];
h q[3];
h q[4];
cx q[4], q[5];
h q[5];
h q[6];
cx q[4], q[7];
cx q[6], q[7];
h q[7];
h q[8];
cx q[8], q[9];
h q[9];
h q[10];
cx q[5], q[11];
cx q[10], q[11];
h q[11];
h q[12];
cx q[12], q[13];
h q[13];
h q[14];
cx q[10], q[15];
cx q[14], q[15];
h q[15];
h q[16];
cx q[16], q[17];
h q[17];
h q[18];
cx q[18], q[19];
h q[19];
cx q[18], q[20];
h q[20];
cx q[6], q[21];
cx q[12], q[21];
h q[21];
cx q[13], q[22];
h q[22];
cx q[22], q[23];
h q[23];
cx q[3], q[24];
cx q[19], q[24];
h q[24];
cx q[2], q[25];
cx q[8], q[25];
h q[25];
cx q[9], q[26];
cx q[20], q[26];
h q[26];
h q[27];
cx q[17], q[28];
cx q[27], q[28];
h q[28];
cx q[1], q[29];
cx q[27], q[29];
h q[29];
h q[30];
cx q[30], q[31];
h q[31];
cx q[0], q[32];
cx q[31], q[32];
h q[32];
cx q[23], q[33];
cx q[30], q[33];
h q[33];
cx q[16], q[34];
h q[34];
cx q[14], q[35];
cx q[34], q[35];
h q[35];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], q[11], q[12], q[13], q[14], q[15], q[16], q[17], q[18], q[19], q[20], q[21], q[22], q[23], q[24], q[25], q[26], q[27], q[28], q[29], q[30], q[31], q[32], q[33], q[34], q[35];
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