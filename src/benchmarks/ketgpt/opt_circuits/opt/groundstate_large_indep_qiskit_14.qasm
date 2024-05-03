OPENQASM 3.0;
include "stdgates.inc";
bit[14] meas;
qubit[14] q;
rz(-2.964047350206256) q[0];
h q[0];
rz(-5.310099038868655) q[0];
rz(-4.160970534326902) q[1];
cx q[0], q[1];
h q[1];
rz(-1.9097239321191983) q[2];
cx q[0], q[2];
cx q[1], q[2];
h q[2];
rz(-0.7804596809712034) q[3];
cx q[0], q[3];
cx q[1], q[3];
cx q[2], q[3];
h q[3];
rz(-4.915988416454759) q[4];
cx q[0], q[4];
cx q[1], q[4];
cx q[2], q[4];
cx q[3], q[4];
h q[4];
rz(-4.873547476575651) q[5];
cx q[0], q[5];
cx q[1], q[5];
cx q[2], q[5];
cx q[3], q[5];
cx q[4], q[5];
h q[5];
rz(-3.531888028110753) q[6];
cx q[0], q[6];
cx q[1], q[6];
cx q[2], q[6];
cx q[3], q[6];
cx q[4], q[6];
cx q[5], q[6];
h q[6];
rz(-3.823438861145503) q[7];
cx q[0], q[7];
cx q[1], q[7];
cx q[2], q[7];
cx q[3], q[7];
cx q[4], q[7];
cx q[5], q[7];
cx q[6], q[7];
h q[7];
rz(-0.35669999955286613) q[8];
cx q[0], q[8];
cx q[1], q[8];
cx q[2], q[8];
cx q[3], q[8];
cx q[4], q[8];
cx q[5], q[8];
cx q[6], q[8];
cx q[7], q[8];
h q[8];
rz(-0.4257721251917035) q[9];
cx q[0], q[9];
cx q[1], q[9];
cx q[2], q[9];
cx q[3], q[9];
cx q[4], q[9];
cx q[5], q[9];
cx q[6], q[9];
cx q[7], q[9];
cx q[8], q[9];
h q[9];
rz(-2.5179048871372203) q[10];
cx q[0], q[10];
cx q[1], q[10];
cx q[2], q[10];
cx q[3], q[10];
cx q[4], q[10];
cx q[5], q[10];
cx q[6], q[10];
cx q[7], q[10];
cx q[8], q[10];
cx q[9], q[10];
h q[10];
rz(-3.8938355796742616) q[11];
cx q[0], q[11];
cx q[1], q[11];
cx q[2], q[11];
cx q[3], q[11];
cx q[4], q[11];
cx q[5], q[11];
cx q[6], q[11];
cx q[7], q[11];
cx q[8], q[11];
cx q[9], q[11];
cx q[10], q[11];
h q[11];
rz(-0.0899563886659056) q[12];
cx q[0], q[12];
cx q[1], q[12];
cx q[2], q[12];
cx q[3], q[12];
cx q[4], q[12];
cx q[5], q[12];
cx q[6], q[12];
cx q[7], q[12];
cx q[8], q[12];
cx q[9], q[12];
cx q[10], q[12];
cx q[11], q[12];
h q[12];
rz(-2.5258679172055265) q[13];
cx q[0], q[13];
h q[0];
rz(-0.5316501117180046) q[0];
cx q[1], q[13];
rz(-1.5299706948783758) q[1];
cx q[0], q[1];
h q[1];
cx q[2], q[13];
rz(-3.0021502002272857) q[2];
cx q[0], q[2];
cx q[1], q[2];
h q[2];
cx q[3], q[13];
rz(-0.7618349734420233) q[3];
cx q[0], q[3];
cx q[1], q[3];
cx q[2], q[3];
h q[3];
cx q[4], q[13];
rz(-3.5570640381785203) q[4];
cx q[0], q[4];
cx q[1], q[4];
cx q[2], q[4];
cx q[3], q[4];
h q[4];
cx q[5], q[13];
rz(-2.617764775641769) q[5];
cx q[0], q[5];
cx q[1], q[5];
cx q[2], q[5];
cx q[3], q[5];
cx q[4], q[5];
h q[5];
cx q[6], q[13];
rz(-1.293606491324855) q[6];
cx q[0], q[6];
cx q[1], q[6];
cx q[2], q[6];
cx q[3], q[6];
cx q[4], q[6];
cx q[5], q[6];
h q[6];
cx q[7], q[13];
rz(-4.622347395302693) q[7];
cx q[0], q[7];
cx q[1], q[7];
cx q[2], q[7];
cx q[3], q[7];
cx q[4], q[7];
cx q[5], q[7];
cx q[6], q[7];
h q[7];
cx q[8], q[13];
rz(-2.5643265361936507) q[8];
cx q[0], q[8];
cx q[1], q[8];
cx q[2], q[8];
cx q[3], q[8];
cx q[4], q[8];
cx q[5], q[8];
cx q[6], q[8];
cx q[7], q[8];
h q[8];
cx q[9], q[13];
rz(-3.1343559168663866) q[9];
cx q[0], q[9];
cx q[1], q[9];
cx q[2], q[9];
cx q[3], q[9];
cx q[4], q[9];
cx q[5], q[9];
cx q[6], q[9];
cx q[7], q[9];
cx q[8], q[9];
h q[9];
cx q[10], q[13];
rz(-0.10949993943506975) q[10];
cx q[0], q[10];
cx q[1], q[10];
cx q[2], q[10];
cx q[3], q[10];
cx q[4], q[10];
cx q[5], q[10];
cx q[6], q[10];
cx q[7], q[10];
cx q[8], q[10];
cx q[9], q[10];
h q[10];
cx q[11], q[13];
rz(-6.187662811265243) q[11];
cx q[0], q[11];
cx q[1], q[11];
cx q[2], q[11];
cx q[3], q[11];
cx q[4], q[11];
cx q[5], q[11];
cx q[6], q[11];
cx q[7], q[11];
cx q[8], q[11];
cx q[9], q[11];
cx q[10], q[11];
h q[11];
cx q[12], q[13];
rz(-2.4466648585641) q[12];
cx q[0], q[12];
cx q[1], q[12];
cx q[2], q[12];
cx q[3], q[12];
cx q[4], q[12];
cx q[5], q[12];
cx q[6], q[12];
cx q[7], q[12];
cx q[8], q[12];
cx q[9], q[12];
cx q[10], q[12];
cx q[11], q[12];
h q[12];
h q[13];
rz(-4.711716733221994) q[13];
cx q[0], q[13];
h q[0];
cx q[1], q[13];
rz(-4.4679344402906995) q[1];
h q[1];
cx q[2], q[13];
rz(-0.5233691881443869) q[2];
h q[2];
cx q[3], q[13];
rz(-5.987869097020648) q[3];
h q[3];
cx q[4], q[13];
rz(-5.687073224769469) q[4];
h q[4];
cx q[5], q[13];
rz(-4.933618031263384) q[5];
h q[5];
cx q[6], q[13];
rz(-3.3301510604268696) q[6];
h q[6];
cx q[7], q[13];
rz(-0.5141344354664295) q[7];
h q[7];
cx q[8], q[13];
rz(-3.1074967843583945) q[8];
h q[8];
cx q[9], q[13];
rz(-2.8103275694174936) q[9];
h q[9];
cx q[10], q[13];
rz(-3.8730374087069537) q[10];
h q[10];
cx q[11], q[13];
rz(-3.7453250167714813) q[11];
h q[11];
cx q[12], q[13];
rz(-3.452915148865926) q[12];
h q[12];
h q[13];
rz(-0.7019698315018363) q[13];
h q[13];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], q[11], q[12], q[13];
meas[0] = measure q[0];
meas[1] = measure q[1];
meas[2] = measure q[2];
meas[3] = measure q[3];
meas[4] = measure q[4];
meas[5] = measure q[5];
meas[6] = measure q[6];
meas[7] = measure q[7];
meas[8] = measure q[8];
meas[9] = measure q[9];
meas[10] = measure q[10];
meas[11] = measure q[11];
meas[12] = measure q[12];
meas[13] = measure q[13];
