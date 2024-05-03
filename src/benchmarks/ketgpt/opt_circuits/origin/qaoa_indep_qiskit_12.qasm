OPENQASM 3.0;
include "stdgates.inc";
bit[12] meas;
qubit[12] q;
h q[0];
h q[1];
h q[2];
cx q[1], q[2];
rz(1.2894758534169126) q[2];
cx q[1], q[2];
h q[3];
h q[4];
cx q[3], q[4];
rz(1.2894758534169126) q[4];
cx q[3], q[4];
h q[5];
cx q[1], q[5];
rz(1.2894758534169126) q[5];
cx q[1], q[5];
rz(pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(-5.6384780692077925) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(5*pi/2) q[1];
h q[6];
cx q[4], q[6];
rz(1.2894758534169126) q[6];
cx q[4], q[6];
rz(pi/2) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(-5.6384780692077925) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(5*pi/2) q[4];
h q[7];
cx q[5], q[7];
rz(1.2894758534169126) q[7];
cx q[5], q[7];
rz(pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(-5.6384780692077925) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(5*pi/2) q[5];
cx q[6], q[7];
rz(1.2894758534169126) q[7];
cx q[6], q[7];
rz(pi/2) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(-5.6384780692077925) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(5*pi/2) q[6];
rz(pi/2) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(-5.6384780692077925) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(5*pi/2) q[7];
h q[8];
cx q[2], q[8];
rz(1.2894758534169126) q[8];
cx q[2], q[8];
rz(pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(-5.6384780692077925) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(5*pi/2) q[2];
cx q[1], q[2];
rz(2.496850026336729) q[2];
cx q[1], q[2];
cx q[1], q[5];
rz(2.496850026336729) q[5];
cx q[1], q[5];
rz(pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(1.8521563586348013) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(5*pi/2) q[1];
cx q[5], q[7];
rz(2.496850026336729) q[7];
cx q[5], q[7];
rz(pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(1.8521563586348013) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(5*pi/2) q[5];
h q[9];
cx q[0], q[9];
rz(1.2894758534169126) q[9];
cx q[0], q[9];
h q[10];
cx q[0], q[10];
rz(1.2894758534169126) q[10];
cx q[0], q[10];
rz(pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(-5.6384780692077925) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(5*pi/2) q[0];
cx q[3], q[10];
rz(1.2894758534169126) q[10];
cx q[3], q[10];
rz(pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(-5.6384780692077925) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(5*pi/2) q[3];
cx q[3], q[4];
rz(2.496850026336729) q[4];
cx q[3], q[4];
cx q[4], q[6];
rz(2.496850026336729) q[6];
cx q[4], q[6];
rz(pi/2) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(1.8521563586348013) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(5*pi/2) q[4];
cx q[6], q[7];
rz(2.496850026336729) q[7];
cx q[6], q[7];
rz(pi/2) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(1.8521563586348013) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(5*pi/2) q[6];
rz(pi/2) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(1.8521563586348013) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(5*pi/2) q[7];
rz(pi/2) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(-5.6384780692077925) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(5*pi/2) q[10];
h q[11];
cx q[8], q[11];
rz(1.2894758534169126) q[11];
cx q[8], q[11];
rz(pi/2) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(-5.6384780692077925) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(5*pi/2) q[8];
cx q[2], q[8];
rz(2.496850026336729) q[8];
cx q[2], q[8];
rz(pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(1.8521563586348013) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(5*pi/2) q[2];
cx q[9], q[11];
rz(1.2894758534169126) q[11];
cx q[9], q[11];
rz(pi/2) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(-5.6384780692077925) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(5*pi/2) q[9];
cx q[0], q[9];
rz(2.496850026336729) q[9];
cx q[0], q[9];
cx q[0], q[10];
rz(2.496850026336729) q[10];
cx q[0], q[10];
rz(pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(1.8521563586348013) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(5*pi/2) q[0];
cx q[3], q[10];
rz(2.496850026336729) q[10];
cx q[3], q[10];
rz(pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(1.8521563586348013) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(5*pi/2) q[3];
rz(pi/2) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(1.8521563586348013) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(5*pi/2) q[10];
rz(pi/2) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(-5.6384780692077925) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(5*pi/2) q[11];
cx q[8], q[11];
rz(2.496850026336729) q[11];
cx q[8], q[11];
rz(pi/2) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(1.8521563586348013) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(5*pi/2) q[8];
cx q[9], q[11];
rz(2.496850026336729) q[11];
cx q[9], q[11];
rz(pi/2) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(1.8521563586348013) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(5*pi/2) q[9];
rz(pi/2) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(1.8521563586348013) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(5*pi/2) q[11];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], q[11];
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
