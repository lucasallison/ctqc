OPENQASM 3.0;
include "stdgates.inc";
bit[4] meas;
bit[4] meas1;
qubit[4] q;
h q[0];
rz(-3.1370029588784956) q[0];
h q[1];
rz(0.034393278841671204) q[1];
cx q[0], q[1];
rz(2.5797101980239785) q[1];
cx q[0], q[1];
h q[2];
rz(-0.003340026125658646) q[2];
cx q[0], q[2];
rz(2.5798185572649612) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(2.579780868154737) q[2];
cx q[1], q[2];
h q[3];
rz(0.010342378798725349) q[3];
cx q[0], q[3];
rz(2.5796299948259818) q[3];
cx q[0], q[3];
h q[0];
rz(0.2438873801792827) q[0];
h q[0];
rz(6.276839513745099) q[0];
cx q[1], q[3];
rz(2.5796752798936557) q[3];
cx q[1], q[3];
rz(-pi) q[1];
h q[1];
rz(0.2438873801792827) q[1];
h q[1];
rz(9.377225202515824) q[1];
cx q[0], q[1];
rz(-3.5667531431238766) q[1];
cx q[0], q[1];
cx q[2], q[3];
rz(2.5797007358045723) q[3];
cx q[2], q[3];
rz(-pi) q[2];
h q[2];
rz(0.2438873801792827) q[2];
h q[2];
rz(9.429395940219527) q[2];
cx q[0], q[2];
rz(-3.566902962535242) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(-3.566850852901976) q[2];
cx q[1], q[2];
rz(-pi) q[3];
h q[3];
rz(0.2438873801792827) q[3];
h q[3];
rz(9.410478404130814) q[3];
cx q[0], q[3];
rz(-3.566642252757679) q[3];
cx q[0], q[3];
h q[0];
rz(0.541120123601504) q[0];
h q[0];
rz(9.419457153357353) q[0];
cx q[1], q[3];
rz(-3.566704864696643) q[3];
cx q[1], q[3];
rz(-pi) q[1];
h q[1];
rz(0.541120123601504) q[1];
h q[1];
rz(9.384906024944497) q[1];
cx q[0], q[1];
rz(-2.990643606150888) q[1];
cx q[0], q[1];
cx q[2], q[3];
rz(-3.5667400604912483) q[3];
cx q[2], q[3];
rz(-pi) q[2];
h q[2];
rz(0.541120123601504) q[2];
h q[2];
rz(9.42865003437855) q[2];
cx q[0], q[2];
rz(-2.990769226412986) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(-2.9907255336382708) q[2];
cx q[1], q[2];
rz(-pi) q[3];
h q[3];
rz(0.541120123601504) q[3];
h q[3];
rz(9.412788098865322) q[3];
cx q[0], q[3];
rz(-2.990550627031968) q[3];
cx q[0], q[3];
h q[0];
rz(2.2765636643147387) q[0];
h q[0];
cx q[1], q[3];
rz(-2.9906031257576764) q[3];
cx q[1], q[3];
h q[1];
rz(2.2765636643147387) q[1];
h q[1];
cx q[2], q[3];
rz(-2.9906326366528453) q[3];
cx q[2], q[3];
h q[2];
rz(2.2765636643147387) q[2];
h q[2];
h q[3];
rz(2.2765636643147387) q[3];
h q[3];
barrier q[0], q[1], q[2], q[3];
meas[0] = measure q[0];
meas[1] = measure q[1];
meas[2] = measure q[2];
meas[3] = measure q[3];
barrier q[0], q[1], q[2], q[3];
meas1[0] = measure q[0];
meas1[1] = measure q[1];
meas1[2] = measure q[2];
meas1[3] = measure q[3];