OPENQASM 3.0;
include "stdgates.inc";
qubit[11] q;
cx q[9], q[10];
cx q[10], q[9];
cx q[9], q[10];
cx q[5], q[10];
cx q[8], q[9];
cx q[9], q[8];
cx q[8], q[9];
cx q[6], q[8];
cx q[7], q[9];
cx q[8], q[6];
cx q[6], q[8];
cx q[3], q[8];
cx q[8], q[3];
cx q[3], q[8];
h q[8];
cx q[9], q[7];
cx q[7], q[9];
h q[7];
h q[7];
cx q[0], q[7];
h q[0];
h q[7];
cx q[7], q[8];
h q[7];
h q[8];
h q[8];
cx q[0], q[8];
h q[8];
h q[8];
h q[8];
cx q[3], q[8];
cx q[3], q[7];
h q[3];
cx q[0], q[3];
h q[3];
h q[3];
h q[7];
h q[7];
h q[8];
h q[8];
cx q[6], q[8];
cx q[6], q[7];
h q[6];
cx q[3], q[6];
h q[6];
h q[6];
cx q[0], q[6];
h q[6];
h q[6];
h q[7];
h q[8];
cx q[10], q[5];
cx q[5], q[10];
cx q[4], q[10];
cx q[10], q[4];
cx q[4], q[10];
cx q[2], q[4];
cx q[4], q[2];
cx q[2], q[4];
cx q[1], q[4];
cx q[4], q[1];
cx q[1], q[4];
h q[10];
cx q[8], q[10];
h q[8];
h q[10];
h q[10];
cx q[7], q[10];
h q[7];
h q[10];
h q[10];
cx q[6], q[10];
h q[6];
h q[10];
h q[10];
cx q[3], q[10];
h q[10];
h q[10];
cx q[0], q[10];
h q[10];
h q[10];
h q[10];
cx q[4], q[10];
cx q[4], q[8];
cx q[4], q[7];
cx q[4], q[6];
h q[4];
cx q[3], q[4];
h q[3];
h q[4];
h q[4];
cx q[0], q[4];
h q[4];
h q[4];
h q[4];
h q[6];
h q[6];
h q[7];
h q[7];
h q[8];
h q[8];
h q[10];
h q[10];
cx q[1], q[10];
cx q[1], q[8];
cx q[1], q[7];
cx q[1], q[6];
cx q[1], q[4];
cx q[1], q[3];
h q[1];
cx q[0], q[1];
h q[1];
h q[1];
h q[3];
h q[3];
h q[4];
h q[4];
h q[6];
h q[6];
h q[7];
h q[7];
h q[8];
h q[8];
h q[10];
h q[10];
cx q[2], q[10];
cx q[2], q[8];
cx q[2], q[7];
cx q[2], q[6];
cx q[2], q[4];
cx q[2], q[3];
h q[2];
cx q[1], q[2];
h q[2];
h q[2];
cx q[0], q[2];
h q[2];
h q[2];
h q[3];
h q[4];
h q[6];
h q[6];
h q[7];
h q[7];
h q[8];
h q[8];
h q[10];
h q[10];
cx q[5], q[10];
cx q[5], q[8];
cx q[5], q[7];
cx q[5], q[6];
h q[5];
cx q[4], q[5];
h q[5];
h q[5];
cx q[3], q[5];
h q[5];
h q[5];
cx q[2], q[5];
h q[5];
h q[5];
cx q[1], q[5];
h q[5];
h q[5];
cx q[0], q[5];
h q[5];
h q[5];
h q[6];
h q[7];
h q[8];
h q[10];
h q[10];
cx q[9], q[10];
h q[9];
cx q[8], q[9];
h q[9];
h q[9];
cx q[7], q[9];
h q[7];
h q[9];
h q[9];
cx q[6], q[9];
h q[9];
h q[9];
cx q[5], q[9];
h q[9];
h q[9];
cx q[4], q[9];
h q[9];
h q[9];
cx q[3], q[9];
h q[9];
h q[9];
cx q[2], q[9];
h q[9];
h q[9];
cx q[1], q[9];
h q[9];
h q[9];
cx q[0], q[9];
h q[9];
h q[9];
rz(1.289382883592484) q[9];
h q[9];
h q[9];
cx q[5], q[9];
rz(1.289382883592484) q[5];
h q[5];
h q[5];
h q[9];
h q[9];
cx q[2], q[9];
cx q[2], q[5];
rz(1.289382883592484) q[2];
h q[2];
h q[2];
h q[5];
h q[5];
h q[9];
h q[9];
cx q[1], q[9];
cx q[1], q[5];
cx q[1], q[2];
rz(1.289382883592484) q[1];
h q[1];
h q[2];
h q[5];
h q[5];
h q[9];
h q[9];
cx q[4], q[9];
cx q[4], q[5];
h q[4];
cx q[2], q[4];
h q[4];
h q[4];
cx q[1], q[4];
h q[4];
rz(1.289382883592484) q[4];
h q[4];
h q[5];
h q[9];
h q[10];
h q[10];
cx q[9], q[10];
h q[9];
h q[10];
h q[10];
cx q[5], q[10];
h q[10];
h q[10];
cx q[4], q[10];
h q[10];
h q[10];
cx q[2], q[10];
h q[10];
h q[10];
cx q[1], q[10];
h q[10];
rz(1.289382883592484) q[10];
h q[10];
h q[10];
cx q[6], q[10];
cx q[6], q[9];
h q[6];
cx q[5], q[6];
h q[5];
h q[6];
h q[6];
cx q[4], q[6];
h q[4];
h q[6];
h q[6];
cx q[2], q[6];
h q[6];
h q[6];
cx q[1], q[6];
h q[6];
rz(1.289382883592484) q[6];
h q[6];
h q[6];
h q[9];
h q[9];
h q[10];
h q[10];
cx q[3], q[10];
cx q[3], q[9];
cx q[3], q[6];
cx q[3], q[5];
cx q[3], q[4];
h q[3];
cx q[2], q[3];
h q[3];
h q[3];
cx q[1], q[3];
h q[3];
rz(1.289382883592484) q[3];
h q[3];
h q[4];
h q[5];
h q[6];
h q[9];
h q[9];
h q[10];
h q[10];
cx q[8], q[10];
cx q[8], q[9];
h q[8];
cx q[6], q[8];
h q[6];
h q[8];
h q[8];
cx q[5], q[8];
h q[5];
h q[8];
h q[8];
cx q[4], q[8];
h q[4];
h q[8];
h q[8];
cx q[3], q[8];
h q[3];
h q[8];
h q[8];
cx q[2], q[8];
h q[2];
h q[8];
h q[8];
cx q[1], q[8];
h q[1];
h q[8];
rz(1.289382883592484) q[8];
h q[8];
h q[8];
h q[9];
h q[9];
h q[10];
h q[10];
cx q[0], q[10];
cx q[0], q[9];
cx q[0], q[8];
cx q[0], q[6];
cx q[0], q[5];
cx q[0], q[4];
cx q[0], q[3];
cx q[0], q[2];
cx q[0], q[1];
rz(1.289382883592484) q[0];
h q[0];
cx q[0], q[7];
rz(3.7863621000406047) q[0];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[8];
h q[9];
h q[9];
rz(1.289382883592484) q[9];
h q[9];
h q[9];
h q[10];
h q[10];
cx q[7], q[10];
cx q[7], q[9];
cx q[7], q[8];
h q[7];
cx q[6], q[7];
h q[7];
h q[7];
cx q[5], q[7];
h q[7];
h q[7];
cx q[4], q[7];
h q[7];
h q[7];
cx q[3], q[7];
h q[7];
h q[7];
cx q[2], q[7];
h q[7];
h q[7];
cx q[1], q[7];
h q[7];
h q[7];
h q[8];
h q[8];
cx q[0], q[8];
h q[8];
rz(3.7863621000406047) q[8];
h q[8];
h q[9];
h q[9];
h q[10];
h q[10];
cx q[8], q[10];
cx q[8], q[9];
h q[8];
cx q[7], q[8];
h q[7];
h q[8];
h q[8];
cx q[6], q[8];
h q[6];
h q[8];
h q[8];
cx q[5], q[8];
h q[5];
h q[8];
h q[8];
cx q[4], q[8];
h q[4];
h q[8];
h q[8];
cx q[3], q[8];
h q[3];
cx q[0], q[3];
h q[3];
rz(3.7863621000406047) q[3];
h q[3];
h q[8];
h q[8];
cx q[2], q[8];
h q[8];
h q[8];
cx q[1], q[8];
h q[8];
rz(2.4969197735917144) q[8];
h q[8];
h q[8];
h q[9];
h q[9];
h q[10];
h q[10];
cx q[3], q[10];
cx q[3], q[9];
cx q[3], q[8];
cx q[3], q[7];
cx q[3], q[6];
cx q[3], q[5];
cx q[3], q[4];
h q[3];
cx q[2], q[3];
h q[3];
h q[3];
cx q[1], q[3];
h q[3];
rz(2.4969197735917144) q[3];
h q[3];
h q[4];
h q[5];
h q[6];
h q[6];
cx q[0], q[6];
h q[6];
rz(3.7863621000406047) q[6];
h q[6];
h q[7];
h q[7];
h q[8];
h q[8];
h q[9];
h q[9];
h q[10];
h q[10];
cx q[6], q[10];
cx q[6], q[9];
cx q[6], q[8];
cx q[6], q[7];
h q[6];
cx q[5], q[6];
h q[6];
h q[6];
cx q[4], q[6];
h q[6];
h q[6];
cx q[3], q[6];
h q[6];
h q[6];
cx q[2], q[6];
h q[6];
h q[6];
cx q[1], q[6];
h q[6];
rz(2.4969197735917144) q[6];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];
h q[10];
cx q[0], q[10];
h q[10];
rz(3.7863621000406047) q[10];
h q[10];
h q[10];
cx q[9], q[10];
h q[9];
h q[10];
h q[10];
cx q[8], q[10];
h q[8];
h q[10];
h q[10];
cx q[7], q[10];
h q[7];
h q[10];
h q[10];
cx q[6], q[10];
h q[6];
h q[10];
h q[10];
cx q[5], q[10];
h q[5];
h q[10];
h q[10];
cx q[4], q[10];
h q[4];
cx q[0], q[4];
h q[4];
rz(3.7863621000406047) q[4];
h q[4];
h q[10];
h q[10];
cx q[3], q[10];
h q[10];
h q[10];
cx q[2], q[10];
h q[10];
h q[10];
cx q[1], q[10];
h q[10];
rz(2.4969197735917144) q[10];
h q[10];
h q[10];
cx q[4], q[10];
cx q[4], q[9];
cx q[4], q[8];
cx q[4], q[7];
cx q[4], q[6];
cx q[4], q[5];
h q[4];
cx q[3], q[4];
h q[3];
h q[4];
h q[4];
cx q[2], q[4];
h q[2];
h q[4];
h q[4];
cx q[1], q[4];
h q[1];
cx q[0], q[1];
h q[1];
rz(3.7863621000406047) q[1];
h q[1];
h q[4];
rz(2.4969197735917144) q[4];
h q[4];
h q[4];
h q[5];
h q[5];
h q[6];
h q[6];
h q[7];
h q[7];
h q[8];
h q[8];
h q[9];
h q[9];
h q[10];
h q[10];
cx q[1], q[10];
cx q[1], q[9];
cx q[1], q[8];
cx q[1], q[7];
cx q[1], q[6];
cx q[1], q[5];
cx q[1], q[4];
cx q[1], q[3];
cx q[1], q[2];
rz(2.4969197735917144) q[1];
h q[1];
h q[2];
h q[2];
cx q[0], q[2];
h q[2];
rz(3.7863621000406047) q[2];
h q[2];
h q[3];
h q[3];
h q[4];
h q[4];
h q[5];
h q[5];
h q[6];
h q[6];
h q[7];
h q[7];
h q[8];
h q[8];
h q[9];
h q[9];
h q[10];
h q[10];
cx q[2], q[10];
cx q[2], q[9];
cx q[2], q[8];
cx q[2], q[7];
cx q[2], q[6];
cx q[2], q[5];
cx q[2], q[4];
cx q[2], q[3];
h q[2];
cx q[1], q[2];
h q[2];
rz(2.4969197735917144) q[2];
h q[2];
h q[3];
h q[4];
h q[5];
h q[5];
cx q[0], q[5];
h q[5];
rz(3.7863621000406047) q[5];
h q[5];
h q[6];
h q[6];
h q[7];
h q[7];
h q[8];
h q[8];
h q[9];
h q[9];
h q[10];
h q[10];
cx q[5], q[10];
cx q[5], q[9];
cx q[5], q[8];
cx q[5], q[7];
cx q[5], q[6];
h q[5];
cx q[4], q[5];
h q[5];
h q[5];
cx q[3], q[5];
h q[5];
h q[5];
cx q[2], q[5];
h q[5];
h q[5];
cx q[1], q[5];
h q[5];
rz(2.4969197735917144) q[5];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[9];
cx q[0], q[9];
h q[9];
rz(3.7863621000406047) q[9];
h q[9];
h q[10];
h q[10];
cx q[9], q[10];
h q[9];
cx q[8], q[9];
h q[8];
h q[9];
h q[9];
cx q[7], q[9];
h q[7];
cx q[0], q[7];
h q[7];
rz(3.7863621000406047) q[7];
h q[7];
h q[9];
h q[9];
cx q[6], q[9];
h q[9];
h q[9];
cx q[5], q[9];
h q[9];
h q[9];
cx q[4], q[9];
h q[9];
h q[9];
cx q[3], q[9];
h q[9];
h q[9];
cx q[2], q[9];
h q[9];
h q[9];
cx q[1], q[9];
h q[9];
rz(2.4969197735917144) q[9];
h q[9];
h q[9];
h q[10];
h q[10];
cx q[7], q[10];
cx q[7], q[9];
cx q[7], q[8];
h q[7];
cx q[6], q[7];
h q[7];
h q[7];
cx q[5], q[7];
h q[7];
h q[7];
cx q[4], q[7];
h q[7];
h q[7];
cx q[3], q[7];
h q[7];
h q[7];
cx q[2], q[7];
h q[7];
h q[7];
cx q[1], q[7];
h q[7];
rz(2.4969197735917144) q[7];
h q[7];
h q[8];
h q[8];
h q[9];
h q[9];
h q[10];
h q[10];
cx q[8], q[10];
cx q[8], q[9];
h q[8];
cx q[7], q[8];
h q[7];
h q[8];
h q[8];
cx q[6], q[8];
h q[6];
h q[8];
h q[8];
cx q[5], q[8];
h q[5];
h q[8];
h q[8];
cx q[4], q[8];
h q[4];
h q[8];
h q[8];
cx q[3], q[8];
h q[3];
h q[8];
h q[8];
cx q[2], q[8];
h q[2];
h q[8];
h q[8];
cx q[1], q[8];
h q[1];
h q[8];
rz(2.496919873591714) q[8];
h q[8];
h q[8];
h q[9];
h q[9];
h q[10];
h q[10];
cx q[0], q[10];
cx q[0], q[9];
cx q[0], q[8];
cx q[0], q[7];
cx q[0], q[6];
cx q[0], q[5];
cx q[0], q[4];
cx q[0], q[3];
cx q[0], q[2];
cx q[0], q[1];
h q[0];
rz(4.993595344246383) q[0];
h q[0];
h q[1];
rz(4.993595344246383) q[1];
h q[1];
h q[2];
rz(4.993595344246383) q[2];
h q[2];
h q[3];
rz(4.993595344246383) q[3];
h q[3];
h q[4];
rz(4.993595344246383) q[4];
h q[4];
h q[5];
rz(4.993595344246383) q[5];
h q[5];
h q[6];
rz(4.993595344246383) q[6];
h q[6];
h q[7];
rz(4.993595344246383) q[7];
h q[7];
h q[8];
rz(4.993595344246383) q[8];
h q[8];
h q[9];
rz(4.993595344246383) q[9];
h q[9];
h q[10];
rz(4.993595344246383) q[10];
h q[10];