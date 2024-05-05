OPENQASM 3.0;
include "stdgates.inc";
bit[12] meas;
qubit[12] q;
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
h q[0];
rz(0.42920367320510344) q[0];
cx q[1], q[11];
rz(9.17283818781952) q[11];
cx q[1], q[11];
h q[1];
rz(2.0) q[1];
cx q[0], q[1];
rz(9.17283818781952) q[1];
cx q[0], q[1];
cx q[2], q[11];
rz(9.17283818781952) q[11];
cx q[2], q[11];
h q[2];
rz(2.0) q[2];
cx q[0], q[2];
rz(9.17283818781952) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(9.17283818781952) q[2];
cx q[1], q[2];
cx q[3], q[11];
rz(9.17283818781952) q[11];
cx q[3], q[11];
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
cx q[4], q[11];
rz(9.17283818781952) q[11];
cx q[4], q[11];
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
cx q[5], q[11];
rz(9.17283818781952) q[11];
cx q[5], q[11];
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
cx q[6], q[11];
rz(9.17283818781952) q[11];
cx q[6], q[11];
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
cx q[7], q[11];
rz(9.17283818781952) q[11];
cx q[7], q[11];
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
cx q[8], q[11];
rz(9.17283818781952) q[11];
cx q[8], q[11];
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
cx q[9], q[11];
rz(9.17283818781952) q[11];
cx q[9], q[11];
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
cx q[10], q[11];
rz(9.17283818781952) q[11];
cx q[10], q[11];
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
h q[0];
rz(0.16363123673511515) q[0];
h q[0];
cx q[1], q[11];
rz(9.17283818781952) q[11];
cx q[1], q[11];
rz(-pi/2) q[1];
h q[1];
rz(0.7385230881363181) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[11];
rz(9.17283818781952) q[11];
cx q[2], q[11];
rz(-pi/2) q[2];
h q[2];
rz(0.21470113459389717) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[3], q[11];
rz(9.17283818781952) q[11];
cx q[3], q[11];
rz(-pi/2) q[3];
h q[3];
rz(0.25895831002055614) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[4], q[11];
rz(9.17283818781952) q[11];
cx q[4], q[11];
rz(-pi/2) q[4];
h q[4];
rz(0.42344291078268714) q[4];
h q[4];
rz(5*pi/2) q[4];
cx q[5], q[11];
rz(9.17283818781952) q[11];
cx q[5], q[11];
rz(-pi/2) q[5];
h q[5];
rz(0.46889036974164977) q[5];
h q[5];
rz(5*pi/2) q[5];
cx q[6], q[11];
rz(9.17283818781952) q[11];
cx q[6], q[11];
rz(-pi/2) q[6];
h q[6];
rz(0.9898656235679679) q[6];
h q[6];
rz(5*pi/2) q[6];
cx q[7], q[11];
rz(9.17283818781952) q[11];
cx q[7], q[11];
rz(-pi/2) q[7];
h q[7];
rz(0.7718579198006559) q[7];
h q[7];
rz(5*pi/2) q[7];
cx q[8], q[11];
rz(9.17283818781952) q[11];
cx q[8], q[11];
rz(-pi/2) q[8];
h q[8];
rz(0.14413374261352407) q[8];
h q[8];
rz(5*pi/2) q[8];
cx q[9], q[11];
rz(9.17283818781952) q[11];
cx q[9], q[11];
rz(-pi/2) q[9];
h q[9];
rz(0.623099355818288) q[9];
h q[9];
rz(5*pi/2) q[9];
cx q[10], q[11];
rz(9.17283818781952) q[11];
cx q[10], q[11];
rz(-pi/2) q[10];
h q[10];
rz(0.8895943240078878) q[10];
h q[10];
rz(5*pi/2) q[10];
rz(0) q[11];
rz(-pi/2) q[11];
h q[11];
rz(0.5811729643753969) q[11];
h q[11];
rz(5*pi/2) q[11];
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
rz(0.801843277915018) q[0];
h q[0];
rz(5*pi/2) q[0];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.7258059865234459) q[1];
h q[1];
rz(5*pi/2) q[1];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.28425942828608086) q[2];
h q[2];
rz(5*pi/2) q[2];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(0.848640805464377) q[3];
h q[3];
rz(5*pi/2) q[3];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(0.07731018405722523) q[4];
h q[4];
rz(5*pi/2) q[4];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(0.687980609844113) q[5];
h q[5];
rz(5*pi/2) q[5];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(0.9428789044502173) q[6];
h q[6];
rz(5*pi/2) q[6];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(0.43210575099539295) q[7];
h q[7];
rz(5*pi/2) q[7];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(0.24986857969766518) q[8];
h q[8];
rz(5*pi/2) q[8];
rz(0) q[9];
rz(-pi/2) q[9];
h q[9];
rz(0.45493810301928805) q[9];
h q[9];
rz(5*pi/2) q[9];
rz(0) q[10];
rz(-pi/2) q[10];
h q[10];
rz(0.11609887701694888) q[10];
h q[10];
rz(5*pi/2) q[10];
rz(0) q[11];
rz(-pi/2) q[11];
h q[11];
rz(0.8283407307704218) q[11];
h q[11];
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