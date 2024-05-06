OPENQASM 3.0;
include "stdgates.inc";
bit[24] c;
qubit[25] q;
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
rz(-3*pi/2) q[24];
rz(-pi/2) q[24];
h q[24];
rz(-pi/2) q[24];
rz(-pi/2) q[24];
cx q[0], q[24];
rz(-3*pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(-pi/2) q[0];
cx q[1], q[24];
rz(-3*pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(-pi/2) q[1];
cx q[2], q[24];
h q[2];
cx q[3], q[24];
rz(-3*pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(-pi/2) q[3];
cx q[4], q[24];
h q[4];
cx q[5], q[24];
rz(-3*pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(-pi/2) q[5];
cx q[6], q[24];
rz(-3*pi/2) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(-pi/2) q[6];
cx q[7], q[24];
h q[7];
cx q[8], q[24];
rz(-3*pi/2) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(-pi/2) q[8];
cx q[9], q[24];
rz(-3*pi/2) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(-pi/2) q[9];
cx q[10], q[24];
h q[10];
cx q[11], q[24];
rz(-3*pi/2) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(-pi/2) q[11];
cx q[12], q[24];
rz(-3*pi/2) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(-pi/2) q[12];
cx q[13], q[24];
h q[13];
cx q[14], q[24];
h q[14];
cx q[15], q[24];
rz(-3*pi/2) q[15];
rz(-pi/2) q[15];
h q[15];
rz(-pi/2) q[15];
rz(-pi/2) q[15];
cx q[16], q[24];
h q[16];
cx q[17], q[24];
h q[17];
cx q[18], q[24];
h q[18];
cx q[19], q[24];
h q[19];
cx q[20], q[24];
h q[20];
cx q[21], q[24];
rz(-3*pi/2) q[21];
rz(-pi/2) q[21];
h q[21];
rz(-pi/2) q[21];
rz(-pi/2) q[21];
cx q[22], q[24];
h q[22];
cx q[23], q[24];
h q[23];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], q[11], q[12], q[13], q[14], q[15], q[16], q[17], q[18], q[19], q[20], q[21], q[22], q[23], q[24];
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