OPENQASM 3.0;
include "stdgates.inc";
bit[15] meas;
qubit[15] q;
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.1417290504072666) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.1367239778389826) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(2*pi) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(2.195593191340487) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi) q[3];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(4.823338764181623) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi) q[4];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(4.655538244767673) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi) q[5];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(4.737251697702813) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3.1407862852123447) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi) q[7];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(1.5707211584041931) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3*pi) q[8];
rz(0) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(6.453108196291524e-05) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3*pi) q[9];
rz(0) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(1.8036611151812532) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(3*pi) q[10];
rz(0) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(1.341178496195893) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(3*pi) q[11];
rz(0) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(3.141508046192195) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(3*pi) q[12];
rz(0) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(4.926993989761583) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(3*pi) q[13];
rz(0) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(3.878965562012302) q[14];
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
rz(2*pi) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.1415598306096006) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3.12599654766473) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(1.570416123791263) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi) q[3];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(1.570773705483313) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi) q[4];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(1.570644658745123) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi) q[5];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(4.711915264639413) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(4.712551557894033) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi) q[7];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(5.477401831274163) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3*pi) q[8];
rz(0) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(2.3357804514752223) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3*pi) q[9];
rz(0) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(4.712621427135323) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(3*pi) q[10];
rz(0) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(4.712346691619063) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(3*pi) q[11];
rz(0) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(4.712138038689413) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(3*pi) q[12];
rz(0) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(2.8278272172375614) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(3*pi) q[13];
rz(0) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(2.910994827168642) q[14];
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
rz(3.141626151008094) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(0.005002914624562926) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(6.267352584281284) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(4.7125301565247035) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi) q[3];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(2.51670967372897) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi) q[4];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(0.1109279730965329) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi) q[5];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.0846561917330844) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3.1164534831718163) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi) q[7];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(1.5717473731969132) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3*pi) q[8];
rz(0) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(0.00013642538849323316) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3*pi) q[9];
rz(0) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(4.711883075243583) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(3*pi) q[10];
rz(0) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(0.2328707688936733) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(3*pi) q[11];
rz(0) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(6.053774974679343) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(3*pi) q[12];
rz(0) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(4.712344844864033) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(3*pi) q[13];
rz(0) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(1.222668918163883) q[14];
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