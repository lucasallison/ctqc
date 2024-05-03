OPENQASM 3.0;
include "stdgates.inc";
bit[8] meas;
qubit[8] q;
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(-2.033463594927447) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(8.779564606856253) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
h q[1];
cx q[0], q[1];
h q[1];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(5.973262889880003) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
h q[2];
cx q[0], q[2];
h q[2];
h q[2];
cx q[1], q[2];
h q[2];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(6.2983822280096735) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi) q[3];
h q[3];
cx q[0], q[3];
h q[3];
h q[3];
cx q[1], q[3];
h q[3];
h q[3];
cx q[2], q[3];
h q[3];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3.404149895239143) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi) q[4];
h q[4];
cx q[0], q[4];
h q[4];
h q[4];
cx q[1], q[4];
h q[4];
h q[4];
cx q[2], q[4];
h q[4];
h q[4];
cx q[3], q[4];
h q[4];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(-0.49593424906749695) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi) q[5];
h q[5];
cx q[0], q[5];
h q[5];
h q[5];
cx q[1], q[5];
h q[5];
h q[5];
cx q[2], q[5];
h q[5];
h q[5];
cx q[3], q[5];
h q[5];
h q[5];
cx q[4], q[5];
h q[5];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(-2.5377579943642967) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
h q[6];
cx q[0], q[6];
h q[6];
h q[6];
cx q[1], q[6];
h q[6];
h q[6];
cx q[2], q[6];
h q[6];
h q[6];
cx q[3], q[6];
h q[6];
h q[6];
cx q[4], q[6];
h q[6];
h q[6];
cx q[5], q[6];
h q[6];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(0.7102726144677933) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi) q[7];
h q[7];
cx q[0], q[7];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(5.577049253399413) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
h q[7];
h q[7];
cx q[1], q[7];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.398396496037079) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
h q[1];
cx q[0], q[1];
h q[1];
h q[7];
h q[7];
cx q[2], q[7];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(1.5390391147015132) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
h q[2];
cx q[0], q[2];
h q[2];
h q[2];
cx q[1], q[2];
h q[2];
h q[7];
h q[7];
cx q[3], q[7];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(2.574533883868483) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi) q[3];
h q[3];
cx q[0], q[3];
h q[3];
h q[3];
cx q[1], q[3];
h q[3];
h q[3];
cx q[2], q[3];
h q[3];
h q[7];
h q[7];
cx q[4], q[7];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(7.826898561007133) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi) q[4];
h q[4];
cx q[0], q[4];
h q[4];
h q[4];
cx q[1], q[4];
h q[4];
h q[4];
cx q[2], q[4];
h q[4];
h q[4];
cx q[3], q[4];
h q[4];
h q[7];
h q[7];
cx q[5], q[7];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(-2.5807749735983965) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi) q[5];
h q[5];
cx q[0], q[5];
h q[5];
h q[5];
cx q[1], q[5];
h q[5];
h q[5];
cx q[2], q[5];
h q[5];
h q[5];
cx q[3], q[5];
h q[5];
h q[5];
cx q[4], q[5];
h q[5];
h q[7];
h q[7];
cx q[6], q[7];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(10.351072349692023) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
h q[6];
cx q[0], q[6];
h q[6];
h q[6];
cx q[1], q[6];
h q[6];
h q[6];
cx q[2], q[6];
h q[6];
h q[6];
cx q[3], q[6];
h q[6];
h q[6];
cx q[4], q[6];
h q[6];
h q[6];
cx q[5], q[6];
h q[6];
h q[7];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(1.5271215967221932) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi) q[7];
h q[7];
cx q[0], q[7];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.4104581921176083) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
h q[7];
h q[7];
cx q[1], q[7];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(6.0906428637038434) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
h q[1];
cx q[0], q[1];
h q[1];
h q[7];
h q[7];
cx q[2], q[7];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(2.6457440802830243) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
h q[2];
cx q[0], q[2];
h q[2];
h q[2];
cx q[1], q[2];
h q[2];
h q[7];
h q[7];
cx q[3], q[7];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(1.2666939221093632) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi) q[3];
h q[3];
cx q[0], q[3];
h q[3];
h q[3];
cx q[1], q[3];
h q[3];
h q[3];
cx q[2], q[3];
h q[3];
h q[7];
h q[7];
cx q[4], q[7];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(7.855174298119263) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi) q[4];
h q[4];
cx q[0], q[4];
h q[4];
h q[4];
cx q[1], q[4];
h q[4];
h q[4];
cx q[2], q[4];
h q[4];
h q[4];
cx q[3], q[4];
h q[4];
h q[7];
h q[7];
cx q[5], q[7];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(8.663840918360973) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi) q[5];
h q[5];
cx q[0], q[5];
h q[5];
h q[5];
cx q[1], q[5];
h q[5];
h q[5];
cx q[2], q[5];
h q[5];
h q[5];
cx q[3], q[5];
h q[5];
h q[5];
cx q[4], q[5];
h q[5];
h q[7];
h q[7];
cx q[6], q[7];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(0.3606515149672531) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
h q[6];
cx q[0], q[6];
h q[6];
h q[6];
cx q[1], q[6];
h q[6];
h q[6];
cx q[2], q[6];
h q[6];
h q[6];
cx q[3], q[6];
h q[6];
h q[6];
cx q[4], q[6];
h q[6];
h q[6];
cx q[5], q[6];
h q[6];
h q[7];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(8.067088058766343) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi) q[7];
h q[7];
cx q[0], q[7];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(8.314683530597964) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
h q[7];
h q[7];
cx q[1], q[7];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(8.599671986495572) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
h q[7];
h q[7];
cx q[2], q[7];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(-1.530068092178487) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
h q[7];
h q[7];
cx q[3], q[7];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3.273544624227162) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi) q[3];
h q[7];
h q[7];
cx q[4], q[7];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(-1.9704817270990471) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi) q[4];
h q[7];
h q[7];
cx q[5], q[7];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(-0.1727359054527371) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi) q[5];
h q[7];
h q[7];
cx q[6], q[7];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(2.929136522315455) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
h q[7];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(7.6108148648540235) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi) q[7];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7];
meas[0] = measure q[0];
meas[1] = measure q[1];
meas[2] = measure q[2];
meas[3] = measure q[3];
meas[4] = measure q[4];
meas[5] = measure q[5];
meas[6] = measure q[6];
meas[7] = measure q[7];
