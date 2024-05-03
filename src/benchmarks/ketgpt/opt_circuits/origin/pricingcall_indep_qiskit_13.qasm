OPENQASM 3.0;
include "stdgates.inc";
bit[13] meas;
qubit[13] q;
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(4.736357817824078) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(4.75793338335619) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(4.788740684676537) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(4.805776138385111) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi) q[3];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(4.789558107218529) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi) q[4];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(4.655133436694863) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi) q[5];
cx q[5], q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(4.009113000169372) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi) q[4];
cx q[5], q[4];
cx q[4], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3.4067390167490137) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi) q[3];
cx q[5], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3.261074094292007) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi) q[3];
cx q[4], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3.6824015657831377) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi) q[3];
cx q[5], q[3];
cx q[3], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3.2246155554578193) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
cx q[4], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3.1620965852936918) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
cx q[3], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3.307173677650344) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
cx q[5], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3.2275002517596296) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
cx q[3], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3.1505174383634995) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
cx q[4], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3.183844806709795) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
cx q[3], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3.452203258824957) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
cx q[5], q[2];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.1649450214744044) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
cx q[3], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.145246799076636) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.1880191439527774) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
cx q[4], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.1558772712558336) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.142764361235863) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
cx q[3], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.148765314815088) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.2320797079265633) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
cx q[5], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.1912773454826118) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.1458902121048733) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
cx q[3], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.1423045139505383) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.1501706468763304) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
cx q[4], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.167162655467616) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.143766154322759) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
cx q[3], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.15445645340683) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.3057903003175224) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
cx q[5], q[1];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.1476707574106415) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[2], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.1421217028803046) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.153720927195497) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[3], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.14367582292988) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.141702461107775) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[2], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.1426375449858646) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.1656303586741292) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[4], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.149438664501595) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.142000490192169) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[2], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.1416420459936907) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.142405194633873) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[3], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.1455648938432033) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.141799710321763) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[2], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.1435850456820975) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.188068108478385) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[5], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.1675419665146447) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.1428675012061813) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[2], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.1417416900301958) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.1441326612876397) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[3], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.1421763442203754) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.1416308337983287) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[2], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.1418857406644958) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.146596538522402) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[4], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.1551409592825945) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.1422677263785537) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[2], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.141672183919382) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.142937697297805) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[3], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.148446038979762) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.141935287945204) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[2], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.1450294731816038) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.2250860167343447) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[5], q[0];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(11*pi/8) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
h q[6];
rz(pi/2) q[6];
h q[6];
rz(0) q[6];
cx q[0], q[6];
rz(0) q[6];
cx q[0], q[6];
h q[6];
rz(-pi/2) q[6];
h q[6];
h q[6];
rz(pi/2) q[6];
h q[6];
rz(0) q[6];
cx q[1], q[6];
rz(0) q[6];
cx q[1], q[6];
h q[6];
rz(-pi/2) q[6];
h q[6];
h q[6];
rz(pi/2) q[6];
h q[6];
rz(0) q[6];
cx q[2], q[6];
rz(0) q[6];
cx q[2], q[6];
h q[2];
s q[2];
s q[2];
h q[2];
h q[6];
rz(-pi/2) q[6];
h q[6];
h q[6];
rz(pi/2) q[6];
h q[6];
rz(0) q[6];
cx q[3], q[6];
rz(0) q[6];
cx q[3], q[6];
h q[6];
rz(-pi/2) q[6];
h q[6];
h q[6];
rz(pi/2) q[6];
h q[6];
rz(0) q[6];
cx q[4], q[6];
rz(0) q[6];
cx q[4], q[6];
h q[6];
rz(-pi/2) q[6];
h q[6];
h q[6];
rz(pi/2) q[6];
h q[6];
rz(0) q[6];
cx q[5], q[6];
rz(0) q[6];
cx q[5], q[6];
h q[5];
s q[5];
s q[5];
h q[5];
h q[6];
rz(-pi/2) q[6];
h q[6];
h q[7];
s q[7];
s q[7];
h q[7];
h q[7];
cx q[0], q[8];
h q[9];
cx q[8], q[9];
rz(-pi/4) q[9];
cx q[1], q[9];
rz(pi/4) q[9];
cx q[8], q[9];
rz(pi/4) q[8];
rz(-pi/4) q[9];
cx q[1], q[9];
cx q[1], q[8];
rz(pi/4) q[1];
rz(-pi/4) q[8];
cx q[1], q[8];
rz(pi/4) q[9];
h q[9];
h q[9];
s q[9];
s q[9];
h q[9];
h q[10];
s q[10];
s q[10];
h q[10];
h q[10];
cx q[9], q[10];
rz(-pi/4) q[10];
cx q[2], q[10];
rz(pi/4) q[10];
cx q[9], q[10];
rz(pi/4) q[9];
rz(-pi/4) q[10];
cx q[2], q[10];
cx q[2], q[9];
rz(pi/4) q[2];
rz(-pi/4) q[9];
cx q[2], q[9];
rz(pi/4) q[10];
h q[10];
h q[11];
cx q[10], q[11];
rz(-pi/4) q[11];
cx q[3], q[11];
rz(pi/4) q[11];
cx q[10], q[11];
rz(pi/4) q[10];
rz(-pi/4) q[11];
cx q[3], q[11];
cx q[3], q[10];
rz(pi/4) q[3];
rz(-pi/4) q[10];
cx q[3], q[10];
rz(pi/4) q[11];
h q[11];
h q[12];
cx q[11], q[12];
rz(-pi/4) q[12];
cx q[4], q[12];
rz(pi/4) q[12];
cx q[11], q[12];
rz(pi/4) q[11];
rz(-pi/4) q[12];
cx q[4], q[12];
cx q[4], q[11];
rz(pi/4) q[4];
rz(-pi/4) q[11];
cx q[4], q[11];
rz(pi/4) q[12];
h q[12];
h q[12];
s q[12];
s q[12];
h q[12];
cx q[12], q[7];
rz(-pi/4) q[7];
cx q[5], q[7];
rz(pi/4) q[7];
cx q[12], q[7];
rz(-pi/4) q[7];
cx q[5], q[7];
rz(pi/4) q[7];
h q[7];
cx q[7], q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.435845018359336) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
cx q[7], q[6];
rz(-pi) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.435845018359336) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(2*pi) q[6];
cx q[7], q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.136140657982902) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
cx q[7], q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.147044649196684) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
h q[6];
rz(pi/4) q[12];
cx q[5], q[12];
rz(pi/4) q[5];
rz(-pi/4) q[12];
cx q[5], q[12];
h q[5];
s q[5];
s q[5];
h q[5];
h q[12];
s q[12];
s q[12];
h q[12];
h q[12];
cx q[11], q[12];
rz(-pi/4) q[12];
cx q[4], q[12];
rz(pi/4) q[12];
cx q[11], q[12];
rz(pi/4) q[11];
rz(-pi/4) q[12];
cx q[4], q[12];
cx q[4], q[11];
rz(pi/4) q[4];
rz(-pi/4) q[11];
cx q[4], q[11];
h q[11];
cx q[10], q[11];
rz(-pi/4) q[11];
cx q[3], q[11];
rz(pi/4) q[11];
cx q[10], q[11];
rz(pi/4) q[10];
rz(-pi/4) q[11];
cx q[3], q[11];
cx q[3], q[10];
rz(pi/4) q[3];
rz(-pi/4) q[10];
cx q[3], q[10];
h q[10];
s q[10];
s q[10];
h q[10];
h q[10];
cx q[9], q[10];
rz(-pi/4) q[10];
cx q[2], q[10];
rz(pi/4) q[10];
cx q[9], q[10];
rz(pi/4) q[9];
rz(-pi/4) q[10];
cx q[2], q[10];
cx q[2], q[9];
rz(pi/4) q[2];
rz(-pi/4) q[9];
cx q[2], q[9];
h q[2];
s q[2];
s q[2];
h q[2];
h q[9];
s q[9];
s q[9];
h q[9];
h q[9];
cx q[8], q[9];
rz(-pi/4) q[9];
cx q[1], q[9];
rz(pi/4) q[9];
cx q[8], q[9];
rz(pi/4) q[8];
rz(-pi/4) q[9];
cx q[1], q[9];
cx q[1], q[8];
rz(pi/4) q[1];
rz(-pi/4) q[8];
cx q[1], q[8];
cx q[0], q[8];
cx q[0], q[6];
rz(-pi/4) q[6];
cx q[7], q[6];
rz(pi/4) q[6];
cx q[0], q[6];
rz(pi/4) q[0];
rz(-pi/4) q[6];
cx q[7], q[6];
rz(pi/4) q[6];
h q[6];
cx q[7], q[0];
rz(-pi/4) q[0];
rz(pi/4) q[7];
cx q[7], q[0];
cx q[7], q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.147044649196684) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
cx q[7], q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.136140657982902) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
h q[6];
cx q[0], q[6];
rz(-pi/4) q[6];
cx q[7], q[6];
rz(pi/4) q[6];
cx q[0], q[6];
rz(pi/4) q[0];
rz(-pi/4) q[6];
cx q[7], q[6];
rz(pi/4) q[6];
h q[6];
cx q[7], q[0];
rz(-pi/4) q[0];
rz(pi/4) q[7];
cx q[7], q[0];
cx q[0], q[8];
cx q[7], q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.130688662376011) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
cx q[7], q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.152496644803575) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
h q[6];
cx q[1], q[6];
rz(-pi/4) q[6];
cx q[7], q[6];
rz(pi/4) q[6];
cx q[1], q[6];
rz(pi/4) q[1];
rz(-pi/4) q[6];
cx q[7], q[6];
rz(pi/4) q[6];
h q[6];
cx q[7], q[1];
rz(-pi/4) q[1];
rz(pi/4) q[7];
cx q[7], q[1];
cx q[7], q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.152496644803575) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
cx q[7], q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.130688662376011) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
h q[6];
cx q[1], q[6];
rz(-pi/4) q[6];
cx q[7], q[6];
rz(pi/4) q[6];
cx q[1], q[6];
rz(pi/4) q[1];
rz(-pi/4) q[6];
cx q[7], q[6];
rz(pi/4) q[6];
h q[6];
cx q[7], q[1];
rz(-pi/4) q[1];
rz(pi/4) q[7];
cx q[7], q[1];
cx q[7], q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.119784671162229) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
cx q[7], q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.163400636017357) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
h q[6];
cx q[2], q[6];
rz(-pi/4) q[6];
cx q[7], q[6];
rz(pi/4) q[6];
cx q[2], q[6];
rz(pi/4) q[2];
rz(-pi/4) q[6];
cx q[7], q[6];
rz(pi/4) q[6];
h q[6];
cx q[7], q[2];
rz(-pi/4) q[2];
rz(pi/4) q[7];
cx q[7], q[2];
cx q[7], q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.163400636017357) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
cx q[7], q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.119784671162229) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
h q[6];
cx q[2], q[6];
rz(-pi/4) q[6];
cx q[7], q[6];
rz(pi/4) q[6];
cx q[2], q[6];
rz(pi/4) q[2];
rz(-pi/4) q[6];
cx q[7], q[6];
rz(pi/4) q[6];
h q[6];
cx q[7], q[2];
rz(-pi/4) q[2];
rz(pi/4) q[7];
cx q[7], q[2];
h q[2];
s q[2];
s q[2];
h q[2];
cx q[7], q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.097976688734665) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
cx q[7], q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.1852086184449213) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
h q[6];
cx q[3], q[6];
rz(-pi/4) q[6];
cx q[7], q[6];
rz(pi/4) q[6];
cx q[3], q[6];
rz(pi/4) q[3];
rz(-pi/4) q[6];
cx q[7], q[6];
rz(pi/4) q[6];
h q[6];
cx q[7], q[3];
rz(-pi/4) q[3];
rz(pi/4) q[7];
cx q[7], q[3];
cx q[7], q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.1852086184449213) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
cx q[7], q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.097976688734665) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
h q[6];
cx q[3], q[6];
rz(-pi/4) q[6];
cx q[7], q[6];
rz(pi/4) q[6];
cx q[3], q[6];
rz(pi/4) q[3];
rz(-pi/4) q[6];
cx q[7], q[6];
rz(pi/4) q[6];
h q[6];
cx q[7], q[3];
rz(-pi/4) q[3];
rz(pi/4) q[7];
cx q[7], q[3];
cx q[7], q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.054360723879537) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
cx q[7], q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.228824583300049) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
h q[6];
cx q[4], q[6];
rz(-pi/4) q[6];
cx q[7], q[6];
rz(pi/4) q[6];
cx q[4], q[6];
rz(pi/4) q[4];
rz(-pi/4) q[6];
cx q[7], q[6];
rz(pi/4) q[6];
h q[6];
cx q[7], q[4];
rz(-pi/4) q[4];
rz(pi/4) q[7];
cx q[7], q[4];
cx q[7], q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.228824583300049) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
cx q[7], q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.054360723879537) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
h q[6];
cx q[4], q[6];
rz(-pi/4) q[6];
cx q[7], q[6];
rz(pi/4) q[6];
cx q[4], q[6];
rz(pi/4) q[4];
rz(-pi/4) q[6];
cx q[7], q[6];
rz(pi/4) q[6];
h q[6];
cx q[7], q[4];
rz(-pi/4) q[4];
rz(pi/4) q[7];
cx q[7], q[4];
cx q[7], q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(2.9671287941692808) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
cx q[7], q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.3160565130103055) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
h q[6];
cx q[5], q[6];
rz(-pi/4) q[6];
cx q[7], q[6];
rz(pi/4) q[6];
cx q[5], q[6];
rz(pi/4) q[5];
rz(-pi/4) q[6];
cx q[7], q[6];
rz(pi/4) q[6];
h q[6];
cx q[7], q[5];
rz(-pi/4) q[5];
rz(pi/4) q[7];
cx q[7], q[5];
cx q[7], q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.3160565130103055) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
cx q[7], q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(2.9671287941692808) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
h q[6];
cx q[5], q[6];
rz(-pi/4) q[6];
cx q[7], q[6];
rz(pi/4) q[6];
cx q[5], q[6];
rz(pi/4) q[5];
rz(-pi/4) q[6];
cx q[7], q[6];
rz(pi/4) q[6];
h q[6];
cx q[7], q[5];
rz(-pi/4) q[5];
rz(pi/4) q[7];
cx q[7], q[5];
h q[5];
s q[5];
s q[5];
h q[5];
h q[7];
rz(pi/4) q[9];
h q[9];
h q[9];
cx q[8], q[9];
rz(-pi/4) q[9];
cx q[1], q[9];
rz(pi/4) q[9];
cx q[8], q[9];
rz(pi/4) q[8];
rz(-pi/4) q[9];
cx q[1], q[9];
cx q[1], q[8];
rz(pi/4) q[1];
rz(-pi/4) q[8];
cx q[1], q[8];
rz(pi/4) q[9];
h q[9];
h q[9];
s q[9];
s q[9];
h q[9];
rz(pi/4) q[10];
h q[10];
h q[10];
cx q[9], q[10];
rz(-pi/4) q[10];
cx q[2], q[10];
rz(pi/4) q[10];
cx q[9], q[10];
rz(pi/4) q[9];
rz(-pi/4) q[10];
cx q[2], q[10];
cx q[2], q[9];
rz(pi/4) q[2];
rz(-pi/4) q[9];
cx q[2], q[9];
rz(pi/4) q[10];
h q[10];
h q[10];
s q[10];
s q[10];
h q[10];
rz(pi/4) q[11];
h q[11];
h q[11];
cx q[10], q[11];
rz(-pi/4) q[11];
cx q[3], q[11];
rz(pi/4) q[11];
cx q[10], q[11];
rz(pi/4) q[10];
rz(-pi/4) q[11];
cx q[3], q[11];
cx q[3], q[10];
rz(pi/4) q[3];
rz(-pi/4) q[10];
cx q[3], q[10];
rz(pi/4) q[11];
h q[11];
rz(pi/4) q[12];
h q[12];
h q[12];
cx q[11], q[12];
rz(-pi/4) q[12];
cx q[4], q[12];
rz(pi/4) q[12];
cx q[11], q[12];
rz(pi/4) q[11];
rz(-pi/4) q[12];
cx q[4], q[12];
cx q[4], q[11];
rz(pi/4) q[4];
rz(-pi/4) q[11];
cx q[4], q[11];
rz(pi/4) q[12];
h q[12];
h q[12];
s q[12];
s q[12];
h q[12];
cx q[12], q[7];
rz(-pi/4) q[7];
cx q[5], q[7];
rz(pi/4) q[7];
cx q[12], q[7];
rz(-pi/4) q[7];
cx q[5], q[7];
rz(pi/4) q[7];
h q[7];
h q[7];
s q[7];
s q[7];
h q[7];
rz(pi/4) q[12];
cx q[5], q[12];
rz(pi/4) q[5];
rz(-pi/4) q[12];
cx q[5], q[12];
h q[5];
s q[5];
s q[5];
h q[5];
h q[12];
s q[12];
s q[12];
h q[12];
h q[12];
cx q[11], q[12];
rz(-pi/4) q[12];
cx q[4], q[12];
rz(pi/4) q[12];
cx q[11], q[12];
rz(pi/4) q[11];
rz(-pi/4) q[12];
cx q[4], q[12];
cx q[4], q[11];
rz(pi/4) q[4];
rz(-pi/4) q[11];
cx q[4], q[11];
h q[11];
cx q[10], q[11];
rz(-pi/4) q[11];
cx q[3], q[11];
rz(pi/4) q[11];
cx q[10], q[11];
rz(pi/4) q[10];
rz(-pi/4) q[11];
cx q[3], q[11];
cx q[3], q[10];
rz(pi/4) q[3];
rz(-pi/4) q[10];
cx q[3], q[10];
h q[10];
cx q[9], q[10];
rz(-pi/4) q[10];
cx q[2], q[10];
rz(pi/4) q[10];
cx q[9], q[10];
rz(pi/4) q[9];
rz(-pi/4) q[10];
cx q[2], q[10];
cx q[2], q[9];
rz(pi/4) q[2];
rz(-pi/4) q[9];
cx q[2], q[9];
h q[2];
s q[2];
s q[2];
h q[2];
h q[9];
s q[9];
s q[9];
h q[9];
h q[9];
cx q[8], q[9];
rz(-pi/4) q[9];
cx q[1], q[9];
rz(pi/4) q[9];
cx q[8], q[9];
rz(pi/4) q[8];
rz(-pi/4) q[9];
cx q[1], q[9];
cx q[1], q[8];
rz(pi/4) q[1];
rz(-pi/4) q[8];
cx q[1], q[8];
cx q[0], q[8];
rz(pi/4) q[9];
h q[9];
rz(pi/4) q[10];
h q[10];
h q[10];
s q[10];
s q[10];
h q[10];
rz(pi/4) q[11];
h q[11];
rz(pi/4) q[12];
h q[12];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], q[11], q[12];
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
