OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;
qubit[1] psi;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h psi[0];
rz(pi) psi[0];
h psi[0];
rz(7*pi/16) psi[0];
cx psi[0], q[0];
rz(7*pi/16) q[0];
cx psi[0], q[0];
rz(-7*pi/16) q[0];
cx q[0], q[4];
cx q[4], q[0];
cx q[0], q[4];
h q[0];
rz(-1.4726215563702154) q[4];
cx psi[0], q[1];
rz(-pi/8) q[1];
cx psi[0], q[1];
rz(pi/8) q[1];
cx psi[0], q[2];
rz(-pi/4) q[2];
cx psi[0], q[2];
rz(-pi/8) q[2];
cx psi[0], q[3];
rz(-pi/2) q[3];
cx psi[0], q[3];
rz(pi/2) q[3];
cx q[1], q[3];
cx q[3], q[1];
cx q[1], q[3];
rz(-pi/4) q[1];
cx q[1], q[0];
rz(pi/4) q[0];
cx q[1], q[0];
rz(-pi/4) q[0];
h q[1];
cx q[2], q[0];
rz(pi/8) q[0];
cx q[2], q[0];
rz(-pi/8) q[0];
cx q[2], q[1];
rz(pi/4) q[1];
cx q[2], q[1];
rz(-pi/4) q[1];
h q[2];
rz(-7*pi/16) q[3];
cx q[3], q[0];
rz(pi/16) q[0];
cx q[3], q[0];
rz(-pi/16) q[0];
cx q[3], q[1];
rz(pi/8) q[1];
cx q[3], q[1];
rz(-pi/8) q[1];
cx q[3], q[2];
rz(pi/4) q[2];
cx q[3], q[2];
rz(-pi/4) q[2];
h q[3];
cx q[4], q[0];
rz(pi/32) q[0];
cx q[4], q[0];
rz(-pi/32) q[0];
cx q[4], q[1];
rz(pi/16) q[1];
cx q[4], q[1];
rz(-pi/16) q[1];
cx q[4], q[2];
rz(pi/8) q[2];
cx q[4], q[2];
rz(-pi/8) q[2];
cx q[4], q[3];
rz(pi/4) q[3];
cx q[4], q[3];
rz(-pi/4) q[3];
h q[4];
barrier q[0], q[1], q[2], q[3], q[4], psi[0];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];