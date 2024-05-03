OPENQASM 3.0;
include "stdgates.inc";
bit[9] meas;
qubit[9] q;
rz(-pi/2) q[0];
h q[0];
rz(1.6653032424136622) q[0];
h q[0];
rz(5*pi/2) q[0];
rz(-pi/2) q[1];
h q[1];
rz(1.679503360445639) q[1];
h q[1];
rz(5*pi/2) q[1];
rz(-pi/2) q[2];
h q[2];
rz(1.6593386367601575) q[2];
h q[2];
rz(5*pi/2) q[2];
rz(-pi/2) q[3];
h q[3];
rz(1.513785766096535) q[3];
h q[3];
rz(3*pi) q[3];
cx q[3], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.9289465112876787) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[3], q[2];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.2854272443691941) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[3], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.13151598868211245) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.5911179977588512) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[3], q[1];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.09312162354241638) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[2], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.02328004476154044) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.1866681871048015) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[3], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.10136094860444622) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.010077397086966311) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[2], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.04932433546974213) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.3486887489438639) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[3], q[0];
rz(-pi/2) q[4];
h q[4];
rz(5*pi/8) q[4];
h q[4];
rz(5*pi/2) q[4];
h q[4];
rz(pi/2) q[4];
h q[4];
rz(-0.04579566319000282) q[4];
cx q[0], q[4];
rz(0.04579566319000282) q[4];
cx q[0], q[4];
rz(-0.09159132638000564) q[4];
cx q[1], q[4];
rz(0.09159132638000564) q[4];
cx q[1], q[4];
h q[1];
rz(pi) q[1];
h q[1];
rz(-0.18318265276001128) q[4];
cx q[2], q[4];
rz(0.18318265276001128) q[4];
cx q[2], q[4];
h q[2];
rz(pi) q[2];
h q[2];
rz(-0.36636530552002256) q[4];
cx q[3], q[4];
rz(0.36636530552002256) q[4];
cx q[3], q[4];
h q[4];
rz(-pi/2) q[4];
h q[4];
h q[5];
cx q[0], q[6];
h q[6];
rz(pi) q[6];
h q[6];
h q[7];
rz(pi) q[7];
cx q[6], q[7];
rz(-pi/4) q[7];
cx q[1], q[7];
rz(pi/4) q[7];
cx q[6], q[7];
rz(pi/4) q[6];
rz(-pi/4) q[7];
cx q[1], q[7];
cx q[1], q[6];
rz(pi/2) q[1];
rz(-pi/4) q[6];
cx q[1], q[6];
rz(5*pi/4) q[7];
h q[7];
h q[8];
rz(pi) q[8];
cx q[7], q[8];
rz(-pi/4) q[8];
cx q[2], q[8];
rz(pi/4) q[8];
cx q[7], q[8];
rz(pi/4) q[7];
rz(-pi/4) q[8];
cx q[2], q[8];
cx q[2], q[7];
rz(pi/2) q[2];
rz(-pi/4) q[7];
cx q[2], q[7];
rz(pi/4) q[8];
h q[8];
cx q[8], q[5];
rz(-pi/4) q[5];
cx q[3], q[5];
rz(pi/4) q[5];
cx q[8], q[5];
rz(-pi/4) q[5];
cx q[3], q[5];
rz(pi/4) q[5];
h q[5];
cx q[5], q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(pi/8) q[4];
h q[4];
rz(5*pi/2) q[4];
cx q[5], q[4];
rz(-3*pi/2) q[4];
h q[4];
rz(pi/8) q[4];
h q[4];
rz(3*pi/2) q[4];
cx q[5], q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-0.02289783159500125) q[4];
h q[4];
rz(5*pi/2) q[4];
cx q[5], q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(0.02289783159500125) q[4];
h q[4];
rz(5*pi/2) q[4];
h q[4];
rz(pi/4) q[8];
cx q[3], q[8];
rz(-pi/4) q[8];
cx q[3], q[8];
h q[8];
rz(pi) q[8];
cx q[7], q[8];
rz(-pi/4) q[8];
cx q[2], q[8];
rz(pi/4) q[8];
cx q[7], q[8];
rz(pi/4) q[7];
rz(-pi/4) q[8];
cx q[2], q[8];
cx q[2], q[7];
rz(-pi/4) q[7];
cx q[2], q[7];
h q[2];
rz(pi) q[2];
h q[2];
h q[7];
cx q[6], q[7];
rz(-pi/4) q[7];
cx q[1], q[7];
rz(pi/4) q[7];
cx q[6], q[7];
rz(pi/4) q[6];
rz(-pi/4) q[7];
cx q[1], q[7];
cx q[1], q[6];
rz(-pi/4) q[6];
cx q[1], q[6];
h q[1];
rz(pi) q[1];
h q[1];
h q[6];
rz(pi) q[6];
h q[6];
cx q[0], q[6];
cx q[0], q[4];
rz(-pi/4) q[4];
cx q[5], q[4];
rz(pi/4) q[4];
cx q[0], q[4];
rz(pi/4) q[0];
rz(-pi/4) q[4];
cx q[5], q[4];
rz(pi/4) q[4];
h q[4];
cx q[5], q[0];
rz(-pi/4) q[0];
cx q[5], q[0];
cx q[5], q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(0.02289783159500125) q[4];
h q[4];
rz(5*pi/2) q[4];
cx q[5], q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-0.02289783159500125) q[4];
h q[4];
rz(5*pi/2) q[4];
h q[4];
cx q[0], q[4];
rz(-pi/4) q[4];
cx q[5], q[4];
rz(pi/4) q[4];
cx q[0], q[4];
rz(pi/4) q[0];
rz(-pi/4) q[4];
cx q[5], q[4];
rz(pi/4) q[4];
h q[4];
cx q[5], q[0];
rz(-pi/4) q[0];
cx q[5], q[0];
cx q[0], q[6];
cx q[5], q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-0.045795663190002944) q[4];
h q[4];
rz(5*pi/2) q[4];
cx q[5], q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(0.045795663190002944) q[4];
h q[4];
rz(5*pi/2) q[4];
h q[4];
cx q[1], q[4];
rz(-pi/4) q[4];
cx q[5], q[4];
rz(pi/4) q[4];
cx q[1], q[4];
rz(pi/4) q[1];
rz(-pi/4) q[4];
cx q[5], q[4];
rz(pi/4) q[4];
h q[4];
cx q[5], q[1];
rz(-pi/4) q[1];
cx q[5], q[1];
cx q[5], q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(0.045795663190002944) q[4];
h q[4];
rz(5*pi/2) q[4];
cx q[5], q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-0.045795663190002944) q[4];
h q[4];
rz(5*pi/2) q[4];
h q[4];
cx q[1], q[4];
rz(-pi/4) q[4];
cx q[5], q[4];
rz(pi/4) q[4];
cx q[1], q[4];
rz(pi/4) q[1];
rz(-pi/4) q[4];
cx q[5], q[4];
rz(pi/4) q[4];
h q[4];
cx q[5], q[1];
rz(-pi/4) q[1];
cx q[5], q[1];
h q[1];
rz(pi) q[1];
h q[1];
cx q[5], q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-0.09159132638000544) q[4];
h q[4];
rz(5*pi/2) q[4];
cx q[5], q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(0.09159132638000544) q[4];
h q[4];
rz(5*pi/2) q[4];
h q[4];
cx q[2], q[4];
rz(-pi/4) q[4];
cx q[5], q[4];
rz(pi/4) q[4];
cx q[2], q[4];
rz(pi/4) q[2];
rz(-pi/4) q[4];
cx q[5], q[4];
rz(pi/4) q[4];
h q[4];
cx q[5], q[2];
rz(-pi/4) q[2];
cx q[5], q[2];
cx q[5], q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(0.09159132638000544) q[4];
h q[4];
rz(5*pi/2) q[4];
cx q[5], q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-0.09159132638000544) q[4];
h q[4];
rz(5*pi/2) q[4];
h q[4];
cx q[2], q[4];
rz(-pi/4) q[4];
cx q[5], q[4];
rz(pi/4) q[4];
cx q[2], q[4];
rz(pi/4) q[2];
rz(-pi/4) q[4];
cx q[5], q[4];
rz(pi/4) q[4];
h q[4];
cx q[5], q[2];
rz(-pi/4) q[2];
cx q[5], q[2];
h q[2];
rz(pi) q[2];
h q[2];
cx q[5], q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-0.18318265276001133) q[4];
h q[4];
rz(5*pi/2) q[4];
cx q[5], q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(0.18318265276001133) q[4];
h q[4];
rz(5*pi/2) q[4];
h q[4];
cx q[3], q[4];
rz(-pi/4) q[4];
cx q[5], q[4];
rz(pi/4) q[4];
cx q[3], q[4];
rz(-pi/4) q[4];
cx q[5], q[4];
rz(pi/4) q[4];
h q[4];
cx q[5], q[3];
rz(-pi/4) q[3];
cx q[5], q[3];
cx q[5], q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(0.18318265276001133) q[4];
h q[4];
rz(5*pi/2) q[4];
cx q[5], q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-0.18318265276001133) q[4];
h q[4];
rz(5*pi/2) q[4];
h q[4];
cx q[3], q[4];
rz(-pi/4) q[4];
cx q[5], q[4];
rz(pi/4) q[4];
cx q[3], q[4];
rz(pi/4) q[3];
rz(-pi/4) q[4];
cx q[5], q[4];
rz(pi/4) q[4];
h q[4];
cx q[5], q[3];
rz(-pi/4) q[3];
cx q[5], q[3];
h q[5];
h q[6];
rz(pi) q[6];
h q[6];
rz(pi/4) q[7];
cx q[6], q[7];
rz(-pi/4) q[7];
cx q[1], q[7];
rz(pi/4) q[7];
cx q[6], q[7];
rz(pi/4) q[6];
rz(-pi/4) q[7];
cx q[1], q[7];
cx q[1], q[6];
rz(pi/2) q[1];
rz(-pi/4) q[6];
cx q[1], q[6];
rz(pi/4) q[7];
h q[7];
rz(pi/4) q[8];
cx q[7], q[8];
rz(-pi/4) q[8];
cx q[2], q[8];
rz(pi/4) q[8];
cx q[7], q[8];
rz(pi/4) q[7];
rz(-pi/4) q[8];
cx q[2], q[8];
cx q[2], q[7];
rz(pi/2) q[2];
rz(-pi/4) q[7];
cx q[2], q[7];
rz(5*pi/4) q[8];
h q[8];
cx q[8], q[5];
rz(-pi/4) q[5];
cx q[3], q[5];
rz(pi/4) q[5];
cx q[8], q[5];
rz(-pi/4) q[5];
cx q[3], q[5];
rz(pi/4) q[5];
h q[5];
rz(pi/4) q[8];
cx q[3], q[8];
rz(pi/4) q[3];
rz(-pi/4) q[8];
cx q[3], q[8];
h q[8];
cx q[7], q[8];
rz(-pi/4) q[8];
cx q[2], q[8];
rz(pi/4) q[8];
cx q[7], q[8];
rz(pi/4) q[7];
rz(-pi/4) q[8];
cx q[2], q[8];
cx q[2], q[7];
rz(-pi/4) q[7];
cx q[2], q[7];
h q[2];
rz(pi) q[2];
h q[2];
h q[7];
rz(pi) q[7];
cx q[6], q[7];
rz(-pi/4) q[7];
cx q[1], q[7];
rz(pi/4) q[7];
cx q[6], q[7];
rz(pi/4) q[6];
rz(-pi/4) q[7];
cx q[1], q[7];
cx q[1], q[6];
rz(-pi/4) q[6];
cx q[1], q[6];
h q[1];
rz(pi) q[1];
h q[1];
h q[6];
rz(pi) q[6];
h q[6];
cx q[0], q[6];
rz(5*pi/4) q[7];
h q[7];
rz(5*pi/4) q[8];
h q[8];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8];
meas[0] = measure q[0];
meas[1] = measure q[1];
meas[2] = measure q[2];
meas[3] = measure q[3];
meas[4] = measure q[4];
meas[5] = measure q[5];
meas[6] = measure q[6];
meas[7] = measure q[7];
meas[8] = measure q[8];
