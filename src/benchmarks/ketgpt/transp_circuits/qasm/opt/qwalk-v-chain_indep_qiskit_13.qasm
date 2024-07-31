OPENQASM 3.0;
include "stdgates.inc";
bit[13] meas;
qubit[7] node;
qubit[1] coin;
qubit[5] anc;
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
h anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[3], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
h anc[2];
h anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
cx node[4], anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
h anc[3];
h anc[4];
rz(pi/4) anc[4];
cx anc[3], anc[4];
rz(-pi/4) anc[4];
cx node[5], anc[4];
rz(pi/4) anc[4];
cx anc[3], anc[4];
rz(-pi/4) anc[4];
h anc[4];
cx anc[4], node[0];
rz(-pi/4) node[0];
cx node[6], node[0];
rz(pi/4) node[0];
cx anc[4], node[0];
rz(-pi/4) node[0];
cx node[6], node[0];
rz(pi/4) node[0];
rz(pi/4) anc[4];
cx node[6], anc[4];
rz(3*pi/2) node[6];
rz(-pi/4) anc[4];
cx node[6], anc[4];
h anc[4];
rz(pi/4) anc[4];
cx anc[3], anc[4];
rz(-pi/4) anc[4];
cx node[5], anc[4];
rz(pi/4) anc[4];
cx anc[3], anc[4];
h anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
cx node[4], anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
h anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[3], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
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
cx node[2], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[3], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[4], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
h anc[2];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
cx node[5], anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
h anc[3];
cx anc[3], node[1];
rz(-pi/4) node[1];
cx node[6], node[1];
rz(pi/4) node[1];
cx anc[3], node[1];
rz(-pi/4) node[1];
cx node[6], node[1];
rz(5*pi/4) node[1];
h node[1];
rz(pi/4) anc[3];
cx node[6], anc[3];
rz(-pi/4) anc[3];
cx node[6], anc[3];
h anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
cx node[5], anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
h anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[4], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[3], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
h anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
h node[2];
cx node[3], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[3], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[4], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[5], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
h anc[2];
cx anc[2], node[2];
rz(-pi/4) node[2];
cx node[6], node[2];
rz(pi/4) node[2];
cx anc[2], node[2];
rz(-pi/4) node[2];
cx node[6], node[2];
rz(5*pi/4) node[2];
h node[2];
rz(pi/4) anc[2];
cx node[6], anc[2];
rz(-pi/4) anc[2];
cx node[6], anc[2];
h anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[5], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[4], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
h anc[0];
rz(pi/4) anc[0];
cx node[3], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[3], anc[0];
h node[3];
cx node[4], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[4], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[5], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], node[3];
rz(-pi/4) node[3];
cx node[6], node[3];
rz(pi/4) node[3];
cx anc[1], node[3];
rz(-pi/4) node[3];
cx node[6], node[3];
rz(5*pi/4) node[3];
h node[3];
rz(pi/4) anc[1];
cx node[6], anc[1];
rz(-pi/4) anc[1];
cx node[6], anc[1];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[5], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
h anc[0];
rz(pi/4) anc[0];
cx node[4], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[4], anc[0];
h node[4];
cx node[5], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[5], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], node[4];
rz(-pi/4) node[4];
cx node[6], node[4];
rz(pi/4) node[4];
cx anc[0], node[4];
rz(-pi/4) node[4];
cx node[6], node[4];
rz(5*pi/4) node[4];
h node[4];
rz(pi/4) anc[0];
cx node[6], anc[0];
rz(-pi/4) anc[0];
cx node[6], anc[0];
h anc[0];
rz(pi/4) anc[0];
cx node[5], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[5], anc[0];
cx node[1], anc[0];
h node[5];
cx node[6], node[5];
rz(-pi/4) node[5];
cx coin[0], node[5];
rz(pi/4) node[5];
cx node[6], node[5];
rz(-pi/4) node[5];
cx coin[0], node[5];
rz(5*pi/4) node[5];
h node[5];
cx coin[0], node[6];
rz(-pi/4) node[6];
h node[6];
rz(pi) node[6];
h node[6];
rz(pi/4) coin[0];
h coin[0];
rz(pi) coin[0];
h coin[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[2], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[3], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
h anc[2];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
cx node[4], anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
h anc[3];
cx anc[3], anc[4];
rz(-pi/4) anc[4];
cx node[5], anc[4];
rz(pi/4) anc[4];
cx anc[3], anc[4];
rz(-pi/4) anc[4];
h anc[4];
cx anc[4], node[0];
rz(-pi/4) node[0];
cx node[6], node[0];
rz(pi/4) node[0];
cx anc[4], node[0];
rz(-pi/4) node[0];
cx node[6], node[0];
rz(pi/4) node[0];
rz(pi/4) anc[4];
cx node[6], anc[4];
rz(3*pi/2) node[6];
rz(-pi/4) anc[4];
cx node[6], anc[4];
h anc[4];
rz(pi/4) anc[4];
cx anc[3], anc[4];
rz(-pi/4) anc[4];
cx node[5], anc[4];
rz(pi/4) anc[4];
cx anc[3], anc[4];
h anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
cx node[4], anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
h anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[3], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
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
cx node[2], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[3], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[4], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
h anc[2];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
cx node[5], anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
h anc[3];
cx anc[3], node[1];
rz(-pi/4) node[1];
cx node[6], node[1];
rz(pi/4) node[1];
cx anc[3], node[1];
rz(-pi/4) node[1];
cx node[6], node[1];
rz(5*pi/4) node[1];
h node[1];
rz(pi/4) anc[3];
cx node[6], anc[3];
rz(-pi/4) anc[3];
cx node[6], anc[3];
h anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
cx node[5], anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
h anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[4], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[3], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
h anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
h node[2];
cx node[3], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[3], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[4], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[5], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
h anc[2];
cx anc[2], node[2];
rz(-pi/4) node[2];
cx node[6], node[2];
rz(pi/4) node[2];
cx anc[2], node[2];
rz(-pi/4) node[2];
cx node[6], node[2];
rz(5*pi/4) node[2];
h node[2];
rz(pi/4) anc[2];
cx node[6], anc[2];
rz(-pi/4) anc[2];
cx node[6], anc[2];
h anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[5], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[4], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
h anc[0];
rz(pi/4) anc[0];
cx node[3], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[3], anc[0];
h node[3];
cx node[4], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[4], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[5], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], node[3];
rz(-pi/4) node[3];
cx node[6], node[3];
rz(pi/4) node[3];
cx anc[1], node[3];
rz(-pi/4) node[3];
cx node[6], node[3];
rz(5*pi/4) node[3];
h node[3];
rz(pi/4) anc[1];
cx node[6], anc[1];
rz(-pi/4) anc[1];
cx node[6], anc[1];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[5], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
h anc[0];
rz(pi/4) anc[0];
cx node[4], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[4], anc[0];
h node[4];
cx node[5], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[5], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], node[4];
rz(-pi/4) node[4];
cx node[6], node[4];
rz(pi/4) node[4];
cx anc[0], node[4];
rz(-pi/4) node[4];
cx node[6], node[4];
rz(5*pi/4) node[4];
h node[4];
rz(pi/4) anc[0];
cx node[6], anc[0];
rz(-pi/4) anc[0];
cx node[6], anc[0];
h anc[0];
rz(pi/4) anc[0];
cx node[5], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[5], anc[0];
cx node[1], anc[0];
h node[5];
cx node[6], node[5];
rz(-pi/4) node[5];
cx coin[0], node[5];
rz(pi/4) node[5];
cx node[6], node[5];
rz(-pi/4) node[5];
cx coin[0], node[5];
rz(5*pi/4) node[5];
h node[5];
cx coin[0], node[6];
rz(-pi/4) node[6];
h node[6];
rz(pi) node[6];
h node[6];
rz(-7*pi/4) coin[0];
h coin[0];
rz(-3*pi/4) coin[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[2], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[3], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
h anc[2];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
cx node[4], anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
h anc[3];
cx anc[3], anc[4];
rz(-pi/4) anc[4];
cx node[5], anc[4];
rz(pi/4) anc[4];
cx anc[3], anc[4];
rz(-pi/4) anc[4];
h anc[4];
cx anc[4], node[0];
rz(-pi/4) node[0];
cx node[6], node[0];
rz(pi/4) node[0];
cx anc[4], node[0];
rz(-pi/4) node[0];
cx node[6], node[0];
rz(pi/4) node[0];
rz(pi/4) anc[4];
cx node[6], anc[4];
rz(3*pi/2) node[6];
rz(-pi/4) anc[4];
cx node[6], anc[4];
h anc[4];
rz(pi/4) anc[4];
cx anc[3], anc[4];
rz(-pi/4) anc[4];
cx node[5], anc[4];
rz(pi/4) anc[4];
cx anc[3], anc[4];
h anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
cx node[4], anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
h anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[3], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
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
cx node[2], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[3], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[4], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
h anc[2];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
cx node[5], anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
h anc[3];
cx anc[3], node[1];
rz(-pi/4) node[1];
cx node[6], node[1];
rz(pi/4) node[1];
cx anc[3], node[1];
rz(-pi/4) node[1];
cx node[6], node[1];
rz(5*pi/4) node[1];
h node[1];
rz(pi/4) anc[3];
cx node[6], anc[3];
rz(-pi/4) anc[3];
cx node[6], anc[3];
h anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
cx node[5], anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
h anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[4], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[3], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
h anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
h node[2];
cx node[3], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[3], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[4], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[5], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
h anc[2];
cx anc[2], node[2];
rz(-pi/4) node[2];
cx node[6], node[2];
rz(pi/4) node[2];
cx anc[2], node[2];
rz(-pi/4) node[2];
cx node[6], node[2];
rz(5*pi/4) node[2];
h node[2];
rz(pi/4) anc[2];
cx node[6], anc[2];
rz(-pi/4) anc[2];
cx node[6], anc[2];
h anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[5], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[4], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
h anc[0];
rz(pi/4) anc[0];
cx node[3], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[3], anc[0];
h node[3];
cx node[4], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[4], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[5], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], node[3];
rz(-pi/4) node[3];
cx node[6], node[3];
rz(pi/4) node[3];
cx anc[1], node[3];
rz(-pi/4) node[3];
cx node[6], node[3];
rz(5*pi/4) node[3];
h node[3];
rz(pi/4) anc[1];
cx node[6], anc[1];
rz(-pi/4) anc[1];
cx node[6], anc[1];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[5], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
h anc[0];
rz(pi/4) anc[0];
cx node[4], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[4], anc[0];
h node[4];
cx node[5], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[5], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], node[4];
rz(-pi/4) node[4];
cx node[6], node[4];
rz(pi/4) node[4];
cx anc[0], node[4];
rz(-pi/4) node[4];
cx node[6], node[4];
rz(5*pi/4) node[4];
h node[4];
rz(pi/4) anc[0];
cx node[6], anc[0];
rz(-pi/4) anc[0];
cx node[6], anc[0];
h anc[0];
rz(pi/4) anc[0];
cx node[5], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[5], anc[0];
cx node[1], anc[0];
h node[5];
cx node[6], node[5];
rz(-pi/4) node[5];
cx coin[0], node[5];
rz(pi/4) node[5];
cx node[6], node[5];
rz(-pi/4) node[5];
cx coin[0], node[5];
rz(5*pi/4) node[5];
h node[5];
cx coin[0], node[6];
rz(-pi/4) node[6];
h node[6];
rz(pi) node[6];
h node[6];
h coin[0];
rz(pi) coin[0];
h coin[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[2], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[3], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
h anc[2];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
cx node[4], anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
h anc[3];
cx anc[3], anc[4];
rz(-pi/4) anc[4];
cx node[5], anc[4];
rz(pi/4) anc[4];
cx anc[3], anc[4];
rz(-pi/4) anc[4];
h anc[4];
cx anc[4], node[0];
rz(-pi/4) node[0];
cx node[6], node[0];
rz(pi/4) node[0];
cx anc[4], node[0];
rz(-pi/4) node[0];
cx node[6], node[0];
rz(pi/4) node[0];
rz(pi/4) anc[4];
cx node[6], anc[4];
rz(3*pi/2) node[6];
rz(-pi/4) anc[4];
cx node[6], anc[4];
h anc[4];
rz(pi/4) anc[4];
cx anc[3], anc[4];
rz(-pi/4) anc[4];
cx node[5], anc[4];
rz(pi/4) anc[4];
cx anc[3], anc[4];
h anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
cx node[4], anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
h anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[3], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
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
cx node[2], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[3], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[4], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
h anc[2];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
cx node[5], anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
h anc[3];
cx anc[3], node[1];
rz(-pi/4) node[1];
cx node[6], node[1];
rz(pi/4) node[1];
cx anc[3], node[1];
rz(-pi/4) node[1];
cx node[6], node[1];
rz(5*pi/4) node[1];
h node[1];
rz(pi/4) anc[3];
cx node[6], anc[3];
rz(-pi/4) anc[3];
cx node[6], anc[3];
h anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
cx node[5], anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
h anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[4], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[3], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
h anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
h node[2];
cx node[3], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[3], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[4], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[5], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
h anc[2];
cx anc[2], node[2];
rz(-pi/4) node[2];
cx node[6], node[2];
rz(pi/4) node[2];
cx anc[2], node[2];
rz(-pi/4) node[2];
cx node[6], node[2];
rz(5*pi/4) node[2];
h node[2];
rz(pi/4) anc[2];
cx node[6], anc[2];
rz(-pi/4) anc[2];
cx node[6], anc[2];
h anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[5], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[4], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
h anc[0];
rz(pi/4) anc[0];
cx node[3], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[3], anc[0];
h node[3];
cx node[4], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[4], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[5], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], node[3];
rz(-pi/4) node[3];
cx node[6], node[3];
rz(pi/4) node[3];
cx anc[1], node[3];
rz(-pi/4) node[3];
cx node[6], node[3];
rz(5*pi/4) node[3];
h node[3];
rz(pi/4) anc[1];
cx node[6], anc[1];
rz(-pi/4) anc[1];
cx node[6], anc[1];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[5], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
h anc[0];
rz(pi/4) anc[0];
cx node[4], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[4], anc[0];
h node[4];
cx node[5], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[5], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], node[4];
rz(-pi/4) node[4];
cx node[6], node[4];
rz(pi/4) node[4];
cx anc[0], node[4];
rz(-pi/4) node[4];
cx node[6], node[4];
rz(5*pi/4) node[4];
h node[4];
rz(pi/4) anc[0];
cx node[6], anc[0];
rz(-pi/4) anc[0];
cx node[6], anc[0];
h anc[0];
rz(pi/4) anc[0];
cx node[5], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[5], anc[0];
cx node[1], anc[0];
h node[5];
cx node[6], node[5];
rz(-pi/4) node[5];
cx coin[0], node[5];
rz(pi/4) node[5];
cx node[6], node[5];
rz(-pi/4) node[5];
cx coin[0], node[5];
rz(5*pi/4) node[5];
h node[5];
cx coin[0], node[6];
rz(-pi/4) node[6];
h node[6];
rz(pi) node[6];
h node[6];
rz(-7*pi/4) coin[0];
h coin[0];
rz(-3*pi/4) coin[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[2], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[3], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
h anc[2];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
cx node[4], anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
h anc[3];
cx anc[3], anc[4];
rz(-pi/4) anc[4];
cx node[5], anc[4];
rz(pi/4) anc[4];
cx anc[3], anc[4];
rz(-pi/4) anc[4];
h anc[4];
cx anc[4], node[0];
rz(-pi/4) node[0];
cx node[6], node[0];
rz(pi/4) node[0];
cx anc[4], node[0];
rz(-pi/4) node[0];
cx node[6], node[0];
rz(pi/4) node[0];
rz(pi/4) anc[4];
cx node[6], anc[4];
rz(3*pi/2) node[6];
rz(-pi/4) anc[4];
cx node[6], anc[4];
h anc[4];
rz(pi/4) anc[4];
cx anc[3], anc[4];
rz(-pi/4) anc[4];
cx node[5], anc[4];
rz(pi/4) anc[4];
cx anc[3], anc[4];
h anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
cx node[4], anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
h anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[3], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
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
cx node[2], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[3], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[4], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
h anc[2];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
cx node[5], anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
h anc[3];
cx anc[3], node[1];
rz(-pi/4) node[1];
cx node[6], node[1];
rz(pi/4) node[1];
cx anc[3], node[1];
rz(-pi/4) node[1];
cx node[6], node[1];
rz(5*pi/4) node[1];
h node[1];
rz(pi/4) anc[3];
cx node[6], anc[3];
rz(-pi/4) anc[3];
cx node[6], anc[3];
h anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
cx node[5], anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
h anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[4], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[3], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
h anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
h node[2];
cx node[3], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[3], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[4], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[5], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
h anc[2];
cx anc[2], node[2];
rz(-pi/4) node[2];
cx node[6], node[2];
rz(pi/4) node[2];
cx anc[2], node[2];
rz(-pi/4) node[2];
cx node[6], node[2];
rz(5*pi/4) node[2];
h node[2];
rz(pi/4) anc[2];
cx node[6], anc[2];
rz(-pi/4) anc[2];
cx node[6], anc[2];
h anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[5], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[4], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
h anc[0];
rz(pi/4) anc[0];
cx node[3], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[3], anc[0];
h node[3];
cx node[4], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[4], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[5], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], node[3];
rz(-pi/4) node[3];
cx node[6], node[3];
rz(pi/4) node[3];
cx anc[1], node[3];
rz(-pi/4) node[3];
cx node[6], node[3];
rz(5*pi/4) node[3];
h node[3];
rz(pi/4) anc[1];
cx node[6], anc[1];
rz(-pi/4) anc[1];
cx node[6], anc[1];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[5], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
h anc[0];
rz(pi/4) anc[0];
cx node[4], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[4], anc[0];
h node[4];
cx node[5], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[5], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], node[4];
rz(-pi/4) node[4];
cx node[6], node[4];
rz(pi/4) node[4];
cx anc[0], node[4];
rz(-pi/4) node[4];
cx node[6], node[4];
rz(5*pi/4) node[4];
h node[4];
rz(pi/4) anc[0];
cx node[6], anc[0];
rz(-pi/4) anc[0];
cx node[6], anc[0];
h anc[0];
rz(pi/4) anc[0];
cx node[5], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[5], anc[0];
cx node[1], anc[0];
h node[5];
cx node[6], node[5];
rz(-pi/4) node[5];
cx coin[0], node[5];
rz(pi/4) node[5];
cx node[6], node[5];
rz(-pi/4) node[5];
cx coin[0], node[5];
rz(5*pi/4) node[5];
h node[5];
cx coin[0], node[6];
rz(-pi/4) node[6];
h node[6];
rz(pi) node[6];
h node[6];
h coin[0];
rz(pi) coin[0];
h coin[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[1], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[2], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[3], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
h anc[2];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
cx node[4], anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
h anc[3];
cx anc[3], anc[4];
rz(-pi/4) anc[4];
cx node[5], anc[4];
rz(pi/4) anc[4];
cx anc[3], anc[4];
rz(-pi/4) anc[4];
h anc[4];
cx anc[4], node[0];
rz(-pi/4) node[0];
cx node[6], node[0];
rz(pi/4) node[0];
cx anc[4], node[0];
rz(-pi/4) node[0];
cx node[6], node[0];
rz(pi/4) node[0];
h node[0];
rz(pi/4) anc[4];
cx node[6], anc[4];
rz(3*pi/2) node[6];
rz(-pi/4) anc[4];
cx node[6], anc[4];
h anc[4];
rz(pi/4) anc[4];
cx anc[3], anc[4];
rz(-pi/4) anc[4];
cx node[5], anc[4];
rz(pi/4) anc[4];
cx anc[3], anc[4];
h anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
cx node[4], anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
h anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[3], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
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
cx node[2], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[3], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[4], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
h anc[2];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
cx node[5], anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
h anc[3];
cx anc[3], node[1];
rz(-pi/4) node[1];
cx node[6], node[1];
rz(pi/4) node[1];
cx anc[3], node[1];
rz(-pi/4) node[1];
cx node[6], node[1];
rz(5*pi/4) node[1];
h node[1];
rz(pi/4) anc[3];
cx node[6], anc[3];
rz(-pi/4) anc[3];
cx node[6], anc[3];
h anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
rz(-pi/4) anc[3];
cx node[5], anc[3];
rz(pi/4) anc[3];
cx anc[2], anc[3];
h anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[4], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[3], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
h anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[2], anc[0];
h node[2];
cx node[3], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[3], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[4], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[5], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
h anc[2];
cx anc[2], node[2];
rz(-pi/4) node[2];
cx node[6], node[2];
rz(pi/4) node[2];
cx anc[2], node[2];
rz(-pi/4) node[2];
cx node[6], node[2];
rz(5*pi/4) node[2];
h node[2];
rz(pi/4) anc[2];
cx node[6], anc[2];
rz(-pi/4) anc[2];
cx node[6], anc[2];
h anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
rz(-pi/4) anc[2];
cx node[5], anc[2];
rz(pi/4) anc[2];
cx anc[1], anc[2];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[4], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
h anc[0];
rz(pi/4) anc[0];
cx node[3], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[3], anc[0];
h node[3];
cx node[4], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[4], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[5], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
h anc[1];
cx anc[1], node[3];
rz(-pi/4) node[3];
cx node[6], node[3];
rz(pi/4) node[3];
cx anc[1], node[3];
rz(-pi/4) node[3];
cx node[6], node[3];
rz(5*pi/4) node[3];
h node[3];
rz(pi/4) anc[1];
cx node[6], anc[1];
rz(-pi/4) anc[1];
cx node[6], anc[1];
h anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
rz(-pi/4) anc[1];
cx node[5], anc[1];
rz(pi/4) anc[1];
cx anc[0], anc[1];
h anc[0];
rz(pi/4) anc[0];
cx node[4], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[4], anc[0];
h node[4];
cx node[5], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[5], anc[0];
rz(-pi/4) anc[0];
h anc[0];
cx anc[0], node[4];
rz(-pi/4) node[4];
cx node[6], node[4];
rz(pi/4) node[4];
cx anc[0], node[4];
rz(-pi/4) node[4];
cx node[6], node[4];
rz(5*pi/4) node[4];
h node[4];
rz(pi/4) anc[0];
cx node[6], anc[0];
rz(-pi/4) anc[0];
cx node[6], anc[0];
h anc[0];
rz(pi/4) anc[0];
cx node[5], anc[0];
rz(-pi/4) anc[0];
cx coin[0], anc[0];
rz(pi/4) anc[0];
cx node[5], anc[0];
h node[5];
cx node[6], node[5];
rz(-pi/4) node[5];
cx coin[0], node[5];
rz(pi/4) node[5];
cx node[6], node[5];
rz(-pi/4) node[5];
cx coin[0], node[5];
rz(5*pi/4) node[5];
h node[5];
cx coin[0], node[6];
rz(-pi/4) node[6];
h node[6];
rz(pi) node[6];
h node[6];
rz(pi/4) coin[0];
h coin[0];
rz(pi) coin[0];
h coin[0];
rz(-pi/4) anc[0];
h anc[0];
rz(-pi/4) anc[1];
h anc[1];
rz(-pi/4) anc[2];
h anc[2];
rz(-pi/4) anc[3];
h anc[3];
rz(-pi/4) anc[4];
h anc[4];
barrier node[0], node[1], node[2], node[3], node[4], node[5], node[6], coin[0], anc[0], anc[1], anc[2], anc[3], anc[4];
meas[0] = measure node[0];
meas[1] = measure node[1];
meas[2] = measure node[2];
meas[3] = measure node[3];
meas[4] = measure node[4];
meas[5] = measure node[5];
meas[6] = measure node[6];
meas[7] = measure coin[0];
meas[8] = measure anc[0];
meas[9] = measure anc[1];
meas[10] = measure anc[2];
meas[11] = measure anc[3];
meas[12] = measure anc[4];