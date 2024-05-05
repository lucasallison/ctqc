OPENQASM 3.0;
include "stdgates.inc";
bit[7] meas;
qubit[4] node;
qubit[1] coin;
qubit[2] anc;
h node[0];
h coin[0];
h anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
rz(-pi/4) anc[0];
h anc[0];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[2], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], node[0];
rz(-pi/4) node[0];
cx node[3], node[0];
rz(pi/4) node[0];
cx anc[1], node[0];
rz(-pi/4) node[0];
cx node[3], node[0];
rz(pi/4) node[0];
h node[0];
h node[0];
rz(pi/4) anc[1];
cx node[3], anc[1];
rz(pi/4) node[3];
rz(-pi/4) anc[1];
cx node[3], anc[1];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[2], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
h anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
h node[1];
rz(-pi/4) anc[0];
h anc[0];
h anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], node[1];
rz(-pi/4) node[1];
cx node[3], node[1];
rz(pi/4) node[1];
cx anc[0], node[1];
rz(-pi/4) node[1];
cx node[3], node[1];
rz(pi/4) node[1];
h node[1];
h node[1];
s node[1];
s node[1];
h node[1];
rz(pi/4) anc[0];
cx node[3], anc[0];
rz(pi/4) node[3];
rz(-pi/4) anc[0];
cx node[3], anc[0];
h anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
h node[2];
cx node[3], node[2];
rz(-pi/4) node[2];
cx coin[0], node[2];
rz(pi/4) node[2];
cx node[3], node[2];
rz(-pi/4) node[2];
rz(pi/4) node[3];
cx coin[0], node[2];
rz(pi/4) node[2];
h node[2];
h node[2];
s node[2];
s node[2];
h node[2];
cx coin[0], node[3];
rz(-pi/4) node[3];
rz(pi/4) coin[0];
cx coin[0], node[3];
cx coin[0], node[3];
h node[3];
s node[3];
s node[3];
h node[3];
h coin[0];
s coin[0];
s coin[0];
h coin[0];
rz(-pi/4) anc[0];
h anc[0];
h anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
rz(-pi/4) anc[0];
h anc[0];
rz(-pi/4) anc[1];
h anc[1];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[2], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], node[0];
rz(-pi/4) node[0];
cx node[3], node[0];
rz(pi/4) node[0];
cx anc[1], node[0];
rz(-pi/4) node[0];
cx node[3], node[0];
rz(pi/4) node[0];
h node[0];
h node[0];
rz(pi/4) anc[1];
cx node[3], anc[1];
rz(pi/4) node[3];
rz(-pi/4) anc[1];
cx node[3], anc[1];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[2], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
h anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
h node[1];
rz(-pi/4) anc[0];
h anc[0];
h anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], node[1];
rz(-pi/4) node[1];
cx node[3], node[1];
rz(pi/4) node[1];
cx anc[0], node[1];
rz(-pi/4) node[1];
cx node[3], node[1];
rz(pi/4) node[1];
h node[1];
h node[1];
s node[1];
s node[1];
h node[1];
rz(pi/4) anc[0];
cx node[3], anc[0];
rz(pi/4) node[3];
rz(-pi/4) anc[0];
cx node[3], anc[0];
h anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
h node[2];
cx node[3], node[2];
rz(-pi/4) node[2];
cx coin[0], node[2];
rz(pi/4) node[2];
cx node[3], node[2];
rz(-pi/4) node[2];
rz(pi/4) node[3];
cx coin[0], node[2];
rz(pi/4) node[2];
h node[2];
h node[2];
s node[2];
s node[2];
h node[2];
cx coin[0], node[3];
rz(-pi/4) node[3];
rz(pi/4) coin[0];
cx coin[0], node[3];
cx coin[0], node[3];
h node[3];
s node[3];
s node[3];
h node[3];
rz(-3*pi/2) coin[0];
rz(-pi/2) coin[0];
h coin[0];
rz(-pi/2) coin[0];
rz(-pi/2) coin[0];
rz(-pi/4) anc[0];
h anc[0];
h anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
rz(-pi/4) anc[0];
h anc[0];
rz(-pi/4) anc[1];
h anc[1];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[2], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], node[0];
rz(-pi/4) node[0];
cx node[3], node[0];
rz(pi/4) node[0];
cx anc[1], node[0];
rz(-pi/4) node[0];
cx node[3], node[0];
rz(pi/4) node[0];
h node[0];
h node[0];
rz(pi/4) anc[1];
cx node[3], anc[1];
rz(pi/4) node[3];
rz(-pi/4) anc[1];
cx node[3], anc[1];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[2], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
h anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
h node[1];
rz(-pi/4) anc[0];
h anc[0];
h anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], node[1];
rz(-pi/4) node[1];
cx node[3], node[1];
rz(pi/4) node[1];
cx anc[0], node[1];
rz(-pi/4) node[1];
cx node[3], node[1];
rz(pi/4) node[1];
h node[1];
h node[1];
s node[1];
s node[1];
h node[1];
rz(pi/4) anc[0];
cx node[3], anc[0];
rz(pi/4) node[3];
rz(-pi/4) anc[0];
cx node[3], anc[0];
h anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
h node[2];
cx node[3], node[2];
rz(-pi/4) node[2];
cx coin[0], node[2];
rz(pi/4) node[2];
cx node[3], node[2];
rz(-pi/4) node[2];
rz(pi/4) node[3];
cx coin[0], node[2];
rz(pi/4) node[2];
h node[2];
h node[2];
s node[2];
s node[2];
h node[2];
cx coin[0], node[3];
rz(-pi/4) node[3];
rz(pi/4) coin[0];
cx coin[0], node[3];
cx coin[0], node[3];
h node[3];
s node[3];
s node[3];
h node[3];
h coin[0];
s coin[0];
s coin[0];
h coin[0];
rz(-pi/4) anc[0];
h anc[0];
h anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
rz(-pi/4) anc[0];
h anc[0];
rz(-pi/4) anc[1];
h anc[1];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[2], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], node[0];
rz(-pi/4) node[0];
cx node[3], node[0];
rz(pi/4) node[0];
cx anc[1], node[0];
rz(-pi/4) node[0];
cx node[3], node[0];
rz(pi/4) node[0];
h node[0];
h node[0];
rz(pi/4) anc[1];
cx node[3], anc[1];
rz(pi/4) node[3];
rz(-pi/4) anc[1];
cx node[3], anc[1];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[2], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
h anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
h node[1];
rz(-pi/4) anc[0];
h anc[0];
h anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], node[1];
rz(-pi/4) node[1];
cx node[3], node[1];
rz(pi/4) node[1];
cx anc[0], node[1];
rz(-pi/4) node[1];
cx node[3], node[1];
rz(pi/4) node[1];
h node[1];
h node[1];
s node[1];
s node[1];
h node[1];
rz(pi/4) anc[0];
cx node[3], anc[0];
rz(pi/4) node[3];
rz(-pi/4) anc[0];
cx node[3], anc[0];
h anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
h node[2];
cx node[3], node[2];
rz(-pi/4) node[2];
cx coin[0], node[2];
rz(pi/4) node[2];
cx node[3], node[2];
rz(-pi/4) node[2];
rz(pi/4) node[3];
cx coin[0], node[2];
rz(pi/4) node[2];
h node[2];
h node[2];
s node[2];
s node[2];
h node[2];
cx coin[0], node[3];
rz(-pi/4) node[3];
rz(pi/4) coin[0];
cx coin[0], node[3];
cx coin[0], node[3];
h node[3];
s node[3];
s node[3];
h node[3];
rz(-3*pi/2) coin[0];
rz(-pi/2) coin[0];
h coin[0];
rz(-pi/2) coin[0];
rz(-pi/2) coin[0];
rz(-pi/4) anc[0];
h anc[0];
h anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
rz(-pi/4) anc[0];
h anc[0];
rz(-pi/4) anc[1];
h anc[1];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[2], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], node[0];
rz(-pi/4) node[0];
cx node[3], node[0];
rz(pi/4) node[0];
cx anc[1], node[0];
rz(-pi/4) node[0];
cx node[3], node[0];
rz(pi/4) node[0];
h node[0];
h node[0];
rz(pi/4) anc[1];
cx node[3], anc[1];
rz(pi/4) node[3];
rz(-pi/4) anc[1];
cx node[3], anc[1];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[2], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
h anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
h node[1];
rz(-pi/4) anc[0];
h anc[0];
h anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], node[1];
rz(-pi/4) node[1];
cx node[3], node[1];
rz(pi/4) node[1];
cx anc[0], node[1];
rz(-pi/4) node[1];
cx node[3], node[1];
rz(pi/4) node[1];
h node[1];
h node[1];
s node[1];
s node[1];
h node[1];
rz(pi/4) anc[0];
cx node[3], anc[0];
rz(pi/4) node[3];
rz(-pi/4) anc[0];
cx node[3], anc[0];
h anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
h node[2];
cx node[3], node[2];
rz(-pi/4) node[2];
cx coin[0], node[2];
rz(pi/4) node[2];
cx node[3], node[2];
rz(-pi/4) node[2];
rz(pi/4) node[3];
cx coin[0], node[2];
rz(pi/4) node[2];
h node[2];
h node[2];
s node[2];
s node[2];
h node[2];
cx coin[0], node[3];
rz(-pi/4) node[3];
rz(pi/4) coin[0];
cx coin[0], node[3];
cx coin[0], node[3];
h node[3];
s node[3];
s node[3];
h node[3];
h coin[0];
s coin[0];
s coin[0];
h coin[0];
rz(-pi/4) anc[0];
h anc[0];
h anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
rz(-pi/4) anc[0];
h anc[0];
rz(-pi/4) anc[1];
h anc[1];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[2], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], node[0];
rz(-pi/4) node[0];
cx node[3], node[0];
rz(pi/4) node[0];
cx anc[1], node[0];
rz(-pi/4) node[0];
cx node[3], node[0];
rz(pi/4) node[0];
h node[0];
rz(pi/4) anc[1];
cx node[3], anc[1];
rz(pi/4) node[3];
rz(-pi/4) anc[1];
cx node[3], anc[1];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[2], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
h anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
h node[1];
rz(-pi/4) anc[0];
h anc[0];
h anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], node[1];
rz(-pi/4) node[1];
cx node[3], node[1];
rz(pi/4) node[1];
cx anc[0], node[1];
rz(-pi/4) node[1];
cx node[3], node[1];
rz(pi/4) node[1];
h node[1];
h node[1];
s node[1];
s node[1];
h node[1];
rz(pi/4) anc[0];
cx node[3], anc[0];
rz(pi/4) node[3];
rz(-pi/4) anc[0];
cx node[3], anc[0];
h anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
h node[2];
cx node[3], node[2];
rz(-pi/4) node[2];
cx coin[0], node[2];
rz(pi/4) node[2];
cx node[3], node[2];
rz(-pi/4) node[2];
rz(pi/4) node[3];
cx coin[0], node[2];
rz(pi/4) node[2];
h node[2];
h node[2];
s node[2];
s node[2];
h node[2];
cx coin[0], node[3];
rz(-pi/4) node[3];
rz(pi/4) coin[0];
cx coin[0], node[3];
cx coin[0], node[3];
h node[3];
s node[3];
s node[3];
h node[3];
h coin[0];
s coin[0];
s coin[0];
h coin[0];
rz(-pi/4) anc[0];
h anc[0];
rz(-pi/4) anc[1];
h anc[1];
barrier node[0], node[1], node[2], node[3], coin[0], anc[0], anc[1];
meas[0] = measure node[0];
meas[1] = measure node[1];
meas[2] = measure node[2];
meas[3] = measure node[3];
meas[4] = measure coin[0];
meas[5] = measure anc[0];
meas[6] = measure anc[1];