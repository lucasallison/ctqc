OPENQASM 3.0;
include "stdgates.inc";
bit[17] meas;
qubit[17] q;
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
h q[4];
cx q[2], q[4];
h q[4];
h q[5];
h q[5];
cx q[0], q[5];
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
h q[8];
cx q[3], q[8];
h q[8];
h q[9];
h q[10];
h q[10];
cx q[9], q[10];
h q[10];
h q[11];
h q[11];
cx q[9], q[11];
h q[11];
h q[12];
h q[12];
cx q[10], q[12];
h q[12];
h q[12];
cx q[11], q[12];
h q[12];
h q[13];
h q[14];
h q[14];
cx q[6], q[14];
h q[14];
h q[14];
cx q[13], q[14];
h q[14];
h q[15];
h q[15];
cx q[1], q[15];
h q[15];
h q[15];
cx q[13], q[15];
h q[15];
h q[16];
h q[16];
cx q[7], q[16];
h q[16];
h q[16];
cx q[8], q[16];
h q[16];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], q[11], q[12], q[13], q[14], q[15], q[16];
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
