OPENQASM 3.0;
include "stdgates.inc";
bit[2] meas;
qubit[1] q;
qubit[1] flag;
h q[0];
h flag[0];
rz(pi) flag[0];
h flag[0];
barrier q[0], flag[0];
meas[0] = measure q[0];
meas[1] = measure flag[0];
