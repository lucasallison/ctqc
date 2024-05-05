OPENQASM 3.0;
include "stdgates.inc";
bit[11] meas;
qubit[11] q;
rz(-pi/2) q[0];
h q[0];
rz(1.6198682507649043) q[0];
h q[0];
rz(5*pi/2) q[0];
rz(-pi/2) q[1];
h q[1];
rz(1.6522302917073768) q[1];
h q[1];
rz(5*pi/2) q[1];
rz(-pi/2) q[2];
h q[2];
rz(1.6686540393933997) q[2];
h q[2];
rz(5*pi/2) q[2];
rz(-pi/2) q[3];
h q[3];
rz(1.6513284175602783) q[3];
h q[3];
rz(5*pi/2) q[3];
rz(-pi/2) q[4];
h q[4];
rz(1.5137915688560515) q[4];
h q[4];
rz(5*pi/2) q[4];
cx q[4], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(0.8865441001965424) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[4], q[3];
cx q[3], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.27136874684996837) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[4], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.12296746850591678) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[3], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.5561141419458924) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[4], q[2];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.08597710262930747) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[3], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.02128571075901764) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.1717062891360026) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[4], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.09020964299228718) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.009215944885749838) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[3], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.04423540392575509) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.3218342498555824) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[4], q[1];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.024426126374258228) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[2], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.003897856889609752) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.04855428121029437) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[3], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.015244745443372398) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.0012686783248474498) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[2], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.007653454623708811) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.09454174123859937) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[4], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.052758649586460926) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.004656051107221781) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[2], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.0007802127795901725) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.009297218326801637) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[3], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.027179311202452094) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.0023524332004232207) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[2], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.013674425811267099) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.17090792167929791) q[0];
h q[0];
rz(5*pi/2) q[0];
h q[1];
rz(pi) q[1];
h q[1];
cx q[4], q[0];
h q[4];
rz(pi) q[4];
h q[4];
rz(-pi/2) q[5];
h q[5];
rz(3*pi/8) q[5];
h q[5];
rz(5*pi/2) q[5];
h q[6];
rz(pi) q[6];
h q[7];
rz(pi) q[7];
h q[7];
h q[8];
rz(pi) q[8];
cx q[7], q[8];
rz(-pi/4) q[8];
cx q[1], q[8];
rz(pi/4) q[8];
cx q[7], q[8];
rz(pi/4) q[7];
rz(-pi/4) q[8];
cx q[1], q[8];
cx q[1], q[7];
rz(pi/2) q[1];
rz(-pi/4) q[7];
cx q[1], q[7];
rz(pi/4) q[8];
h q[8];
h q[9];
cx q[8], q[9];
rz(-pi/4) q[9];
cx q[2], q[9];
rz(pi/4) q[9];
cx q[8], q[9];
rz(pi/4) q[8];
rz(-pi/4) q[9];
cx q[2], q[9];
cx q[2], q[8];
rz(3*pi/4) q[2];
rz(-pi/4) q[8];
cx q[2], q[8];
rz(pi/4) q[9];
h q[9];
h q[10];
cx q[9], q[10];
rz(-pi/4) q[10];
cx q[3], q[10];
rz(pi/4) q[10];
cx q[9], q[10];
rz(pi/4) q[9];
rz(-pi/4) q[10];
cx q[3], q[10];
cx q[3], q[9];
rz(3*pi/4) q[3];
rz(-pi/4) q[9];
cx q[3], q[9];
rz(5*pi/4) q[10];
h q[10];
cx q[10], q[6];
rz(-pi/4) q[6];
cx q[4], q[6];
rz(pi/4) q[6];
cx q[10], q[6];
rz(-pi/4) q[6];
cx q[4], q[6];
rz(pi/4) q[6];
h q[6];
cx q[6], q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(0.2942523647695423) q[5];
h q[5];
rz(5*pi/2) q[5];
cx q[6], q[5];
rz(-3*pi/2) q[5];
h q[5];
rz(0.2942523647695423) q[5];
h q[5];
rz(3*pi/2) q[5];
cx q[6], q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-0.011079862039810706) q[5];
h q[5];
rz(5*pi/2) q[5];
cx q[6], q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(0.011079862039810706) q[5];
h q[5];
rz(5*pi/2) q[5];
h q[5];
cx q[0], q[5];
rz(-pi/4) q[5];
cx q[6], q[5];
rz(pi/4) q[5];
cx q[0], q[5];
rz(pi/4) q[0];
rz(-pi/4) q[5];
cx q[6], q[5];
rz(pi/4) q[5];
h q[5];
cx q[6], q[0];
rz(-pi/4) q[0];
rz(5*pi/2) q[6];
cx q[6], q[0];
cx q[6], q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(0.011079862039810706) q[5];
h q[5];
rz(5*pi/2) q[5];
cx q[6], q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-0.011079862039810706) q[5];
h q[5];
rz(5*pi/2) q[5];
h q[5];
cx q[0], q[5];
rz(-pi/4) q[5];
cx q[6], q[5];
rz(pi/4) q[5];
cx q[0], q[5];
rz(pi/4) q[0];
rz(-pi/4) q[5];
cx q[6], q[5];
rz(pi/4) q[5];
h q[5];
cx q[6], q[0];
rz(-pi/4) q[0];
cx q[6], q[0];
cx q[6], q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-0.022159724079621412) q[5];
h q[5];
rz(5*pi/2) q[5];
cx q[6], q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(0.022159724079621412) q[5];
h q[5];
rz(5*pi/2) q[5];
h q[5];
rz(pi/4) q[10];
cx q[4], q[10];
rz(pi/4) q[4];
rz(-pi/4) q[10];
cx q[4], q[10];
h q[4];
rz(pi) q[4];
h q[4];
h q[10];
rz(pi) q[10];
cx q[9], q[10];
rz(-pi/4) q[10];
cx q[3], q[10];
rz(pi/4) q[10];
cx q[9], q[10];
rz(pi/4) q[9];
rz(-pi/4) q[10];
cx q[3], q[10];
cx q[3], q[9];
rz(-pi/4) q[9];
cx q[3], q[9];
h q[9];
cx q[8], q[9];
rz(-pi/4) q[9];
cx q[2], q[9];
rz(pi/4) q[9];
cx q[8], q[9];
rz(pi/4) q[8];
rz(-pi/4) q[9];
cx q[2], q[9];
cx q[2], q[8];
rz(-pi/4) q[8];
cx q[2], q[8];
h q[8];
rz(pi) q[8];
cx q[7], q[8];
rz(-pi/4) q[8];
cx q[1], q[8];
rz(pi/4) q[8];
cx q[7], q[8];
rz(pi/4) q[7];
rz(-pi/4) q[8];
cx q[1], q[8];
cx q[1], q[7];
rz(-pi/4) q[7];
cx q[1], q[7];
h q[1];
rz(pi) q[1];
h q[1];
cx q[1], q[5];
rz(-pi/4) q[5];
cx q[6], q[5];
rz(pi/4) q[5];
cx q[1], q[5];
rz(pi/4) q[1];
rz(-pi/4) q[5];
cx q[6], q[5];
rz(pi/4) q[5];
h q[5];
cx q[6], q[1];
rz(-pi/4) q[1];
cx q[6], q[1];
cx q[6], q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(0.022159724079621412) q[5];
h q[5];
rz(5*pi/2) q[5];
cx q[6], q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-0.022159724079621412) q[5];
h q[5];
rz(5*pi/2) q[5];
h q[5];
cx q[1], q[5];
rz(-pi/4) q[5];
cx q[6], q[5];
rz(pi/4) q[5];
cx q[1], q[5];
rz(pi/4) q[1];
rz(-pi/4) q[5];
cx q[6], q[5];
rz(pi/4) q[5];
h q[5];
cx q[6], q[1];
rz(-pi/4) q[1];
cx q[6], q[1];
h q[1];
rz(pi) q[1];
h q[1];
cx q[6], q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-0.044319448159242825) q[5];
h q[5];
rz(5*pi/2) q[5];
cx q[6], q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(0.044319448159242825) q[5];
h q[5];
rz(5*pi/2) q[5];
h q[5];
cx q[2], q[5];
rz(-pi/4) q[5];
cx q[6], q[5];
rz(pi/4) q[5];
cx q[2], q[5];
rz(-pi/4) q[5];
cx q[6], q[5];
rz(pi/4) q[5];
h q[5];
cx q[6], q[2];
rz(-pi/4) q[2];
cx q[6], q[2];
cx q[6], q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(0.044319448159242825) q[5];
h q[5];
rz(5*pi/2) q[5];
cx q[6], q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-0.044319448159242825) q[5];
h q[5];
rz(5*pi/2) q[5];
h q[5];
cx q[2], q[5];
rz(-pi/4) q[5];
cx q[6], q[5];
rz(pi/4) q[5];
cx q[2], q[5];
rz(pi/4) q[2];
rz(-pi/4) q[5];
cx q[6], q[5];
rz(pi/4) q[5];
h q[5];
cx q[6], q[2];
rz(-pi/4) q[2];
cx q[6], q[2];
cx q[6], q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-0.0886388963184861) q[5];
h q[5];
rz(5*pi/2) q[5];
cx q[6], q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(0.0886388963184861) q[5];
h q[5];
rz(5*pi/2) q[5];
h q[5];
cx q[3], q[5];
rz(-pi/4) q[5];
cx q[6], q[5];
rz(pi/4) q[5];
cx q[3], q[5];
rz(-pi/4) q[5];
cx q[6], q[5];
rz(pi/4) q[5];
h q[5];
cx q[6], q[3];
rz(-pi/4) q[3];
cx q[6], q[3];
cx q[6], q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(0.0886388963184861) q[5];
h q[5];
rz(5*pi/2) q[5];
cx q[6], q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-0.0886388963184861) q[5];
h q[5];
rz(5*pi/2) q[5];
h q[5];
cx q[3], q[5];
rz(-pi/4) q[5];
cx q[6], q[5];
rz(pi/4) q[5];
cx q[3], q[5];
rz(pi/4) q[3];
rz(-pi/4) q[5];
cx q[6], q[5];
rz(pi/4) q[5];
h q[5];
cx q[6], q[3];
rz(-pi/4) q[3];
cx q[6], q[3];
cx q[6], q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-0.1772777926369722) q[5];
h q[5];
rz(5*pi/2) q[5];
cx q[6], q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(0.1772777926369722) q[5];
h q[5];
rz(5*pi/2) q[5];
h q[5];
cx q[4], q[5];
rz(-pi/4) q[5];
cx q[6], q[5];
rz(pi/4) q[5];
cx q[4], q[5];
rz(pi/4) q[4];
rz(-pi/4) q[5];
cx q[6], q[5];
rz(pi/4) q[5];
h q[5];
cx q[6], q[4];
rz(-pi/4) q[4];
cx q[6], q[4];
cx q[6], q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(0.1772777926369722) q[5];
h q[5];
rz(5*pi/2) q[5];
cx q[6], q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-0.1772777926369722) q[5];
h q[5];
rz(5*pi/2) q[5];
h q[5];
cx q[4], q[5];
rz(-pi/4) q[5];
cx q[6], q[5];
rz(pi/4) q[5];
cx q[4], q[5];
rz(pi/4) q[4];
rz(-pi/4) q[5];
cx q[6], q[5];
rz(pi/4) q[5];
h q[5];
cx q[6], q[4];
rz(-pi/4) q[4];
cx q[6], q[4];
h q[4];
rz(pi) q[4];
h q[4];
h q[6];
rz(pi/4) q[8];
cx q[7], q[8];
rz(-pi/4) q[8];
cx q[1], q[8];
rz(pi/4) q[8];
cx q[7], q[8];
rz(pi/4) q[7];
rz(-pi/4) q[8];
cx q[1], q[8];
cx q[1], q[7];
rz(pi/2) q[1];
rz(-pi/4) q[7];
cx q[1], q[7];
rz(5*pi/4) q[8];
h q[8];
rz(pi/4) q[9];
cx q[8], q[9];
rz(-pi/4) q[9];
cx q[2], q[9];
rz(pi/4) q[9];
cx q[8], q[9];
rz(pi/4) q[8];
rz(-pi/4) q[9];
cx q[2], q[9];
cx q[2], q[8];
rz(pi/2) q[2];
rz(-pi/4) q[8];
cx q[2], q[8];
rz(pi/4) q[9];
h q[9];
rz(pi/4) q[10];
cx q[9], q[10];
rz(-pi/4) q[10];
cx q[3], q[10];
rz(pi/4) q[10];
cx q[9], q[10];
rz(pi/4) q[9];
rz(-pi/4) q[10];
cx q[3], q[10];
cx q[3], q[9];
rz(pi/2) q[3];
rz(-pi/4) q[9];
cx q[3], q[9];
rz(5*pi/4) q[10];
h q[10];
cx q[10], q[6];
rz(-pi/4) q[6];
cx q[4], q[6];
rz(pi/4) q[6];
cx q[10], q[6];
rz(-pi/4) q[6];
cx q[4], q[6];
rz(5*pi/4) q[6];
h q[6];
rz(pi/4) q[10];
cx q[4], q[10];
rz(pi/4) q[4];
rz(-pi/4) q[10];
cx q[4], q[10];
h q[4];
rz(pi) q[4];
h q[4];
h q[10];
rz(pi) q[10];
cx q[9], q[10];
rz(-pi/4) q[10];
cx q[3], q[10];
rz(pi/4) q[10];
cx q[9], q[10];
rz(pi/4) q[9];
rz(-pi/4) q[10];
cx q[3], q[10];
cx q[3], q[9];
rz(-pi/4) q[9];
cx q[3], q[9];
h q[9];
cx q[8], q[9];
rz(-pi/4) q[9];
cx q[2], q[9];
rz(pi/4) q[9];
cx q[8], q[9];
rz(pi/4) q[8];
rz(-pi/4) q[9];
cx q[2], q[9];
cx q[2], q[8];
rz(-pi/4) q[8];
cx q[2], q[8];
h q[8];
cx q[7], q[8];
rz(-pi/4) q[8];
cx q[1], q[8];
rz(pi/4) q[8];
cx q[7], q[8];
rz(pi/4) q[7];
rz(-pi/4) q[8];
cx q[1], q[8];
cx q[1], q[7];
rz(-pi/4) q[7];
cx q[1], q[7];
h q[1];
rz(pi) q[1];
h q[1];
h q[7];
rz(pi) q[7];
h q[7];
rz(5*pi/4) q[8];
h q[8];
rz(pi/4) q[9];
h q[9];
rz(pi/4) q[10];
h q[10];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10];
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