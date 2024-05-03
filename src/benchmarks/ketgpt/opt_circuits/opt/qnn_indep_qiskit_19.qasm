OPENQASM 3.0;
include "stdgates.inc";
bit[19] meas;
qubit[19] q;
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
h q[0];
rz(0.42920367320510344) q[0];
cx q[1], q[18];
rz(9.17283818781952) q[18];
cx q[1], q[18];
h q[1];
rz(2.0) q[1];
cx q[0], q[1];
rz(9.17283818781952) q[1];
cx q[0], q[1];
cx q[2], q[18];
rz(9.17283818781952) q[18];
cx q[2], q[18];
h q[2];
rz(2.0) q[2];
cx q[0], q[2];
rz(9.17283818781952) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(9.17283818781952) q[2];
cx q[1], q[2];
cx q[3], q[18];
rz(9.17283818781952) q[18];
cx q[3], q[18];
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
cx q[4], q[18];
rz(9.17283818781952) q[18];
cx q[4], q[18];
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
cx q[5], q[18];
rz(9.17283818781952) q[18];
cx q[5], q[18];
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
cx q[6], q[18];
rz(9.17283818781952) q[18];
cx q[6], q[18];
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
cx q[7], q[18];
rz(9.17283818781952) q[18];
cx q[7], q[18];
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
cx q[8], q[18];
rz(9.17283818781952) q[18];
cx q[8], q[18];
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
cx q[9], q[18];
rz(9.17283818781952) q[18];
cx q[9], q[18];
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
cx q[10], q[18];
rz(9.17283818781952) q[18];
cx q[10], q[18];
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
cx q[11], q[18];
rz(9.17283818781952) q[18];
cx q[11], q[18];
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
cx q[12], q[18];
rz(9.17283818781952) q[18];
cx q[12], q[18];
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
cx q[13], q[18];
rz(9.17283818781952) q[18];
cx q[13], q[18];
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
cx q[14], q[18];
rz(9.17283818781952) q[18];
cx q[14], q[18];
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
cx q[15], q[18];
rz(9.17283818781952) q[18];
cx q[15], q[18];
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
cx q[16], q[18];
rz(9.17283818781952) q[18];
cx q[16], q[18];
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
cx q[17], q[18];
rz(9.17283818781952) q[18];
cx q[17], q[18];
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
h q[0];
rz(0.2604315583757759) q[0];
h q[0];
cx q[1], q[18];
rz(9.17283818781952) q[18];
cx q[1], q[18];
rz(-pi/2) q[1];
h q[1];
rz(0.9595290817280571) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[18];
rz(9.17283818781952) q[18];
cx q[2], q[18];
rz(-pi/2) q[2];
h q[2];
rz(0.7371193042639139) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[3], q[18];
rz(9.17283818781952) q[18];
cx q[3], q[18];
rz(-pi/2) q[3];
h q[3];
rz(0.310707398733598) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[4], q[18];
rz(9.17283818781952) q[18];
cx q[4], q[18];
rz(-pi/2) q[4];
h q[4];
rz(0.523724949782356) q[4];
h q[4];
rz(5*pi/2) q[4];
cx q[5], q[18];
rz(9.17283818781952) q[18];
cx q[5], q[18];
rz(-pi/2) q[5];
h q[5];
rz(0.975762306933798) q[5];
h q[5];
rz(5*pi/2) q[5];
cx q[6], q[18];
rz(9.17283818781952) q[18];
cx q[6], q[18];
rz(-pi/2) q[6];
h q[6];
rz(0.01034279591157361) q[6];
h q[6];
rz(5*pi/2) q[6];
cx q[7], q[18];
rz(9.17283818781952) q[18];
cx q[7], q[18];
rz(-pi/2) q[7];
h q[7];
rz(0.31916438411060977) q[7];
h q[7];
rz(5*pi/2) q[7];
cx q[8], q[18];
rz(9.17283818781952) q[18];
cx q[8], q[18];
rz(-pi/2) q[8];
h q[8];
rz(0.2954006296574261) q[8];
h q[8];
rz(5*pi/2) q[8];
cx q[9], q[18];
rz(9.17283818781952) q[18];
cx q[9], q[18];
rz(-pi/2) q[9];
h q[9];
rz(0.583828165325087) q[9];
h q[9];
rz(5*pi/2) q[9];
cx q[10], q[18];
rz(9.17283818781952) q[18];
cx q[10], q[18];
rz(-pi/2) q[10];
h q[10];
rz(0.0918969736470987) q[10];
h q[10];
rz(5*pi/2) q[10];
cx q[11], q[18];
rz(9.17283818781952) q[18];
cx q[11], q[18];
rz(-pi/2) q[11];
h q[11];
rz(0.37757771493843784) q[11];
h q[11];
rz(5*pi/2) q[11];
cx q[12], q[18];
rz(9.17283818781952) q[18];
cx q[12], q[18];
rz(-pi/2) q[12];
h q[12];
rz(0.41895287706727213) q[12];
h q[12];
rz(5*pi/2) q[12];
cx q[13], q[18];
rz(9.17283818781952) q[18];
cx q[13], q[18];
rz(-pi/2) q[13];
h q[13];
rz(0.255036841029908) q[13];
h q[13];
rz(5*pi/2) q[13];
cx q[14], q[18];
rz(9.17283818781952) q[18];
cx q[14], q[18];
rz(-pi/2) q[14];
h q[14];
rz(0.8347229207624798) q[14];
h q[14];
rz(5*pi/2) q[14];
cx q[15], q[18];
rz(9.17283818781952) q[18];
cx q[15], q[18];
rz(-pi/2) q[15];
h q[15];
rz(0.9635688327947136) q[15];
h q[15];
rz(5*pi/2) q[15];
cx q[16], q[18];
rz(9.17283818781952) q[18];
cx q[16], q[18];
rz(-pi/2) q[16];
h q[16];
rz(0.04389646873728559) q[16];
h q[16];
rz(5*pi/2) q[16];
cx q[17], q[18];
rz(9.17283818781952) q[18];
cx q[17], q[18];
rz(-pi/2) q[17];
h q[17];
rz(0.22039039376439895) q[17];
h q[17];
rz(5*pi/2) q[17];
rz(0) q[18];
rz(-pi/2) q[18];
h q[18];
rz(0.38998423338880617) q[18];
h q[18];
rz(5*pi/2) q[18];
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
rz(0.3649276039719922) q[0];
h q[0];
rz(5*pi/2) q[0];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.11009095700129512) q[1];
h q[1];
rz(5*pi/2) q[1];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.06649262058259842) q[2];
h q[2];
rz(5*pi/2) q[2];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(0.7342587993859508) q[3];
h q[3];
rz(5*pi/2) q[3];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(0.8920836732797177) q[4];
h q[4];
rz(5*pi/2) q[4];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(0.7266129687066178) q[5];
h q[5];
rz(5*pi/2) q[5];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(0.66049070500934) q[6];
h q[6];
rz(5*pi/2) q[6];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(0.7500389027735359) q[7];
h q[7];
rz(5*pi/2) q[7];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(0.0019169339606106561) q[8];
h q[8];
rz(5*pi/2) q[8];
rz(0) q[9];
rz(-pi/2) q[9];
h q[9];
rz(0.5056112252323581) q[9];
h q[9];
rz(5*pi/2) q[9];
rz(0) q[10];
rz(-pi/2) q[10];
h q[10];
rz(0.5859599819025698) q[10];
h q[10];
rz(5*pi/2) q[10];
rz(0) q[11];
rz(-pi/2) q[11];
h q[11];
rz(0.3393362070009869) q[11];
h q[11];
rz(5*pi/2) q[11];
rz(0) q[12];
rz(-pi/2) q[12];
h q[12];
rz(0.34813831820408403) q[12];
h q[12];
rz(5*pi/2) q[12];
rz(0) q[13];
rz(-pi/2) q[13];
h q[13];
rz(0.10957594033304119) q[13];
h q[13];
rz(5*pi/2) q[13];
rz(0) q[14];
rz(-pi/2) q[14];
h q[14];
rz(0.926726852513224) q[14];
h q[14];
rz(5*pi/2) q[14];
rz(0) q[15];
rz(-pi/2) q[15];
h q[15];
rz(0.2338118772769091) q[15];
h q[15];
rz(5*pi/2) q[15];
rz(0) q[16];
rz(-pi/2) q[16];
h q[16];
rz(0.3274818840147642) q[16];
h q[16];
rz(5*pi/2) q[16];
rz(0) q[17];
rz(-pi/2) q[17];
h q[17];
rz(0.18997891998994199) q[17];
h q[17];
rz(5*pi/2) q[17];
rz(0) q[18];
rz(-pi/2) q[18];
h q[18];
rz(0.7999533369281129) q[18];
h q[18];
rz(5*pi/2) q[18];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], q[11], q[12], q[13], q[14], q[15], q[16], q[17], q[18];
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
