OPENQASM 3.0;
include "stdgates.inc";
bit[20] meas;
qubit[20] q;
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
rz(-3*pi/2) q[18];
rz(-pi/2) q[18];
h q[18];
rz(-pi/2) q[18];
rz(3.5707963267948966) q[18];
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
rz(-3*pi/2) q[19];
rz(-pi/2) q[19];
h q[19];
rz(-pi/2) q[19];
rz(3.5707963267948966) q[19];
cx q[0], q[19];
rz(9.17283818781952) q[19];
cx q[0], q[19];
rz(-3*pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.5707963267948966) q[0];
cx q[1], q[19];
rz(9.17283818781952) q[19];
cx q[1], q[19];
rz(-3*pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.5707963267948966) q[1];
cx q[0], q[1];
rz(9.17283818781952) q[1];
cx q[0], q[1];
cx q[2], q[19];
rz(9.17283818781952) q[19];
cx q[2], q[19];
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
cx q[3], q[19];
rz(9.17283818781952) q[19];
cx q[3], q[19];
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
cx q[4], q[19];
rz(9.17283818781952) q[19];
cx q[4], q[19];
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
cx q[5], q[19];
rz(9.17283818781952) q[19];
cx q[5], q[19];
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
cx q[6], q[19];
rz(9.17283818781952) q[19];
cx q[6], q[19];
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
cx q[7], q[19];
rz(9.17283818781952) q[19];
cx q[7], q[19];
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
cx q[8], q[19];
rz(9.17283818781952) q[19];
cx q[8], q[19];
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
cx q[9], q[19];
rz(9.17283818781952) q[19];
cx q[9], q[19];
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
cx q[10], q[19];
rz(9.17283818781952) q[19];
cx q[10], q[19];
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
cx q[11], q[19];
rz(9.17283818781952) q[19];
cx q[11], q[19];
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
cx q[12], q[19];
rz(9.17283818781952) q[19];
cx q[12], q[19];
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
cx q[13], q[19];
rz(9.17283818781952) q[19];
cx q[13], q[19];
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
cx q[14], q[19];
rz(9.17283818781952) q[19];
cx q[14], q[19];
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
cx q[15], q[19];
rz(9.17283818781952) q[19];
cx q[15], q[19];
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
cx q[16], q[19];
rz(9.17283818781952) q[19];
cx q[16], q[19];
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
cx q[17], q[19];
rz(9.17283818781952) q[19];
cx q[17], q[19];
rz(-3*pi/2) q[17];
rz(-pi/2) q[17];
h q[17];
rz(-pi/2) q[17];
rz(3.5707963267948966) q[17];
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
cx q[18], q[19];
rz(9.17283818781952) q[19];
cx q[18], q[19];
rz(-3*pi/2) q[18];
rz(-pi/2) q[18];
h q[18];
rz(-pi/2) q[18];
rz(3.5707963267948966) q[18];
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
rz(-3*pi/2) q[19];
rz(-pi/2) q[19];
h q[19];
rz(-pi/2) q[19];
rz(3.5707963267948966) q[19];
cx q[0], q[19];
rz(9.17283818781952) q[19];
cx q[0], q[19];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(4.024559316740996) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[1], q[19];
rz(9.17283818781952) q[19];
cx q[1], q[19];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.816987818554188) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
cx q[2], q[19];
rz(9.17283818781952) q[19];
cx q[2], q[19];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3.826954571302375) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
cx q[3], q[19];
rz(9.17283818781952) q[19];
cx q[3], q[19];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3.2209497507298437) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi) q[3];
cx q[4], q[19];
rz(9.17283818781952) q[19];
cx q[4], q[19];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(4.005919501695051) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi) q[4];
cx q[5], q[19];
rz(9.17283818781952) q[19];
cx q[5], q[19];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3.925065132075982) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi) q[5];
cx q[6], q[19];
rz(9.17283818781952) q[19];
cx q[6], q[19];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.998827954096066) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
cx q[7], q[19];
rz(9.17283818781952) q[19];
cx q[7], q[19];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3.243479832667501) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi) q[7];
cx q[8], q[19];
rz(9.17283818781952) q[19];
cx q[8], q[19];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3.546642187214768) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3*pi) q[8];
cx q[9], q[19];
rz(9.17283818781952) q[19];
cx q[9], q[19];
rz(0) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3.5550874869753093) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3*pi) q[9];
cx q[10], q[19];
rz(9.17283818781952) q[19];
cx q[10], q[19];
rz(0) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(3.6649123106021664) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(3*pi) q[10];
cx q[11], q[19];
rz(9.17283818781952) q[19];
cx q[11], q[19];
rz(0) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(3.20997084126578) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(3*pi) q[11];
cx q[12], q[19];
rz(9.17283818781952) q[19];
cx q[12], q[19];
rz(0) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(3.620974345393606) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(3*pi) q[12];
cx q[13], q[19];
rz(9.17283818781952) q[19];
cx q[13], q[19];
rz(0) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(3.27982442932685) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(3*pi) q[13];
cx q[14], q[19];
rz(9.17283818781952) q[19];
cx q[14], q[19];
rz(0) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(3.6608586620016133) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(3*pi) q[14];
cx q[15], q[19];
rz(9.17283818781952) q[19];
cx q[15], q[19];
rz(0) q[15];
rz(-pi/2) q[15];
h q[15];
rz(-pi/2) q[15];
rz(3.354347671082734) q[15];
rz(-pi/2) q[15];
h q[15];
rz(-pi/2) q[15];
rz(3*pi) q[15];
cx q[16], q[19];
rz(9.17283818781952) q[19];
cx q[16], q[19];
rz(0) q[16];
rz(-pi/2) q[16];
h q[16];
rz(-pi/2) q[16];
rz(3.204251181381726) q[16];
rz(-pi/2) q[16];
h q[16];
rz(-pi/2) q[16];
rz(3*pi) q[16];
cx q[17], q[19];
rz(9.17283818781952) q[19];
cx q[17], q[19];
rz(0) q[17];
rz(-pi/2) q[17];
h q[17];
rz(-pi/2) q[17];
rz(3.891116677312132) q[17];
rz(-pi/2) q[17];
h q[17];
rz(-pi/2) q[17];
rz(3*pi) q[17];
cx q[18], q[19];
rz(9.17283818781952) q[19];
cx q[18], q[19];
rz(0) q[18];
rz(-pi/2) q[18];
h q[18];
rz(-pi/2) q[18];
rz(3.466638003945501) q[18];
rz(-pi/2) q[18];
h q[18];
rz(-pi/2) q[18];
rz(3*pi) q[18];
rz(0) q[19];
rz(-pi/2) q[19];
h q[19];
rz(-pi/2) q[19];
rz(3.2061339014608357) q[19];
rz(-pi/2) q[19];
h q[19];
rz(-pi/2) q[19];
rz(3*pi) q[19];
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
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.989307903484276) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.5377461743249663) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(4.139289893809133) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3.2296155705746035) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi) q[3];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3.7099044339951393) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi) q[4];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3.8262006531458264) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi) q[5];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.431501113441544) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3.1684336173129255) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi) q[7];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3.1891216388514407) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3*pi) q[8];
rz(0) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3.552365227957246) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3*pi) q[9];
rz(0) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(3.519173210937046) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(3*pi) q[10];
rz(0) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(4.031294961803197) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(3*pi) q[11];
rz(0) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(3.631118063249146) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(3*pi) q[12];
rz(0) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(3.4341531614697853) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(3*pi) q[13];
rz(0) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(3.7368754416690093) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(3*pi) q[14];
rz(0) q[15];
rz(-pi/2) q[15];
h q[15];
rz(-pi/2) q[15];
rz(3.842680582104093) q[15];
rz(-pi/2) q[15];
h q[15];
rz(-pi/2) q[15];
rz(3*pi) q[15];
rz(0) q[16];
rz(-pi/2) q[16];
h q[16];
rz(-pi/2) q[16];
rz(3.782243341912432) q[16];
rz(-pi/2) q[16];
h q[16];
rz(-pi/2) q[16];
rz(3*pi) q[16];
rz(0) q[17];
rz(-pi/2) q[17];
h q[17];
rz(-pi/2) q[17];
rz(3.876118597094578) q[17];
rz(-pi/2) q[17];
h q[17];
rz(-pi/2) q[17];
rz(3*pi) q[17];
rz(0) q[18];
rz(-pi/2) q[18];
h q[18];
rz(-pi/2) q[18];
rz(3.612345858090158) q[18];
rz(-pi/2) q[18];
h q[18];
rz(-pi/2) q[18];
rz(3*pi) q[18];
rz(0) q[19];
rz(-pi/2) q[19];
h q[19];
rz(-pi/2) q[19];
rz(3.628225641934928) q[19];
rz(-pi/2) q[19];
h q[19];
rz(-pi/2) q[19];
rz(3*pi) q[19];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], q[11], q[12], q[13], q[14], q[15], q[16], q[17], q[18], q[19];
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