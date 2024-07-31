OPENQASM 3.0;
include "stdgates.inc";
bit[6] meas;
qubit[6] q;
rz(-pi/2) q[0];
h q[0];
rz(-0.035446076730125675) q[0];
h q[0];
rz(-pi/2) q[1];
h q[1];
rz(5.200881073367849) q[1];
h q[1];
rz(5*pi/2) q[1];
h q[1];
cx q[0], q[1];
h q[1];
rz(-pi/2) q[2];
h q[2];
rz(3.6437263688042894) q[2];
h q[2];
rz(5*pi/2) q[2];
h q[2];
cx q[0], q[2];
cx q[1], q[2];
h q[2];
rz(-pi/2) q[3];
h q[3];
rz(-3.482974630623) q[3];
h q[3];
rz(5*pi/2) q[3];
h q[3];
cx q[0], q[3];
cx q[1], q[3];
cx q[2], q[3];
h q[3];
rz(-pi/2) q[4];
h q[4];
rz(5.33240988132262) q[4];
h q[4];
rz(5*pi/2) q[4];
h q[4];
cx q[0], q[4];
cx q[1], q[4];
cx q[2], q[4];
cx q[3], q[4];
h q[4];
rz(-pi/2) q[5];
h q[5];
rz(5.08196583192146) q[5];
h q[5];
rz(5*pi/2) q[5];
h q[5];
cx q[0], q[5];
h q[0];
rz(-0.27254570249655785) q[0];
h q[0];
cx q[1], q[5];
rz(-pi/2) q[1];
h q[1];
rz(-4.48856076236235) q[1];
h q[1];
rz(5*pi/2) q[1];
h q[1];
cx q[0], q[1];
h q[1];
cx q[2], q[5];
rz(-pi/2) q[2];
h q[2];
rz(-2.58037806665168) q[2];
h q[2];
rz(5*pi/2) q[2];
h q[2];
cx q[0], q[2];
cx q[1], q[2];
h q[2];
cx q[3], q[5];
rz(-pi/2) q[3];
h q[3];
rz(6.184468781837939) q[3];
h q[3];
rz(5*pi/2) q[3];
h q[3];
cx q[0], q[3];
cx q[1], q[3];
cx q[2], q[3];
h q[3];
cx q[4], q[5];
rz(-pi/2) q[4];
h q[4];
rz(3.2619780216543806) q[4];
h q[4];
rz(5*pi/2) q[4];
h q[4];
cx q[0], q[4];
cx q[1], q[4];
cx q[2], q[4];
cx q[3], q[4];
h q[4];
h q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-2.96563837313116) q[5];
h q[5];
rz(5*pi/2) q[5];
h q[5];
cx q[0], q[5];
h q[0];
rz(-2.05271224875749) q[0];
h q[0];
cx q[1], q[5];
rz(-pi/2) q[1];
h q[1];
rz(-3.08121124875778) q[1];
h q[1];
rz(5*pi/2) q[1];
h q[1];
cx q[0], q[1];
h q[1];
cx q[2], q[5];
rz(-pi/2) q[2];
h q[2];
rz(-0.9771085611682531) q[2];
h q[2];
rz(5*pi/2) q[2];
h q[2];
cx q[0], q[2];
cx q[1], q[2];
h q[2];
cx q[3], q[5];
rz(-pi/2) q[3];
h q[3];
rz(0.08059949941286781) q[3];
h q[3];
rz(5*pi/2) q[3];
h q[3];
cx q[0], q[3];
cx q[1], q[3];
cx q[2], q[3];
h q[3];
cx q[4], q[5];
rz(-pi/2) q[4];
h q[4];
rz(3.3377637163725904) q[4];
h q[4];
rz(5*pi/2) q[4];
h q[4];
cx q[0], q[4];
cx q[1], q[4];
cx q[2], q[4];
cx q[3], q[4];
h q[4];
h q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(0.670469032209029) q[5];
h q[5];
rz(5*pi/2) q[5];
h q[5];
cx q[0], q[5];
h q[0];
rz(0.039419161311886164) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[5];
rz(-pi/2) q[1];
h q[1];
rz(-4.7720163097634) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[5];
rz(-pi/2) q[2];
h q[2];
rz(-4.04351000957572) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[3], q[5];
rz(-pi/2) q[3];
h q[3];
rz(-1.11269780613378) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[4], q[5];
rz(-pi/2) q[4];
h q[4];
rz(5.416911389540761) q[4];
h q[4];
rz(5*pi/2) q[4];
h q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(5.26213106161665) q[5];
h q[5];
rz(5*pi/2) q[5];
barrier q[0], q[1], q[2], q[3], q[4], q[5];
meas[0] = measure q[0];
meas[1] = measure q[1];
meas[2] = measure q[2];
meas[3] = measure q[3];
meas[4] = measure q[4];
meas[5] = measure q[5];