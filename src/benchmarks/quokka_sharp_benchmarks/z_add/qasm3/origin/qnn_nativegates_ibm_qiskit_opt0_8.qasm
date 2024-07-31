OPENQASM 3.0;
include "stdgates.inc";
qubit[8] q;
rz(pi/2) q[0];
rz(pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(5*pi/2) q[0];
rz(pi/2) q[0];
rz(2.0) q[0];
rz(pi/2) q[1];
rz(pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(5*pi/2) q[1];
rz(pi/2) q[1];
rz(2.0) q[1];
cx q[0], q[1];
rz(9.172838187819544) q[1];
cx q[0], q[1];
rz(pi/2) q[2];
rz(pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(5*pi/2) q[2];
rz(pi/2) q[2];
rz(2.0) q[2];
cx q[0], q[2];
rz(9.172838187819544) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(9.172838187819544) q[2];
cx q[1], q[2];
rz(pi/2) q[3];
rz(pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(5*pi/2) q[3];
rz(pi/2) q[3];
rz(2.0) q[3];
cx q[0], q[3];
rz(9.172838187819544) q[3];
cx q[0], q[3];
cx q[1], q[3];
rz(9.172838187819544) q[3];
cx q[1], q[3];
cx q[2], q[3];
rz(9.172838187819544) q[3];
cx q[2], q[3];
rz(pi/2) q[4];
rz(pi/2) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi/2) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(5*pi/2) q[4];
rz(pi/2) q[4];
rz(2.0) q[4];
cx q[0], q[4];
rz(9.172838187819544) q[4];
cx q[0], q[4];
cx q[1], q[4];
rz(9.172838187819544) q[4];
cx q[1], q[4];
cx q[2], q[4];
rz(9.172838187819544) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(9.172838187819544) q[4];
cx q[3], q[4];
rz(pi/2) q[5];
rz(pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(5*pi/2) q[5];
rz(pi/2) q[5];
rz(2.0) q[5];
cx q[0], q[5];
rz(9.172838187819544) q[5];
cx q[0], q[5];
cx q[1], q[5];
rz(9.172838187819544) q[5];
cx q[1], q[5];
cx q[2], q[5];
rz(9.172838187819544) q[5];
cx q[2], q[5];
cx q[3], q[5];
rz(9.172838187819544) q[5];
cx q[3], q[5];
cx q[4], q[5];
rz(9.172838187819544) q[5];
cx q[4], q[5];
rz(pi/2) q[6];
rz(pi/2) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi/2) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(5*pi/2) q[6];
rz(pi/2) q[6];
rz(2.0) q[6];
cx q[0], q[6];
rz(9.172838187819544) q[6];
cx q[0], q[6];
cx q[1], q[6];
rz(9.172838187819544) q[6];
cx q[1], q[6];
cx q[2], q[6];
rz(9.172838187819544) q[6];
cx q[2], q[6];
cx q[3], q[6];
rz(9.172838187819544) q[6];
cx q[3], q[6];
cx q[4], q[6];
rz(9.172838187819544) q[6];
cx q[4], q[6];
cx q[5], q[6];
rz(9.172838187819544) q[6];
cx q[5], q[6];
rz(pi/2) q[7];
rz(pi/2) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi/2) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(5*pi/2) q[7];
rz(pi/2) q[7];
rz(2.0) q[7];
cx q[0], q[7];
rz(9.172838187819544) q[7];
cx q[0], q[7];
rz(pi/2) q[0];
rz(pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(5*pi/2) q[0];
rz(pi/2) q[0];
rz(2.0) q[0];
cx q[1], q[7];
rz(9.172838187819544) q[7];
cx q[1], q[7];
rz(pi/2) q[1];
rz(pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(5*pi/2) q[1];
rz(pi/2) q[1];
rz(2.0) q[1];
cx q[0], q[1];
rz(9.172838187819544) q[1];
cx q[0], q[1];
cx q[2], q[7];
rz(9.172838187819544) q[7];
cx q[2], q[7];
rz(pi/2) q[2];
rz(pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(5*pi/2) q[2];
rz(pi/2) q[2];
rz(2.0) q[2];
cx q[0], q[2];
rz(9.172838187819544) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(9.172838187819544) q[2];
cx q[1], q[2];
cx q[3], q[7];
rz(9.172838187819544) q[7];
cx q[3], q[7];
rz(pi/2) q[3];
rz(pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(5*pi/2) q[3];
rz(pi/2) q[3];
rz(2.0) q[3];
cx q[0], q[3];
rz(9.172838187819544) q[3];
cx q[0], q[3];
cx q[1], q[3];
rz(9.172838187819544) q[3];
cx q[1], q[3];
cx q[2], q[3];
rz(9.172838187819544) q[3];
cx q[2], q[3];
cx q[4], q[7];
rz(9.172838187819544) q[7];
cx q[4], q[7];
rz(pi/2) q[4];
rz(pi/2) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi/2) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(5*pi/2) q[4];
rz(pi/2) q[4];
rz(2.0) q[4];
cx q[0], q[4];
rz(9.172838187819544) q[4];
cx q[0], q[4];
cx q[1], q[4];
rz(9.172838187819544) q[4];
cx q[1], q[4];
cx q[2], q[4];
rz(9.172838187819544) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(9.172838187819544) q[4];
cx q[3], q[4];
cx q[5], q[7];
rz(9.172838187819544) q[7];
cx q[5], q[7];
rz(pi/2) q[5];
rz(pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(5*pi/2) q[5];
rz(pi/2) q[5];
rz(2.0) q[5];
cx q[0], q[5];
rz(9.172838187819544) q[5];
cx q[0], q[5];
cx q[1], q[5];
rz(9.172838187819544) q[5];
cx q[1], q[5];
cx q[2], q[5];
rz(9.172838187819544) q[5];
cx q[2], q[5];
cx q[3], q[5];
rz(9.172838187819544) q[5];
cx q[3], q[5];
cx q[4], q[5];
rz(9.172838187819544) q[5];
cx q[4], q[5];
cx q[6], q[7];
rz(9.172838187819544) q[7];
cx q[6], q[7];
rz(pi/2) q[6];
rz(pi/2) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi/2) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(5*pi/2) q[6];
rz(pi/2) q[6];
rz(2.0) q[6];
cx q[0], q[6];
rz(9.172838187819544) q[6];
cx q[0], q[6];
cx q[1], q[6];
rz(9.172838187819544) q[6];
cx q[1], q[6];
cx q[2], q[6];
rz(9.172838187819544) q[6];
cx q[2], q[6];
cx q[3], q[6];
rz(9.172838187819544) q[6];
cx q[3], q[6];
cx q[4], q[6];
rz(9.172838187819544) q[6];
cx q[4], q[6];
cx q[5], q[6];
rz(9.172838187819544) q[6];
cx q[5], q[6];
rz(pi/2) q[7];
rz(pi/2) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi/2) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(5*pi/2) q[7];
rz(pi/2) q[7];
rz(2.0) q[7];
cx q[0], q[7];
rz(9.172838187819544) q[7];
cx q[0], q[7];
rz(0) q[0];
rz(pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(5*pi/2) q[0];
rz(3.4610182515264283) q[0];
rz(pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(5*pi/2) q[0];
rz(3*pi) q[0];
cx q[1], q[7];
rz(9.172838187819544) q[7];
cx q[1], q[7];
rz(0) q[1];
rz(pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(5*pi/2) q[1];
rz(3.179973869837613) q[1];
rz(pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(5*pi/2) q[1];
rz(3*pi) q[1];
cx q[2], q[7];
rz(9.172838187819544) q[7];
cx q[2], q[7];
rz(0) q[2];
rz(pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(5*pi/2) q[2];
rz(4.133763818640374) q[2];
rz(pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(5*pi/2) q[2];
rz(3*pi) q[2];
cx q[3], q[7];
rz(9.172838187819544) q[7];
cx q[3], q[7];
rz(0) q[3];
rz(pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(5*pi/2) q[3];
rz(3.7180982497654416) q[3];
rz(pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(5*pi/2) q[3];
rz(3*pi) q[3];
cx q[4], q[7];
rz(9.172838187819544) q[7];
cx q[4], q[7];
rz(0) q[4];
rz(pi/2) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi/2) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(5*pi/2) q[4];
rz(3.5572574144829563) q[4];
rz(pi/2) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi/2) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(5*pi/2) q[4];
rz(3*pi) q[4];
cx q[5], q[7];
rz(9.172838187819544) q[7];
cx q[5], q[7];
rz(0) q[5];
rz(pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(5*pi/2) q[5];
rz(4.0984234413418665) q[5];
rz(pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(5*pi/2) q[5];
rz(3*pi) q[5];
cx q[6], q[7];
rz(9.172838187819544) q[7];
cx q[6], q[7];
rz(0) q[6];
rz(pi/2) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi/2) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(5*pi/2) q[6];
rz(3.3643141218295884) q[6];
rz(pi/2) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi/2) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(5*pi/2) q[6];
rz(3*pi) q[6];
rz(0) q[7];
rz(pi/2) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi/2) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(5*pi/2) q[7];
rz(3.197474516191286) q[7];
rz(pi/2) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi/2) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(5*pi/2) q[7];
rz(3*pi) q[7];
cx q[6], q[7];
cx q[5], q[6];
cx q[4], q[5];
cx q[3], q[4];
cx q[2], q[3];
cx q[1], q[2];
cx q[0], q[1];
rz(0) q[0];
rz(pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(5*pi/2) q[0];
rz(4.028397419295973) q[0];
rz(pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(5*pi/2) q[0];
rz(3*pi) q[0];
rz(0) q[1];
rz(pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(5*pi/2) q[1];
rz(3.3385705431879895) q[1];
rz(pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(5*pi/2) q[1];
rz(3*pi) q[1];
rz(0) q[2];
rz(pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(5*pi/2) q[2];
rz(4.095674830114565) q[2];
rz(pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(5*pi/2) q[2];
rz(3*pi) q[2];
rz(0) q[3];
rz(pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(5*pi/2) q[3];
rz(3.797964093317506) q[3];
rz(pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(5*pi/2) q[3];
rz(3*pi) q[3];
rz(0) q[4];
rz(pi/2) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi/2) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(5*pi/2) q[4];
rz(4.047929785253186) q[4];
rz(pi/2) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi/2) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(5*pi/2) q[4];
rz(3*pi) q[4];
rz(0) q[5];
rz(pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(5*pi/2) q[5];
rz(3.540186442360831) q[5];
rz(pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(5*pi/2) q[5];
rz(3*pi) q[5];
rz(0) q[6];
rz(pi/2) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi/2) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(5*pi/2) q[6];
rz(4.107323452451274) q[6];
rz(pi/2) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi/2) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(5*pi/2) q[6];
rz(3*pi) q[6];
rz(0) q[7];
rz(pi/2) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi/2) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(5*pi/2) q[7];
rz(4.0626191643857394) q[7];
rz(pi/2) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi/2) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(5*pi/2) q[7];
rz(3*pi) q[7];