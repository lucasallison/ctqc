OPENQASM 3.0;
include "stdgates.inc";
bit[15] meas;
qubit[15] q;
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
rz(-3*pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.5707963267948966) q[0];
cx q[1], q[14];
rz(9.17283818781952) q[14];
cx q[1], q[14];
rz(-3*pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.5707963267948966) q[1];
cx q[0], q[1];
rz(9.17283818781952) q[1];
cx q[0], q[1];
cx q[2], q[14];
rz(9.17283818781952) q[14];
cx q[2], q[14];
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
cx q[3], q[14];
rz(9.17283818781952) q[14];
cx q[3], q[14];
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
cx q[4], q[14];
rz(9.17283818781952) q[14];
cx q[4], q[14];
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
cx q[5], q[14];
rz(9.17283818781952) q[14];
cx q[5], q[14];
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
cx q[6], q[14];
rz(9.17283818781952) q[14];
cx q[6], q[14];
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
cx q[7], q[14];
rz(9.17283818781952) q[14];
cx q[7], q[14];
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
cx q[8], q[14];
rz(9.17283818781952) q[14];
cx q[8], q[14];
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
cx q[9], q[14];
rz(9.17283818781952) q[14];
cx q[9], q[14];
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
cx q[10], q[14];
rz(9.17283818781952) q[14];
cx q[10], q[14];
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
cx q[11], q[14];
rz(9.17283818781952) q[14];
cx q[11], q[14];
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
cx q[12], q[14];
rz(9.17283818781952) q[14];
cx q[12], q[14];
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
cx q[13], q[14];
rz(9.17283818781952) q[14];
cx q[13], q[14];
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
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.2143592943482546) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[1], q[14];
rz(9.17283818781952) q[14];
cx q[1], q[14];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.772348313508361) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
cx q[2], q[14];
rz(9.17283818781952) q[14];
cx q[2], q[14];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3.632467671669199) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
cx q[3], q[14];
rz(9.17283818781952) q[14];
cx q[3], q[14];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3.307565345375976) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi) q[3];
cx q[4], q[14];
rz(9.17283818781952) q[14];
cx q[4], q[14];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3.6528551844872004) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi) q[4];
cx q[5], q[14];
rz(9.17283818781952) q[14];
cx q[5], q[14];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3.750528685643773) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi) q[5];
cx q[6], q[14];
rz(9.17283818781952) q[14];
cx q[6], q[14];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(4.1320412600470675) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
cx q[7], q[14];
rz(9.17283818781952) q[14];
cx q[7], q[14];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3.4944469632955943) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi) q[7];
cx q[8], q[14];
rz(9.17283818781952) q[14];
cx q[8], q[14];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3.324524377842955) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3*pi) q[8];
cx q[9], q[14];
rz(9.17283818781952) q[14];
cx q[9], q[14];
rz(0) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(4.008087551397813) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3*pi) q[9];
cx q[10], q[14];
rz(9.17283818781952) q[14];
cx q[10], q[14];
rz(0) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(3.977746050531792) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(3*pi) q[10];
cx q[11], q[14];
rz(9.17283818781952) q[14];
cx q[11], q[14];
rz(0) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(3.8228498172752703) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(3*pi) q[11];
cx q[12], q[14];
rz(9.17283818781952) q[14];
cx q[12], q[14];
rz(0) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(4.069310952347506) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(3*pi) q[12];
cx q[13], q[14];
rz(9.17283818781952) q[14];
cx q[13], q[14];
rz(0) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(3.418444599019705) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(3*pi) q[13];
rz(0) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(3.175304329440354) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(3*pi) q[14];
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
rz(3.6214298953719513) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.593124247852324) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3.760749257096973) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3.600242826541212) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi) q[3];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3.346685191196522) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi) q[4];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3.2144197371882757) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi) q[5];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.510875819457698) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3.729155125409007) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi) q[7];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3.775197526978796) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3*pi) q[8];
rz(0) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3.868922520340047) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3*pi) q[9];
rz(0) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(3.856319924947392) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(3*pi) q[10];
rz(0) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(3.775719416565268) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(3*pi) q[11];
rz(0) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(3.868973159254664) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(3*pi) q[12];
rz(0) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(3.3068076892441973) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(3*pi) q[13];
rz(0) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(3.849400784041531) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(3*pi) q[14];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], q[11], q[12], q[13], q[14];
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
