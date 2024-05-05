OPENQASM 3.0;
include "stdgates.inc";
bit[6] meas;
bit[6] meas3;
qubit[6] q;
h q[0];
rz(-3.138136685570598) q[0];
h q[1];
rz(-0.0005051053317757237) q[1];
cx q[0], q[1];
rz(0.30640835800234384) q[1];
cx q[0], q[1];
h q[2];
rz(-0.00029925130246333254) q[2];
cx q[0], q[2];
rz(0.3064578071108339) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(0.30641123969344364) q[2];
cx q[1], q[2];
h q[3];
rz(-0.0006473901644978852) q[3];
cx q[0], q[3];
rz(0.3064382202982792) q[3];
cx q[0], q[3];
cx q[1], q[3];
rz(0.3064321236130968) q[3];
cx q[1], q[3];
cx q[2], q[3];
rz(0.30643112647579906) q[3];
cx q[2], q[3];
h q[4];
rz(-0.012870739783510388) q[4];
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
h q[5];
rz(-0.0010250221512837498) q[5];
cx q[0], q[5];
rz(0.3064297198462831) q[5];
cx q[0], q[5];
h q[0];
rz(0.4980942816389322) q[0];
h q[0];
rz(6.3233672978187325) q[0];
cx q[1], q[5];
rz(0.30645277488492745) q[5];
cx q[1], q[5];
rz(-pi) q[1];
h q[1];
rz(0.4980942816389322) q[1];
h q[1];
rz(9.418905181391656) q[1];
cx q[0], q[1];
rz(3.5625612576914834) q[1];
cx q[0], q[1];
cx q[2], q[5];
rz(0.3063943933113396) q[5];
cx q[2], q[5];
rz(-pi) q[2];
h q[2];
rz(0.4980942816389322) q[2];
h q[2];
rz(9.421298613458426) q[2];
cx q[0], q[2];
rz(3.5631361946131874) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(3.5625947626556944) q[2];
cx q[1], q[2];
cx q[3], q[5];
rz(0.30645035976402574) q[5];
cx q[3], q[5];
rz(-pi) q[3];
h q[3];
rz(0.4980942816389322) q[3];
h q[3];
rz(9.417250858265756) q[3];
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
rz(-pi) q[4];
h q[4];
rz(0.4980942816389322) q[4];
h q[4];
rz(9.275131915832798) q[4];
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
rz(-pi) q[5];
h q[5];
rz(0.4980942816389322) q[5];
h q[5];
rz(9.412860191201194) q[5];
cx q[0], q[5];
rz(3.5628096284543016) q[5];
cx q[0], q[5];
h q[0];
rz(3.02922917772048) q[0];
h q[0];
rz(9.43405903839126) q[0];
cx q[1], q[5];
rz(3.5630776857227273) q[5];
cx q[1], q[5];
rz(-pi) q[1];
h q[1];
rz(3.02922917772048) q[1];
h q[1];
rz(9.423421489365305) q[1];
cx q[0], q[1];
rz(0.8228663398554805) q[1];
cx q[0], q[1];
cx q[2], q[5];
rz(3.5623988924496484) q[5];
cx q[2], q[5];
rz(-pi) q[2];
h q[2];
rz(3.02922917772048) q[2];
h q[2];
rz(9.423974314858542) q[2];
cx q[0], q[2];
rz(0.8229991365166998) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(0.8228740786998885) q[2];
cx q[1], q[2];
cx q[3], q[5];
rz(3.563049605496022) q[5];
cx q[3], q[5];
rz(-pi) q[3];
h q[3];
rz(3.02922917772048) q[3];
h q[3];
rz(9.423039380338375) q[3];
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
rz(-pi) q[4];
h q[4];
rz(3.02922917772048) q[4];
h q[4];
rz(9.390213307879563) q[4];
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
rz(-pi) q[5];
h q[5];
rz(3.02922917772048) q[5];
h q[5];
rz(9.422025241387322) q[5];
cx q[0], q[5];
rz(0.8229237075540952) q[5];
cx q[0], q[5];
h q[0];
rz(6.43665474141007) q[0];
h q[0];
cx q[1], q[5];
rz(0.8229856223640832) q[5];
cx q[1], q[5];
h q[1];
rz(6.43665474141007) q[1];
h q[1];
cx q[2], q[5];
rz(0.8228288373726867) q[5];
cx q[2], q[5];
h q[2];
rz(6.43665474141007) q[2];
h q[2];
cx q[3], q[5];
rz(0.8229791365041359) q[5];
cx q[3], q[5];
h q[3];
rz(6.43665474141007) q[3];
h q[3];
cx q[4], q[5];
rz(0.8226863301977311) q[5];
cx q[4], q[5];
h q[4];
rz(6.43665474141007) q[4];
h q[4];
h q[5];
rz(6.43665474141007) q[5];
h q[5];
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