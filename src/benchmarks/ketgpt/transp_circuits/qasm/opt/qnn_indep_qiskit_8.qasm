OPENQASM 3.0;
include "stdgates.inc";
bit[8] meas;
qubit[8] q;
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
h q[0];
rz(0.42920367320510344) q[0];
cx q[1], q[7];
rz(9.17283818781952) q[7];
cx q[1], q[7];
h q[1];
rz(2.0) q[1];
cx q[0], q[1];
rz(9.17283818781952) q[1];
cx q[0], q[1];
cx q[2], q[7];
rz(9.17283818781952) q[7];
cx q[2], q[7];
h q[2];
rz(2.0) q[2];
cx q[0], q[2];
rz(9.17283818781952) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(9.17283818781952) q[2];
cx q[1], q[2];
cx q[3], q[7];
rz(9.17283818781952) q[7];
cx q[3], q[7];
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
cx q[4], q[7];
rz(9.17283818781952) q[7];
cx q[4], q[7];
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
cx q[5], q[7];
rz(9.17283818781952) q[7];
cx q[5], q[7];
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
cx q[6], q[7];
rz(9.17283818781952) q[7];
cx q[6], q[7];
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
h q[0];
rz(0.37302971745079505) q[0];
h q[0];
cx q[1], q[7];
rz(9.17283818781952) q[7];
cx q[1], q[7];
rz(-pi/2) q[1];
h q[1];
rz(0.5267558842726228) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[7];
rz(9.17283818781952) q[7];
cx q[2], q[7];
rz(-pi/2) q[2];
h q[2];
rz(0.997832656208768) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[3], q[7];
rz(9.17283818781952) q[7];
cx q[3], q[7];
rz(-pi/2) q[3];
h q[3];
rz(0.38814204490086723) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[4], q[7];
rz(9.17283818781952) q[7];
cx q[4], q[7];
rz(-pi/2) q[4];
h q[4];
rz(0.7124872369104209) q[4];
h q[4];
rz(5*pi/2) q[4];
cx q[5], q[7];
rz(9.17283818781952) q[7];
cx q[5], q[7];
rz(-pi/2) q[5];
h q[5];
rz(0.7180555203511019) q[5];
h q[5];
rz(5*pi/2) q[5];
cx q[6], q[7];
rz(9.17283818781952) q[7];
cx q[6], q[7];
rz(-pi/2) q[6];
h q[6];
rz(0.014904956642384892) q[6];
h q[6];
rz(5*pi/2) q[6];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(0.5801428124352079) q[7];
h q[7];
rz(5*pi/2) q[7];
cx q[6], q[7];
cx q[5], q[6];
cx q[4], q[5];
cx q[3], q[4];
cx q[2], q[3];
cx q[1], q[2];
cx q[0], q[1];
h q[0];
rz(0.7394880610283789) q[0];
h q[0];
rz(5*pi/2) q[0];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.2854332675288509) q[1];
h q[1];
rz(5*pi/2) q[1];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.852014006596105) q[2];
h q[2];
rz(5*pi/2) q[2];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(0.451184571038012) q[3];
h q[3];
rz(5*pi/2) q[3];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(0.35714354189695285) q[4];
h q[4];
rz(5*pi/2) q[4];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(0.4581013871568138) q[5];
h q[5];
rz(5*pi/2) q[5];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(0.5854675874246129) q[6];
h q[6];
rz(5*pi/2) q[6];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(0.5368579781690119) q[7];
h q[7];
rz(5*pi/2) q[7];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7];
meas[0] = measure q[0];
meas[1] = measure q[1];
meas[2] = measure q[2];
meas[3] = measure q[3];
meas[4] = measure q[4];
meas[5] = measure q[5];
meas[6] = measure q[6];
meas[7] = measure q[7];