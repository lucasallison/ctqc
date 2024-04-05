OPENQASM 2.0;
include "qelib1.inc";
qreg a[3];
creg c[3];
h a[0];
s a[0];
s a[0];
h a[0];
h a[1];
s a[1];
s a[1];
h a[1];
h a[2];
cx a[1],a[2];
rz(-pi/4) a[2];
cx a[0],a[2];
rz(pi/4) a[2];
cx a[1],a[2];
rz(-pi/4) a[1];
rz(-pi/4) a[2];
cx a[0],a[2];
cx a[0],a[1];
rz(-pi/4) a[1];
cx a[0],a[1];
rz(pi/4) a[0];
s a[1];
rz(pi/4) a[2];
h a[2];
measure a[0] -> c[0];
measure a[1] -> c[1];
measure a[2] -> c[2];