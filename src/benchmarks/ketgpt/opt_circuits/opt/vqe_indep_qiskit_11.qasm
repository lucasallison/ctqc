OPENQASM 3.0;
include "stdgates.inc";
bit[11] meas;
qubit[11] q;
rz(-pi/2) q[0];
h q[0];
rz(-3.933218671559047e-05) q[0];
h q[0];
rz(-pi/2) q[1];
h q[1];
rz(3.1415382822514797) q[1];
h q[1];
rz(5*pi/2) q[1];
rz(-pi/2) q[2];
h q[2];
rz(-1.0424469898815403) q[2];
h q[2];
rz(5*pi/2) q[2];
rz(-pi/2) q[3];
h q[3];
rz(-2.6529781684911) q[3];
h q[3];
rz(5*pi/2) q[3];
rz(-pi/2) q[4];
h q[4];
rz(-3.14153884883199) q[4];
h q[4];
rz(5*pi/2) q[4];
rz(-pi/2) q[5];
h q[5];
rz(-1.57083009429574) q[5];
h q[5];
rz(5*pi/2) q[5];
rz(-pi/2) q[7];
h q[7];
rz(1.33040046687407) q[7];
h q[7];
rz(5*pi/2) q[7];
rz(-pi/2) q[8];
h q[8];
rz(-1.56990557873177) q[8];
h q[8];
rz(5*pi/2) q[8];
rz(-pi/2) q[9];
h q[9];
rz(-0.90849852614173) q[9];
h q[9];
rz(5*pi/2) q[9];
rz(-pi/2) q[10];
h q[10];
rz(1.9322666723918998) q[10];
h q[10];
rz(5*pi/2) q[10];
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
rz(1.56922026145293) q[0];
h q[0];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(1.5707476217051601) q[1];
h q[1];
rz(5*pi/2) q[1];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-1.57136623420444) q[2];
h q[2];
rz(5*pi/2) q[2];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-1.5702143680604) q[3];
h q[3];
rz(5*pi/2) q[3];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(1.5710314383846002) q[4];
h q[4];
rz(5*pi/2) q[4];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(0.5311900787265689) q[5];
h q[5];
rz(5*pi/2) q[5];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-2.61048880395482) q[6];
h q[6];
rz(5*pi/2) q[6];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(0.32096713522508225) q[7];
h q[7];
rz(5*pi/2) q[7];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(pi) q[8];
h q[8];
rz(5*pi/2) q[8];
rz(0) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-1.56980103317781) q[9];
h q[9];
rz(5*pi/2) q[9];
rz(0) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-0.5508919937406391) q[10];
h q[10];
rz(5*pi/2) q[10];
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
rz(1.5692461794893795) q[0];
h q[0];
rz(5*pi/2) q[0];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(1.5707510987018196) q[1];
h q[1];
rz(5*pi/2) q[1];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(1.5708485262009102) q[2];
h q[2];
rz(5*pi/2) q[2];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(0.52837040487749) q[3];
h q[3];
rz(5*pi/2) q[3];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(1.0821925840008095) q[4];
h q[4];
rz(5*pi/2) q[4];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-1.57082538551394) q[5];
h q[5];
rz(5*pi/2) q[5];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-5.3091240244995674e-05) q[6];
h q[6];
rz(5*pi/2) q[6];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-1.57076340030464) q[7];
h q[7];
rz(5*pi/2) q[7];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(0.8556807151811192) q[8];
h q[8];
rz(5*pi/2) q[8];
rz(0) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-1.35617645765508) q[9];
h q[9];
rz(5*pi/2) q[9];
rz(0) q[10];
rz(-pi/2) q[10];
h q[10];
rz(1.1450307749629198) q[10];
h q[10];
rz(5*pi/2) q[10];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10];
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
