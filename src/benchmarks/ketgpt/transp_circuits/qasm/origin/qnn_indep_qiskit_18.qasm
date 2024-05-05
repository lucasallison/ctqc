OPENQASM 3.0;
include "stdgates.inc";
bit[18] meas;
qubit[18] q;
rz(-3*pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.5707963267948966) q[0];
rz(-3*pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.5707963267948966) q[1];
cx q[0], q[1];
rz(9.17283818781952) q[1];
cx q[0], q[1];
rz(-3*pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3.5707963267948966) q[2];
cx q[0], q[2];
rz(9.17283818781952) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(9.17283818781952) q[2];
cx q[1], q[2];
rz(-3*pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3.5707963267948966) q[3];
cx q[0], q[3];
rz(9.17283818781952) q[3];
cx q[0], q[3];
cx q[1], q[3];
rz(9.17283818781952) q[3];
cx q[1], q[3];
cx q[2], q[3];
rz(9.17283818781952) q[3];
cx q[2], q[3];
rz(-3*pi/2) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3.5707963267948966) q[4];
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
rz(-3*pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3.5707963267948966) q[5];
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
rz(-3*pi/2) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.5707963267948966) q[6];
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
rz(-3*pi/2) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3.5707963267948966) q[7];
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
rz(-3*pi/2) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3.5707963267948966) q[8];
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
rz(-3*pi/2) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3.5707963267948966) q[9];
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
rz(-3*pi/2) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(3.5707963267948966) q[10];
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
rz(-3*pi/2) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(3.5707963267948966) q[11];
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
rz(-3*pi/2) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(3.5707963267948966) q[12];
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
rz(-3*pi/2) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(3.5707963267948966) q[13];
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
rz(-3*pi/2) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(3.5707963267948966) q[14];
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
rz(-3*pi/2) q[15];
rz(-pi/2) q[15];
h q[15];
rz(-pi/2) q[15];
rz(3.5707963267948966) q[15];
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
rz(-3*pi/2) q[16];
rz(-pi/2) q[16];
h q[16];
rz(-pi/2) q[16];
rz(3.5707963267948966) q[16];
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
rz(-3*pi/2) q[17];
rz(-pi/2) q[17];
h q[17];
rz(-pi/2) q[17];
rz(3.5707963267948966) q[17];
cx q[0], q[17];
rz(9.17283818781952) q[17];
cx q[0], q[17];
rz(-3*pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.5707963267948966) q[0];
cx q[1], q[17];
rz(9.17283818781952) q[17];
cx q[1], q[17];
rz(-3*pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.5707963267948966) q[1];
cx q[0], q[1];
rz(9.17283818781952) q[1];
cx q[0], q[1];
cx q[2], q[17];
rz(9.17283818781952) q[17];
cx q[2], q[17];
rz(-3*pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3.5707963267948966) q[2];
cx q[0], q[2];
rz(9.17283818781952) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(9.17283818781952) q[2];
cx q[1], q[2];
cx q[3], q[17];
rz(9.17283818781952) q[17];
cx q[3], q[17];
rz(-3*pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3.5707963267948966) q[3];
cx q[0], q[3];
rz(9.17283818781952) q[3];
cx q[0], q[3];
cx q[1], q[3];
rz(9.17283818781952) q[3];
cx q[1], q[3];
cx q[2], q[3];
rz(9.17283818781952) q[3];
cx q[2], q[3];
cx q[4], q[17];
rz(9.17283818781952) q[17];
cx q[4], q[17];
rz(-3*pi/2) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3.5707963267948966) q[4];
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
cx q[5], q[17];
rz(9.17283818781952) q[17];
cx q[5], q[17];
rz(-3*pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3.5707963267948966) q[5];
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
cx q[6], q[17];
rz(9.17283818781952) q[17];
cx q[6], q[17];
rz(-3*pi/2) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.5707963267948966) q[6];
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
cx q[7], q[17];
rz(9.17283818781952) q[17];
cx q[7], q[17];
rz(-3*pi/2) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3.5707963267948966) q[7];
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
cx q[8], q[17];
rz(9.17283818781952) q[17];
cx q[8], q[17];
rz(-3*pi/2) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3.5707963267948966) q[8];
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
cx q[9], q[17];
rz(9.17283818781952) q[17];
cx q[9], q[17];
rz(-3*pi/2) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3.5707963267948966) q[9];
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
cx q[10], q[17];
rz(9.17283818781952) q[17];
cx q[10], q[17];
rz(-3*pi/2) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(3.5707963267948966) q[10];
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
cx q[11], q[17];
rz(9.17283818781952) q[17];
cx q[11], q[17];
rz(-3*pi/2) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(3.5707963267948966) q[11];
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
cx q[12], q[17];
rz(9.17283818781952) q[17];
cx q[12], q[17];
rz(-3*pi/2) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(3.5707963267948966) q[12];
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
cx q[13], q[17];
rz(9.17283818781952) q[17];
cx q[13], q[17];
rz(-3*pi/2) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(3.5707963267948966) q[13];
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
cx q[14], q[17];
rz(9.17283818781952) q[17];
cx q[14], q[17];
rz(-3*pi/2) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(3.5707963267948966) q[14];
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
cx q[15], q[17];
rz(9.17283818781952) q[17];
cx q[15], q[17];
rz(-3*pi/2) q[15];
rz(-pi/2) q[15];
h q[15];
rz(-pi/2) q[15];
rz(3.5707963267948966) q[15];
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
cx q[16], q[17];
rz(9.17283818781952) q[17];
cx q[16], q[17];
rz(-3*pi/2) q[16];
rz(-pi/2) q[16];
h q[16];
rz(-pi/2) q[16];
rz(3.5707963267948966) q[16];
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
rz(-3*pi/2) q[17];
rz(-pi/2) q[17];
h q[17];
rz(-pi/2) q[17];
rz(3.5707963267948966) q[17];
cx q[0], q[17];
rz(9.17283818781952) q[17];
cx q[0], q[17];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.283603710604695) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[1], q[17];
rz(9.17283818781952) q[17];
cx q[1], q[17];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.890621632074136) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
cx q[2], q[17];
rz(9.17283818781952) q[17];
cx q[2], q[17];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3.1944166036041772) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
cx q[3], q[17];
rz(9.17283818781952) q[17];
cx q[3], q[17];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3.6562998565441243) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi) q[3];
cx q[4], q[17];
rz(9.17283818781952) q[17];
cx q[4], q[17];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3.531600554709308) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi) q[4];
cx q[5], q[17];
rz(9.17283818781952) q[17];
cx q[5], q[17];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3.2466669248067763) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi) q[5];
cx q[6], q[17];
rz(9.17283818781952) q[17];
cx q[6], q[17];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.3131735547722183) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
cx q[7], q[17];
rz(9.17283818781952) q[17];
cx q[7], q[17];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3.399645463812985) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi) q[7];
cx q[8], q[17];
rz(9.17283818781952) q[17];
cx q[8], q[17];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(4.055764745754438) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3*pi) q[8];
cx q[9], q[17];
rz(9.17283818781952) q[17];
cx q[9], q[17];
rz(0) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3.401071661209681) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3*pi) q[9];
cx q[10], q[17];
rz(9.17283818781952) q[17];
cx q[10], q[17];
rz(0) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(3.2003400765925143) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(3*pi) q[10];
cx q[11], q[17];
rz(9.17283818781952) q[17];
cx q[11], q[17];
rz(0) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(3.865785594857308) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(3*pi) q[11];
cx q[12], q[17];
rz(9.17283818781952) q[17];
cx q[12], q[17];
rz(0) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(3.814744838686412) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(3*pi) q[12];
cx q[13], q[17];
rz(9.17283818781952) q[17];
cx q[13], q[17];
rz(0) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(3.46935289284926) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(3*pi) q[13];
cx q[14], q[17];
rz(9.17283818781952) q[17];
cx q[14], q[17];
rz(0) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(4.064397967384056) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(3*pi) q[14];
cx q[15], q[17];
rz(9.17283818781952) q[17];
cx q[15], q[17];
rz(0) q[15];
rz(-pi/2) q[15];
h q[15];
rz(-pi/2) q[15];
rz(3.14674856851076) q[15];
rz(-pi/2) q[15];
h q[15];
rz(-pi/2) q[15];
rz(3*pi) q[15];
cx q[16], q[17];
rz(9.17283818781952) q[17];
cx q[16], q[17];
rz(0) q[16];
rz(-pi/2) q[16];
h q[16];
rz(-pi/2) q[16];
rz(4.1300290581999) q[16];
rz(-pi/2) q[16];
h q[16];
rz(-pi/2) q[16];
rz(3*pi) q[16];
rz(0) q[17];
rz(-pi/2) q[17];
h q[17];
rz(-pi/2) q[17];
rz(3.69581688699933) q[17];
rz(-pi/2) q[17];
h q[17];
rz(-pi/2) q[17];
rz(3*pi) q[17];
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
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.302429242533265) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.2046720339829062) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(4.135757379851805) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3.722908029190146) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi) q[3];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3.5868511511982173) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi) q[4];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3.8494652890518593) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi) q[5];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(4.012555229770137) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3.210068263936288) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi) q[7];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3.377935298900862) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3*pi) q[8];
rz(0) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3.54024473573077) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3*pi) q[9];
rz(0) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(3.740585264221213) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(3*pi) q[10];
rz(0) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(4.0260578564443135) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(3*pi) q[11];
rz(0) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(3.1753936392051565) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(3*pi) q[12];
rz(0) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(3.956857926619664) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(3*pi) q[13];
rz(0) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(3.4285765123948653) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(3*pi) q[14];
rz(0) q[15];
rz(-pi/2) q[15];
h q[15];
rz(-pi/2) q[15];
rz(4.114389406682879) q[15];
rz(-pi/2) q[15];
h q[15];
rz(-pi/2) q[15];
rz(3*pi) q[15];
rz(0) q[16];
rz(-pi/2) q[16];
h q[16];
rz(-pi/2) q[16];
rz(3.853484949278744) q[16];
rz(-pi/2) q[16];
h q[16];
rz(-pi/2) q[16];
rz(3*pi) q[16];
rz(0) q[17];
rz(-pi/2) q[17];
h q[17];
rz(-pi/2) q[17];
rz(4.115940774666327) q[17];
rz(-pi/2) q[17];
h q[17];
rz(-pi/2) q[17];
rz(3*pi) q[17];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], q[11], q[12], q[13], q[14], q[15], q[16], q[17];
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