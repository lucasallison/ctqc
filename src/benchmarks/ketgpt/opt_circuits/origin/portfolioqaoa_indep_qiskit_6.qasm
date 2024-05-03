OPENQASM 3.0;
include "stdgates.inc";
bit[6] meas;
bit[6] meas3;
qubit[6] q;
rz(-3*pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(1.5742522948140918) q[0];
rz(-3*pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(1.5702912214631208) q[1];
cx q[0], q[1];
rz(0.30640835800234384) q[1];
cx q[0], q[1];
rz(-3*pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(1.5704970754924332) q[2];
cx q[0], q[2];
rz(0.3064578071108339) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(0.30641123969344364) q[2];
cx q[1], q[2];
rz(-3*pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(1.5701489366303987) q[3];
cx q[0], q[3];
rz(0.3064382202982792) q[3];
cx q[0], q[3];
cx q[1], q[3];
rz(0.3064321236130968) q[3];
cx q[1], q[3];
cx q[2], q[3];
rz(0.30643112647579906) q[3];
cx q[2], q[3];
rz(-3*pi/2) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(1.5579255870113862) q[4];
cx q[0], q[4];
rz(0.3061241270907537) q[4];
cx q[0], q[4];
cx q[1], q[4];
rz(0.3064529865522876) q[4];
cx q[1], q[4];
cx q[2], q[4];
rz(0.3062438001194054) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(0.3064907532354401) q[4];
cx q[3], q[4];
rz(-3*pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(1.5697713046436128) q[5];
cx q[0], q[5];
rz(0.3064297198462831) q[5];
cx q[0], q[5];
rz(-pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.6396869352287253) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(11.035756278203422) q[0];
cx q[1], q[5];
rz(0.30645277488492745) q[5];
cx q[1], q[5];
rz(-pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.6396869352287253) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(10.989701508186553) q[1];
cx q[0], q[1];
rz(3.5625612576914834) q[1];
cx q[0], q[1];
cx q[2], q[5];
rz(0.3063943933113396) q[5];
cx q[2], q[5];
rz(-pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3.6396869352287253) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(10.992094940253322) q[2];
cx q[0], q[2];
rz(3.5631361946131874) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(3.5625947626556944) q[2];
cx q[1], q[2];
cx q[3], q[5];
rz(0.30645035976402574) q[5];
cx q[3], q[5];
rz(-pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3.6396869352287253) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(10.988047185060653) q[3];
cx q[0], q[3];
rz(3.5629084618580364) q[3];
cx q[0], q[3];
cx q[1], q[3];
rz(3.5628375766688305) q[3];
cx q[1], q[3];
cx q[2], q[3];
rz(3.5628259831120213) q[3];
cx q[2], q[3];
cx q[4], q[5];
rz(0.3063413283269469) q[5];
cx q[4], q[5];
rz(-pi/2) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3.6396869352287253) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(10.845928242627695) q[4];
cx q[0], q[4];
rz(3.559256550076877) q[4];
cx q[0], q[4];
cx q[1], q[4];
rz(3.563080146745467) q[4];
cx q[1], q[4];
cx q[2], q[4];
rz(3.5606479693522672) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(3.563519253965348) q[4];
cx q[3], q[4];
rz(-pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3.6396869352287253) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(10.98365651799609) q[5];
cx q[0], q[5];
rz(3.5628096284543016) q[5];
cx q[0], q[5];
rz(-pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(6.170821831310273) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(11.004855365186156) q[0];
cx q[1], q[5];
rz(3.5630776857227273) q[5];
cx q[1], q[5];
rz(-pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(6.170821831310273) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(10.994217816160202) q[1];
cx q[0], q[1];
rz(0.8228663398554805) q[1];
cx q[0], q[1];
cx q[2], q[5];
rz(3.5623988924496484) q[5];
cx q[2], q[5];
rz(-pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(6.170821831310273) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(10.994770641653439) q[2];
cx q[0], q[2];
rz(0.8229991365166998) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(0.8228740786998885) q[2];
cx q[1], q[2];
cx q[3], q[5];
rz(3.563049605496022) q[5];
cx q[3], q[5];
rz(-pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(6.170821831310273) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(10.993835707133272) q[3];
cx q[0], q[3];
rz(0.8229465357036495) q[3];
cx q[0], q[3];
cx q[1], q[3];
rz(0.822930162922391) q[3];
cx q[1], q[3];
cx q[2], q[3];
rz(0.8229274850883925) q[3];
cx q[2], q[3];
cx q[4], q[5];
rz(3.5617819143137712) q[5];
cx q[4], q[5];
rz(-pi/2) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(6.170821831310273) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(10.96100963467446) q[4];
cx q[0], q[4];
rz(0.8221030315325001) q[4];
cx q[0], q[4];
cx q[1], q[4];
rz(0.8229861908014034) q[4];
cx q[1], q[4];
cx q[2], q[4];
rz(0.8224244160655724) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(0.8230876140541399) q[4];
cx q[3], q[4];
rz(-pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(6.170821831310273) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(10.992821568182219) q[5];
cx q[0], q[5];
rz(0.8229237075540952) q[5];
cx q[0], q[5];
rz(pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(9.578247394999863) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(5*pi/2) q[0];
cx q[1], q[5];
rz(0.8229856223640832) q[5];
cx q[1], q[5];
rz(pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(9.578247394999863) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(5*pi/2) q[1];
cx q[2], q[5];
rz(0.8228288373726867) q[5];
cx q[2], q[5];
rz(pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(9.578247394999863) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(5*pi/2) q[2];
cx q[3], q[5];
rz(0.8229791365041359) q[5];
cx q[3], q[5];
rz(pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(9.578247394999863) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(5*pi/2) q[3];
cx q[4], q[5];
rz(0.8226863301977311) q[5];
cx q[4], q[5];
rz(pi/2) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(9.578247394999863) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(5*pi/2) q[4];
rz(pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(9.578247394999863) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(5*pi/2) q[5];
barrier q[0], q[1], q[2], q[3], q[4], q[5];
meas[0] = measure q[0];
meas[1] = measure q[1];
meas[2] = measure q[2];
meas[3] = measure q[3];
meas[4] = measure q[4];
meas[5] = measure q[5];
barrier q[0], q[1], q[2], q[3], q[4], q[5];
meas3[0] = measure q[0];
meas3[1] = measure q[1];
meas3[2] = measure q[2];
meas3[3] = measure q[3];
meas3[4] = measure q[4];
meas3[5] = measure q[5];
