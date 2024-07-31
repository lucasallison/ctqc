OPENQASM 3.0;
include "stdgates.inc";
bit[7] meas;
bit[7] meas4;
qubit[7] q;
rz(-3*pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(-1.3520385663813128) q[0];
rz(-3*pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(-1.3336059036582553) q[1];
cx q[0], q[1];
rz(-3.38540680648854) q[1];
cx q[0], q[1];
rz(-3*pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(-1.326776662628614) q[2];
cx q[0], q[2];
rz(-3.3853585130077) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(-3.385453644100732) q[2];
cx q[1], q[2];
rz(-3*pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(-1.3227154027646364) q[3];
cx q[0], q[3];
rz(-3.385159851923734) q[3];
cx q[0], q[3];
cx q[1], q[3];
rz(-3.3852978294193385) q[3];
cx q[1], q[3];
cx q[2], q[3];
rz(-3.385305238482944) q[3];
cx q[2], q[3];
rz(-3*pi/2) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(-1.3246134358205222) q[4];
cx q[0], q[4];
rz(-3.3847987682894027) q[4];
cx q[0], q[4];
cx q[1], q[4];
rz(-3.385301570677121) q[4];
cx q[1], q[4];
cx q[2], q[4];
rz(-3.385072191118839) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(-3.385347000948554) q[4];
cx q[3], q[4];
rz(-3*pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(-1.298710439879577) q[5];
cx q[0], q[5];
rz(-3.385229142320833) q[5];
cx q[0], q[5];
cx q[1], q[5];
rz(-3.385312468226019) q[5];
cx q[1], q[5];
cx q[2], q[5];
rz(-3.3855580367121836) q[5];
cx q[2], q[5];
cx q[3], q[5];
rz(-3.3852314880938548) q[5];
cx q[3], q[5];
cx q[4], q[5];
rz(-3.3853828470165728) q[5];
cx q[4], q[5];
rz(-3*pi/2) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(-1.3454550315122455) q[6];
cx q[0], q[6];
rz(-3.3843274450057104) q[6];
cx q[0], q[6];
rz(-pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(5.6203395875672815) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(12.533455662209805) q[0];
cx q[1], q[6];
rz(-3.3854484833299145) q[6];
cx q[1], q[6];
rz(-pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(5.6203395875672815) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(12.541891463597894) q[1];
cx q[0], q[1];
rz(-1.5493485594838012) q[1];
cx q[0], q[1];
cx q[2], q[6];
rz(-3.385508182455433) q[6];
cx q[2], q[6];
rz(-pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(5.6203395875672815) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(12.545016900319816) q[2];
cx q[0], q[2];
rz(-1.549326457727868) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(-1.5493699949540793) q[2];
cx q[1], q[2];
cx q[3], q[6];
rz(-3.3854089679198744) q[6];
cx q[3], q[6];
rz(-pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(5.6203395875672815) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(12.546875556451742) q[3];
cx q[0], q[3];
rz(-1.5492355394773114) q[3];
cx q[0], q[3];
cx q[1], q[3];
rz(-1.5492986855765178) q[3];
cx q[1], q[3];
cx q[2], q[3];
rz(-1.549302076371976) q[3];
cx q[2], q[3];
cx q[4], q[6];
rz(-3.385197102641506) q[6];
cx q[4], q[6];
rz(-pi/2) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(5.6203395875672815) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(12.546006912017237) q[4];
cx q[0], q[4];
rz(-1.5490702877245142) q[4];
cx q[0], q[4];
cx q[1], q[4];
rz(-1.5493003977820774) q[4];
cx q[1], q[4];
cx q[2], q[4];
rz(-1.5491954210662755) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(-1.5493211891757341) q[4];
cx q[3], q[4];
cx q[5], q[6];
rz(-3.3860939893075144) q[6];
cx q[5], q[6];
rz(-pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(5.6203395875672815) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(12.557861549211946) q[5];
cx q[0], q[5];
rz(-1.549267250578242) q[5];
cx q[0], q[5];
cx q[1], q[5];
rz(-1.5493053851004863) q[5];
cx q[1], q[5];
cx q[2], q[5];
rz(-1.5494177707610706) q[5];
cx q[2], q[5];
cx q[3], q[5];
rz(-1.549268324133138) q[5];
cx q[3], q[5];
cx q[4], q[5];
rz(-1.54933759431019) q[5];
cx q[4], q[5];
rz(-pi/2) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(5.6203395875672815) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(12.536468650263753) q[6];
cx q[0], q[6];
rz(-1.5488545842382329) q[6];
cx q[0], q[6];
rz(-pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(5.8791091598513) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(10.933443670582388) q[0];
cx q[1], q[6];
rz(-1.5493676331011945) q[6];
cx q[1], q[6];
rz(-pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(5.8791091598513) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(10.933102863057426) q[1];
cx q[0], q[1];
rz(0.06259389281108546) q[1];
cx q[0], q[1];
cx q[2], q[6];
rz(-1.5493949547081423) q[6];
cx q[2], q[6];
rz(-pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(5.8791091598513) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(10.932976594988203) q[2];
cx q[0], q[2];
rz(0.06259299989713568) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(0.06259475880700402) q[2];
cx q[1], q[2];
cx q[3], q[6];
rz(-1.5493495486737914) q[6];
cx q[3], q[6];
rz(-pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(5.8791091598513) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(10.93290150502734) q[3];
cx q[0], q[3];
rz(0.06258932678743093) q[3];
cx q[0], q[3];
cx q[1], q[3];
rz(0.06259187789843881) q[3];
cx q[1], q[3];
cx q[2], q[3];
rz(0.06259201488703713) q[3];
cx q[2], q[3];
cx q[4], q[6];
rz(-1.5492525874568361) q[6];
cx q[4], q[6];
rz(-pi/2) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(5.8791091598513) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(10.932936598380795) q[4];
cx q[0], q[4];
rz(0.06258265059411204) q[4];
cx q[0], q[4];
cx q[1], q[4];
rz(0.06259194707177661) q[4];
cx q[1], q[4];
cx q[2], q[4];
rz(0.06258770599816128) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(0.06259278704691194) q[4];
cx q[3], q[4];
cx q[5], q[6];
rz(-1.5496630521789303) q[6];
cx q[5], q[6];
rz(-pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(5.8791091598513) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(10.93245766942363) q[5];
cx q[0], q[5];
rz(0.0625906079202273) q[5];
cx q[0], q[5];
cx q[1], q[5];
rz(0.06259214856011956) q[5];
cx q[1], q[5];
cx q[2], q[5];
rz(0.06259668895611312) q[5];
cx q[2], q[5];
cx q[3], q[5];
rz(0.0625906512919913) q[5];
cx q[3], q[5];
cx q[4], q[5];
rz(0.0625934498165782) q[5];
cx q[4], q[5];
rz(-pi/2) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(5.8791091598513) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(10.933321945454665) q[6];
cx q[0], q[6];
rz(0.06257393614388933) q[6];
cx q[0], q[6];
rz(pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(10.76850095464108) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(5*pi/2) q[0];
cx q[1], q[6];
rz(0.06259466338782581) q[6];
cx q[1], q[6];
rz(pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(10.76850095464108) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(5*pi/2) q[1];
cx q[2], q[6];
rz(0.06259576718446747) q[6];
cx q[2], q[6];
rz(pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(10.76850095464108) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(5*pi/2) q[2];
cx q[3], q[6];
rz(0.06259393277449578) q[6];
cx q[3], q[6];
rz(pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(10.76850095464108) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(5*pi/2) q[3];
cx q[4], q[6];
rz(0.06259001552812551) q[6];
cx q[4], q[6];
rz(pi/2) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(10.76850095464108) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(5*pi/2) q[4];
cx q[5], q[6];
rz(0.06260659835879986) q[6];
cx q[5], q[6];
rz(pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(10.76850095464108) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(5*pi/2) q[5];
rz(pi/2) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(10.76850095464108) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(5*pi/2) q[6];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6];
meas[0] = measure q[0];
meas[1] = measure q[1];
meas[2] = measure q[2];
meas[3] = measure q[3];
meas[4] = measure q[4];
meas[5] = measure q[5];
meas[6] = measure q[6];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6];
meas4[0] = measure q[0];
meas4[1] = measure q[1];
meas4[2] = measure q[2];
meas4[3] = measure q[3];
meas4[4] = measure q[4];
meas4[5] = measure q[5];
meas4[6] = measure q[6];