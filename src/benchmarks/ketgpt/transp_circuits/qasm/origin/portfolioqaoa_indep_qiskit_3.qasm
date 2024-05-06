OPENQASM 3.0;
include "stdgates.inc";
bit[3] meas;
bit[3] meas0;
qubit[3] q;
rz(-3*pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.6072338763194534) q[0];
rz(-3*pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.6036928697010975) q[1];
cx q[0], q[1];
rz(4.249961923303923) q[1];
cx q[0], q[1];
rz(-3*pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3.807854493745956) q[2];
cx q[0], q[2];
rz(4.249912977007575) q[2];
cx q[0], q[2];
rz(pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(4.670128941318457) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(11.371643554921276) q[0];
cx q[1], q[2];
rz(4.251020867204194) q[2];
cx q[1], q[2];
rz(pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(4.670128941318457) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(11.36933761701945) q[1];
cx q[0], q[1];
rz(2.7676164821208684) q[1];
cx q[0], q[1];
rz(pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(4.670128941318457) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(11.502289649512921) q[2];
cx q[0], q[2];
rz(2.767584607817297) q[2];
cx q[0], q[2];
rz(pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(5.561243127133501) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(8.161023383266809) q[0];
cx q[1], q[2];
rz(2.7683060766736958) q[2];
cx q[1], q[2];
rz(pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(5.561243127133501) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(8.156040378601045) q[1];
cx q[0], q[1];
rz(5.980666622696558) q[1];
cx q[0], q[1];
rz(pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(5.561243127133501) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(8.44334239038269) q[2];
cx q[0], q[2];
rz(5.98059774408396) q[2];
cx q[0], q[2];
rz(pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(-4.663326296247037) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(5*pi/2) q[0];
cx q[1], q[2];
rz(5.982156798503766) q[2];
cx q[1], q[2];
rz(pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(-4.663326296247037) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(5*pi/2) q[1];
rz(pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(-4.663326296247037) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(5*pi/2) q[2];
barrier q[0], q[1], q[2];
meas[0] = measure q[0];
meas[1] = measure q[1];
meas[2] = measure q[2];
barrier q[0], q[1], q[2];
meas0[0] = measure q[0];
meas0[1] = measure q[1];
meas0[2] = measure q[2];