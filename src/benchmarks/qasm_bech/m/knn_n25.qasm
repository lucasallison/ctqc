OPENQASM 2.0;
include "qelib1.inc";
qreg q0[25];
creg c0[1];
ry(0.93346815) q0[1];
ry(0.82988213) q0[2];
ry(1.181111) q0[3];
ry(1.802503) q0[4];
ry(2.969805) q0[5];
ry(1.5765553) q0[6];
ry(1.8340893) q0[7];
ry(2.741925) q0[8];
ry(1.5106361) q0[9];
ry(0.76354036) q0[10];
ry(0.15484631) q0[11];
ry(1.9311432) q0[12];
ry(0.69057517) q0[13];
ry(0.74294505) q0[14];
ry(0.79338648) q0[15];
ry(1.9075145) q0[16];
ry(2.5852457) q0[17];
ry(1.5388629) q0[18];
ry(0.8484669) q0[19];
ry(1.9789905) q0[20];
ry(1.177473) q0[21];
ry(0.46112786) q0[22];
ry(0.17065064) q0[23];
ry(1.8262873) q0[24];
h q0[0];
cswap q0[0],q0[1],q0[13];
cswap q0[0],q0[2],q0[14];
cswap q0[0],q0[3],q0[15];
cswap q0[0],q0[4],q0[16];
cswap q0[0],q0[5],q0[17];
cswap q0[0],q0[6],q0[18];
cswap q0[0],q0[7],q0[19];
cswap q0[0],q0[8],q0[20];
cswap q0[0],q0[9],q0[21];
cswap q0[0],q0[10],q0[22];
cswap q0[0],q0[11],q0[23];
cswap q0[0],q0[12],q0[24];
h q0[0];
measure q0[0] -> c0[0];
