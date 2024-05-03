OPENQASM 3.0;
include "stdgates.inc";
bit[86] meas;
qubit[86] q;
rz(-pi/2) q[0];
h q[0];
rz(-pi/4) q[0];
h q[0];
rz(5*pi/2) q[0];
h q[0];
rz(-pi/2) q[1];
h q[1];
rz(-0.9553166181245092) q[1];
h q[1];
rz(5*pi/2) q[1];
h q[1];
rz(-pi/2) q[2];
h q[2];
rz(-pi/3) q[2];
h q[2];
rz(5*pi/2) q[2];
h q[2];
rz(-pi/2) q[3];
h q[3];
rz(-1.1071487177940904) q[3];
h q[3];
rz(5*pi/2) q[3];
h q[3];
rz(-pi/2) q[4];
h q[4];
rz(-1.1502619915109316) q[4];
h q[4];
rz(5*pi/2) q[4];
h q[4];
rz(-pi/2) q[5];
h q[5];
rz(-1.183199640139716) q[5];
h q[5];
rz(5*pi/2) q[5];
h q[5];
rz(-pi/2) q[6];
h q[6];
rz(-1.2094292028881888) q[6];
h q[6];
rz(5*pi/2) q[6];
h q[6];
rz(-pi/2) q[7];
h q[7];
rz(-1.2309594173407747) q[7];
h q[7];
rz(5*pi/2) q[7];
h q[7];
rz(-pi/2) q[8];
h q[8];
rz(-1.2490457723982544) q[8];
h q[8];
rz(5*pi/2) q[8];
h q[8];
rz(-pi/2) q[9];
h q[9];
rz(-1.2645189576252271) q[9];
h q[9];
rz(5*pi/2) q[9];
h q[9];
rz(-pi/2) q[10];
h q[10];
rz(-1.277953555066321) q[10];
h q[10];
rz(5*pi/2) q[10];
h q[10];
rz(-pi/2) q[11];
h q[11];
rz(-1.2897614252920828) q[11];
h q[11];
rz(5*pi/2) q[11];
h q[11];
rz(-pi/2) q[12];
h q[12];
rz(-1.3002465638163236) q[12];
h q[12];
rz(5*pi/2) q[12];
h q[12];
rz(-pi/2) q[13];
h q[13];
rz(-1.3096389158918722) q[13];
h q[13];
rz(5*pi/2) q[13];
h q[13];
rz(-pi/2) q[14];
h q[14];
rz(-1.318116071652818) q[14];
h q[14];
rz(5*pi/2) q[14];
h q[14];
rz(-pi/2) q[15];
h q[15];
rz(-1.3258176636680323) q[15];
h q[15];
rz(5*pi/2) q[15];
h q[15];
rz(-pi/2) q[16];
h q[16];
rz(-1.3328552019646882) q[16];
h q[16];
rz(5*pi/2) q[16];
h q[16];
rz(-pi/2) q[17];
h q[17];
rz(-1.3393189628247182) q[17];
h q[17];
rz(5*pi/2) q[17];
h q[17];
rz(-pi/2) q[18];
h q[18];
rz(-1.3452829208967654) q[18];
h q[18];
rz(5*pi/2) q[18];
h q[18];
rz(-pi/2) q[19];
h q[19];
rz(-1.3508083493994372) q[19];
h q[19];
rz(5*pi/2) q[19];
h q[19];
rz(-pi/2) q[20];
h q[20];
rz(-1.3559464937191843) q[20];
h q[20];
rz(5*pi/2) q[20];
h q[20];
rz(-pi/2) q[21];
h q[21];
rz(-1.3607405877236576) q[21];
h q[21];
rz(5*pi/2) q[21];
h q[21];
rz(-pi/2) q[22];
h q[22];
rz(-1.3652273956337226) q[22];
h q[22];
rz(5*pi/2) q[22];
h q[22];
rz(-pi/2) q[23];
h q[23];
rz(-1.3694384060045657) q[23];
h q[23];
rz(5*pi/2) q[23];
h q[23];
rz(-pi/2) q[24];
h q[24];
rz(-1.3734007669450157) q[24];
h q[24];
rz(5*pi/2) q[24];
h q[24];
rz(-pi/2) q[25];
h q[25];
rz(-1.37713802635057) q[25];
h q[25];
rz(5*pi/2) q[25];
h q[25];
rz(-pi/2) q[26];
h q[26];
rz(-1.38067072344843) q[26];
h q[26];
rz(5*pi/2) q[26];
h q[26];
rz(-pi/2) q[27];
h q[27];
rz(-1.384016865713303) q[27];
h q[27];
rz(5*pi/2) q[27];
h q[27];
rz(-pi/2) q[28];
h q[28];
rz(-1.387192316515978) q[28];
h q[28];
rz(5*pi/2) q[28];
h q[28];
rz(-pi/2) q[29];
h q[29];
rz(-1.3902111126041985) q[29];
h q[29];
rz(5*pi/2) q[29];
h q[29];
rz(-pi/2) q[30];
h q[30];
rz(-1.3930857259497849) q[30];
h q[30];
rz(5*pi/2) q[30];
h q[30];
rz(-pi/2) q[31];
h q[31];
rz(-1.3958272811292076) q[31];
h q[31];
rz(5*pi/2) q[31];
h q[31];
rz(-pi/2) q[32];
h q[32];
rz(-1.3984457368955736) q[32];
h q[32];
rz(5*pi/2) q[32];
h q[32];
rz(-pi/2) q[33];
h q[33];
rz(-1.400950038711223) q[33];
h q[33];
rz(5*pi/2) q[33];
h q[33];
rz(-pi/2) q[34];
h q[34];
rz(-1.4033482475752073) q[34];
h q[34];
rz(5*pi/2) q[34];
h q[34];
rz(-pi/2) q[35];
h q[35];
rz(-1.4056476493802696) q[35];
h q[35];
rz(5*pi/2) q[35];
h q[35];
rz(-pi/2) q[36];
h q[36];
rz(-1.4078548481843771) q[36];
h q[36];
rz(5*pi/2) q[36];
h q[36];
rz(-pi/2) q[37];
h q[37];
rz(-1.409975846120432) q[37];
h q[37];
rz(5*pi/2) q[37];
h q[37];
rz(-pi/2) q[38];
h q[38];
rz(-1.412016112149136) q[38];
h q[38];
rz(5*pi/2) q[38];
h q[38];
rz(-pi/2) q[39];
h q[39];
rz(-1.4139806414504958) q[39];
h q[39];
rz(5*pi/2) q[39];
h q[39];
rz(-pi/2) q[40];
h q[40];
rz(-1.4158740069240832) q[40];
h q[40];
rz(5*pi/2) q[40];
h q[40];
rz(-pi/2) q[41];
h q[41];
rz(-1.417700404008042) q[41];
h q[41];
rz(5*pi/2) q[41];
h q[41];
rz(-pi/2) q[42];
h q[42];
rz(-1.419463689817681) q[42];
h q[42];
rz(5*pi/2) q[42];
h q[42];
rz(-pi/2) q[43];
h q[43];
rz(-1.4211674174353792) q[43];
h q[43];
rz(5*pi/2) q[43];
h q[43];
rz(-pi/2) q[44];
h q[44];
rz(-1.4228148660461128) q[44];
h q[44];
rz(5*pi/2) q[44];
h q[44];
rz(-pi/2) q[45];
h q[45];
rz(-1.4244090675006476) q[45];
h q[45];
rz(5*pi/2) q[45];
h q[45];
rz(-pi/2) q[46];
h q[46];
rz(-1.4259528297963369) q[46];
h q[46];
rz(5*pi/2) q[46];
h q[46];
rz(-pi/2) q[47];
h q[47];
rz(-1.4274487578895312) q[47];
h q[47];
rz(5*pi/2) q[47];
h q[47];
rz(-pi/2) q[48];
h q[48];
rz(-1.4288992721907325) q[48];
h q[48];
rz(5*pi/2) q[48];
h q[48];
rz(-pi/2) q[49];
h q[49];
rz(-1.4303066250413763) q[49];
h q[49];
rz(5*pi/2) q[49];
h q[49];
rz(-pi/2) q[50];
h q[50];
rz(-1.431672915427498) q[50];
h q[50];
rz(5*pi/2) q[50];
h q[50];
rz(-pi/2) q[51];
h q[51];
rz(-1.4330001021490115) q[51];
h q[51];
rz(5*pi/2) q[51];
h q[51];
rz(-pi/2) q[52];
h q[52];
rz(-1.4342900156325915) q[52];
h q[52];
rz(5*pi/2) q[52];
h q[52];
rz(-pi/2) q[53];
h q[53];
rz(-1.435544368550241) q[53];
h q[53];
rz(5*pi/2) q[53];
h q[53];
rz(-pi/2) q[54];
h q[54];
rz(-1.4367647653836775) q[54];
h q[54];
rz(5*pi/2) q[54];
h q[54];
rz(-pi/2) q[55];
h q[55];
rz(-1.4379527110560313) q[55];
h q[55];
rz(5*pi/2) q[55];
h q[55];
rz(-pi/2) q[56];
h q[56];
rz(-1.4391096187364805) q[56];
h q[56];
rz(5*pi/2) q[56];
h q[56];
rz(-pi/2) q[57];
h q[57];
rz(-1.4402368169098754) q[57];
h q[57];
rz(5*pi/2) q[57];
h q[57];
rz(-pi/2) q[58];
h q[58];
rz(-1.441335555791786) q[58];
h q[58];
rz(5*pi/2) q[58];
h q[58];
rz(-pi/2) q[59];
h q[59];
rz(-1.4424070131594149) q[59];
h q[59];
rz(5*pi/2) q[59];
h q[59];
rz(-pi/2) q[60];
h q[60];
rz(-1.4434522996602146) q[60];
h q[60];
rz(5*pi/2) q[60];
h q[60];
rz(-pi/2) q[61];
h q[61];
rz(-1.4444724636526147) q[61];
h q[61];
rz(5*pi/2) q[61];
h q[61];
rz(-pi/2) q[62];
h q[62];
rz(-1.445468495626831) q[62];
h q[62];
rz(5*pi/2) q[62];
h q[62];
rz(-pi/2) q[63];
h q[63];
rz(-1.446441332248135) q[63];
h q[63];
rz(5*pi/2) q[63];
h q[63];
rz(-pi/2) q[64];
h q[64];
rz(-1.4473918600601101) q[64];
h q[64];
rz(5*pi/2) q[64];
h q[64];
rz(-pi/2) q[65];
h q[65];
rz(-1.4483209188811768) q[65];
h q[65];
rz(5*pi/2) q[65];
h q[65];
rz(-pi/2) q[66];
h q[66];
rz(-1.449229304923967) q[66];
h q[66];
rz(5*pi/2) q[66];
h q[66];
rz(-pi/2) q[67];
h q[67];
rz(-1.4501177736638868) q[67];
h q[67];
rz(5*pi/2) q[67];
h q[67];
rz(-pi/2) q[68];
h q[68];
rz(-1.4509870424803524) q[68];
h q[68];
rz(5*pi/2) q[68];
h q[68];
rz(-pi/2) q[69];
h q[69];
rz(-1.4518377930916948) q[69];
h q[69];
rz(5*pi/2) q[69];
h q[69];
rz(-pi/2) q[70];
h q[70];
rz(-1.4526706738025112) q[70];
h q[70];
rz(5*pi/2) q[70];
h q[70];
rz(-pi/2) q[71];
h q[71];
rz(-1.4534863015803035) q[71];
h q[71];
rz(5*pi/2) q[71];
h q[71];
rz(-pi/2) q[72];
h q[72];
rz(-1.4542852639765176) q[72];
h q[72];
rz(5*pi/2) q[72];
h q[72];
rz(-pi/2) q[73];
h q[73];
rz(-1.4550681209055838) q[73];
h q[73];
rz(5*pi/2) q[73];
h q[73];
rz(-pi/2) q[74];
h q[74];
rz(-1.45583540629419) q[74];
h q[74];
rz(5*pi/2) q[74];
h q[74];
rz(-pi/2) q[75];
h q[75];
rz(-1.456587629611836) q[75];
h q[75];
rz(5*pi/2) q[75];
h q[75];
rz(-pi/2) q[76];
h q[76];
rz(-1.457325277292633) q[76];
h q[76];
rz(5*pi/2) q[76];
h q[76];
rz(-pi/2) q[77];
h q[77];
rz(-1.4580488140573662) q[77];
h q[77];
rz(5*pi/2) q[77];
h q[77];
rz(-pi/2) q[78];
h q[78];
rz(-1.458758684143987) q[78];
h q[78];
rz(5*pi/2) q[78];
h q[78];
rz(-pi/2) q[79];
h q[79];
rz(-1.4594553124539327) q[79];
h q[79];
rz(5*pi/2) q[79];
h q[79];
rz(-pi/2) q[80];
h q[80];
rz(-1.460139105621001) q[80];
h q[80];
rz(5*pi/2) q[80];
h q[80];
rz(-pi/2) q[81];
h q[81];
rz(-1.460810453008882) q[81];
h q[81];
rz(5*pi/2) q[81];
h q[81];
rz(-pi/2) q[82];
h q[82];
rz(-1.4614697276429123) q[82];
h q[82];
rz(5*pi/2) q[82];
h q[82];
rz(-pi/2) q[83];
h q[83];
rz(-1.4621172870811148) q[83];
h q[83];
rz(5*pi/2) q[83];
h q[83];
rz(-pi/2) q[84];
h q[84];
rz(-1.4627534742291433) q[84];
h q[84];
rz(5*pi/2) q[84];
h q[84];
h q[85];
rz(pi) q[85];
h q[85];
cx q[85], q[84];
h q[84];
rz(0) q[84];
rz(-pi/2) q[84];
h q[84];
rz(1.4627534742291433) q[84];
h q[84];
rz(5*pi/2) q[84];
cx q[84], q[83];
h q[83];
rz(0) q[83];
rz(-pi/2) q[83];
h q[83];
rz(1.4621172870811145) q[83];
h q[83];
rz(5*pi/2) q[83];
cx q[83], q[82];
h q[82];
rz(0) q[82];
rz(-pi/2) q[82];
h q[82];
rz(1.4614697276429123) q[82];
h q[82];
rz(5*pi/2) q[82];
cx q[82], q[81];
h q[81];
rz(0) q[81];
rz(-pi/2) q[81];
h q[81];
rz(1.4608104530088823) q[81];
h q[81];
rz(5*pi/2) q[81];
cx q[81], q[80];
h q[80];
rz(0) q[80];
rz(-pi/2) q[80];
h q[80];
rz(1.4601391056210007) q[80];
h q[80];
rz(5*pi/2) q[80];
cx q[80], q[79];
h q[79];
rz(0) q[79];
rz(-pi/2) q[79];
h q[79];
rz(1.4594553124539331) q[79];
h q[79];
rz(5*pi/2) q[79];
cx q[79], q[78];
h q[78];
rz(0) q[78];
rz(-pi/2) q[78];
h q[78];
rz(1.4587586841439872) q[78];
h q[78];
rz(5*pi/2) q[78];
cx q[78], q[77];
h q[77];
rz(0) q[77];
rz(-pi/2) q[77];
h q[77];
rz(1.4580488140573662) q[77];
h q[77];
rz(5*pi/2) q[77];
cx q[77], q[76];
h q[76];
rz(0) q[76];
rz(-pi/2) q[76];
h q[76];
rz(1.4573252772926333) q[76];
h q[76];
rz(5*pi/2) q[76];
cx q[76], q[75];
h q[75];
rz(0) q[75];
rz(-pi/2) q[75];
h q[75];
rz(1.4565876296118363) q[75];
h q[75];
rz(5*pi/2) q[75];
cx q[75], q[74];
h q[74];
rz(0) q[74];
rz(-pi/2) q[74];
h q[74];
rz(1.4558354062941898) q[74];
h q[74];
rz(5*pi/2) q[74];
cx q[74], q[73];
h q[73];
rz(0) q[73];
rz(-pi/2) q[73];
h q[73];
rz(1.455068120905584) q[73];
h q[73];
rz(5*pi/2) q[73];
cx q[73], q[72];
h q[72];
rz(0) q[72];
rz(-pi/2) q[72];
h q[72];
rz(1.4542852639765176) q[72];
h q[72];
rz(5*pi/2) q[72];
cx q[72], q[71];
h q[71];
rz(0) q[71];
rz(-pi/2) q[71];
h q[71];
rz(1.4534863015803037) q[71];
h q[71];
rz(5*pi/2) q[71];
cx q[71], q[70];
h q[70];
rz(0) q[70];
rz(-pi/2) q[70];
h q[70];
rz(1.452670673802511) q[70];
h q[70];
rz(5*pi/2) q[70];
cx q[70], q[69];
h q[69];
rz(0) q[69];
rz(-pi/2) q[69];
h q[69];
rz(1.4518377930916948) q[69];
h q[69];
rz(5*pi/2) q[69];
cx q[69], q[68];
h q[68];
rz(0) q[68];
rz(-pi/2) q[68];
h q[68];
rz(1.4509870424803522) q[68];
h q[68];
rz(5*pi/2) q[68];
cx q[68], q[67];
h q[67];
rz(0) q[67];
rz(-pi/2) q[67];
h q[67];
rz(1.4501177736638873) q[67];
h q[67];
rz(5*pi/2) q[67];
cx q[67], q[66];
h q[66];
rz(0) q[66];
rz(-pi/2) q[66];
h q[66];
rz(1.4492293049239668) q[66];
h q[66];
rz(5*pi/2) q[66];
cx q[66], q[65];
h q[65];
rz(0) q[65];
rz(-pi/2) q[65];
h q[65];
rz(1.4483209188811763) q[65];
h q[65];
rz(5*pi/2) q[65];
cx q[65], q[64];
h q[64];
rz(0) q[64];
rz(-pi/2) q[64];
h q[64];
rz(1.44739186006011) q[64];
h q[64];
rz(5*pi/2) q[64];
cx q[64], q[63];
h q[63];
rz(0) q[63];
rz(-pi/2) q[63];
h q[63];
rz(1.4464413322481349) q[63];
h q[63];
rz(5*pi/2) q[63];
cx q[63], q[62];
h q[62];
rz(0) q[62];
rz(-pi/2) q[62];
h q[62];
rz(1.445468495626831) q[62];
h q[62];
rz(5*pi/2) q[62];
cx q[62], q[61];
h q[61];
rz(0) q[61];
rz(-pi/2) q[61];
h q[61];
rz(1.4444724636526143) q[61];
h q[61];
rz(5*pi/2) q[61];
cx q[61], q[60];
h q[60];
rz(0) q[60];
rz(-pi/2) q[60];
h q[60];
rz(1.4434522996602146) q[60];
h q[60];
rz(5*pi/2) q[60];
cx q[60], q[59];
h q[59];
rz(0) q[59];
rz(-pi/2) q[59];
h q[59];
rz(1.442407013159415) q[59];
h q[59];
rz(5*pi/2) q[59];
cx q[59], q[58];
h q[58];
rz(0) q[58];
rz(-pi/2) q[58];
h q[58];
rz(1.4413355557917864) q[58];
h q[58];
rz(5*pi/2) q[58];
cx q[58], q[57];
h q[57];
rz(0) q[57];
rz(-pi/2) q[57];
h q[57];
rz(1.4402368169098754) q[57];
h q[57];
rz(5*pi/2) q[57];
cx q[57], q[56];
h q[56];
rz(0) q[56];
rz(-pi/2) q[56];
h q[56];
rz(1.439109618736481) q[56];
h q[56];
rz(5*pi/2) q[56];
cx q[56], q[55];
h q[55];
rz(0) q[55];
rz(-pi/2) q[55];
h q[55];
rz(1.437952711056031) q[55];
h q[55];
rz(5*pi/2) q[55];
cx q[55], q[54];
h q[54];
rz(0) q[54];
rz(-pi/2) q[54];
h q[54];
rz(1.4367647653836775) q[54];
h q[54];
rz(5*pi/2) q[54];
cx q[54], q[53];
h q[53];
rz(0) q[53];
rz(-pi/2) q[53];
h q[53];
rz(1.4355443685502411) q[53];
h q[53];
rz(5*pi/2) q[53];
cx q[53], q[52];
h q[52];
rz(0) q[52];
rz(-pi/2) q[52];
h q[52];
rz(1.434290015632591) q[52];
h q[52];
rz(5*pi/2) q[52];
cx q[52], q[51];
h q[51];
rz(0) q[51];
rz(-pi/2) q[51];
h q[51];
rz(1.4330001021490117) q[51];
h q[51];
rz(5*pi/2) q[51];
cx q[51], q[50];
h q[50];
rz(0) q[50];
rz(-pi/2) q[50];
h q[50];
rz(1.431672915427498) q[50];
h q[50];
rz(5*pi/2) q[50];
cx q[50], q[49];
h q[49];
rz(0) q[49];
rz(-pi/2) q[49];
h q[49];
rz(1.4303066250413767) q[49];
h q[49];
rz(5*pi/2) q[49];
cx q[49], q[48];
h q[48];
rz(0) q[48];
rz(-pi/2) q[48];
h q[48];
rz(1.4288992721907325) q[48];
h q[48];
rz(5*pi/2) q[48];
cx q[48], q[47];
h q[47];
rz(0) q[47];
rz(-pi/2) q[47];
h q[47];
rz(1.4274487578895307) q[47];
h q[47];
rz(5*pi/2) q[47];
cx q[47], q[46];
h q[46];
rz(0) q[46];
rz(-pi/2) q[46];
h q[46];
rz(1.425952829796337) q[46];
h q[46];
rz(5*pi/2) q[46];
cx q[46], q[45];
h q[45];
rz(0) q[45];
rz(-pi/2) q[45];
h q[45];
rz(1.4244090675006476) q[45];
h q[45];
rz(5*pi/2) q[45];
cx q[45], q[44];
h q[44];
rz(0) q[44];
rz(-pi/2) q[44];
h q[44];
rz(1.4228148660461128) q[44];
h q[44];
rz(5*pi/2) q[44];
cx q[44], q[43];
h q[43];
rz(0) q[43];
rz(-pi/2) q[43];
h q[43];
rz(1.4211674174353792) q[43];
h q[43];
rz(5*pi/2) q[43];
cx q[43], q[42];
h q[42];
rz(0) q[42];
rz(-pi/2) q[42];
h q[42];
rz(1.4194636898176807) q[42];
h q[42];
rz(5*pi/2) q[42];
cx q[42], q[41];
h q[41];
rz(0) q[41];
rz(-pi/2) q[41];
h q[41];
rz(1.417700404008042) q[41];
h q[41];
rz(5*pi/2) q[41];
cx q[41], q[40];
h q[40];
rz(0) q[40];
rz(-pi/2) q[40];
h q[40];
rz(1.4158740069240832) q[40];
h q[40];
rz(5*pi/2) q[40];
cx q[40], q[39];
h q[39];
rz(0) q[39];
rz(-pi/2) q[39];
h q[39];
rz(1.4139806414504958) q[39];
h q[39];
rz(5*pi/2) q[39];
cx q[39], q[38];
h q[38];
rz(0) q[38];
rz(-pi/2) q[38];
h q[38];
rz(1.4120161121491357) q[38];
h q[38];
rz(5*pi/2) q[38];
cx q[38], q[37];
h q[37];
rz(0) q[37];
rz(-pi/2) q[37];
h q[37];
rz(1.4099758461204317) q[37];
h q[37];
rz(5*pi/2) q[37];
cx q[37], q[36];
h q[36];
rz(0) q[36];
rz(-pi/2) q[36];
h q[36];
rz(1.4078548481843773) q[36];
h q[36];
rz(5*pi/2) q[36];
cx q[36], q[35];
h q[35];
rz(0) q[35];
rz(-pi/2) q[35];
h q[35];
rz(1.4056476493802696) q[35];
h q[35];
rz(5*pi/2) q[35];
cx q[35], q[34];
h q[34];
rz(0) q[34];
rz(-pi/2) q[34];
h q[34];
rz(1.4033482475752077) q[34];
h q[34];
rz(5*pi/2) q[34];
cx q[34], q[33];
h q[33];
rz(0) q[33];
rz(-pi/2) q[33];
h q[33];
rz(1.4009500387112226) q[33];
h q[33];
rz(5*pi/2) q[33];
cx q[33], q[32];
h q[32];
rz(0) q[32];
rz(-pi/2) q[32];
h q[32];
rz(1.3984457368955736) q[32];
h q[32];
rz(5*pi/2) q[32];
cx q[32], q[31];
h q[31];
rz(0) q[31];
rz(-pi/2) q[31];
h q[31];
rz(1.3958272811292076) q[31];
h q[31];
rz(5*pi/2) q[31];
cx q[31], q[30];
h q[30];
rz(0) q[30];
rz(-pi/2) q[30];
h q[30];
rz(1.3930857259497849) q[30];
h q[30];
rz(5*pi/2) q[30];
cx q[30], q[29];
h q[29];
rz(0) q[29];
rz(-pi/2) q[29];
h q[29];
rz(1.3902111126041987) q[29];
h q[29];
rz(5*pi/2) q[29];
cx q[29], q[28];
h q[28];
rz(0) q[28];
rz(-pi/2) q[28];
h q[28];
rz(1.3871923165159785) q[28];
h q[28];
rz(5*pi/2) q[28];
cx q[28], q[27];
h q[27];
rz(0) q[27];
rz(-pi/2) q[27];
h q[27];
rz(1.3840168657133027) q[27];
h q[27];
rz(5*pi/2) q[27];
cx q[27], q[26];
h q[26];
rz(0) q[26];
rz(-pi/2) q[26];
h q[26];
rz(1.3806707234484303) q[26];
h q[26];
rz(5*pi/2) q[26];
cx q[26], q[25];
h q[25];
rz(0) q[25];
rz(-pi/2) q[25];
h q[25];
rz(1.3771380263505701) q[25];
h q[25];
rz(5*pi/2) q[25];
cx q[25], q[24];
h q[24];
rz(0) q[24];
rz(-pi/2) q[24];
h q[24];
rz(1.3734007669450161) q[24];
h q[24];
rz(5*pi/2) q[24];
cx q[24], q[23];
h q[23];
rz(0) q[23];
rz(-pi/2) q[23];
h q[23];
rz(1.3694384060045657) q[23];
h q[23];
rz(5*pi/2) q[23];
cx q[23], q[22];
h q[22];
rz(0) q[22];
rz(-pi/2) q[22];
h q[22];
rz(1.3652273956337222) q[22];
h q[22];
rz(5*pi/2) q[22];
cx q[22], q[21];
h q[21];
rz(0) q[21];
rz(-pi/2) q[21];
h q[21];
rz(1.360740587723658) q[21];
h q[21];
rz(5*pi/2) q[21];
cx q[21], q[20];
h q[20];
rz(0) q[20];
rz(-pi/2) q[20];
h q[20];
rz(1.355946493719184) q[20];
h q[20];
rz(5*pi/2) q[20];
cx q[20], q[19];
h q[19];
rz(0) q[19];
rz(-pi/2) q[19];
h q[19];
rz(1.3508083493994372) q[19];
h q[19];
rz(5*pi/2) q[19];
cx q[19], q[18];
h q[18];
rz(0) q[18];
rz(-pi/2) q[18];
h q[18];
rz(1.3452829208967652) q[18];
h q[18];
rz(5*pi/2) q[18];
cx q[18], q[17];
h q[17];
rz(0) q[17];
rz(-pi/2) q[17];
h q[17];
rz(1.3393189628247182) q[17];
h q[17];
rz(5*pi/2) q[17];
cx q[17], q[16];
h q[16];
rz(0) q[16];
rz(-pi/2) q[16];
h q[16];
rz(1.332855201964688) q[16];
h q[16];
rz(5*pi/2) q[16];
cx q[16], q[15];
h q[15];
rz(0) q[15];
rz(-pi/2) q[15];
h q[15];
rz(1.3258176636680323) q[15];
h q[15];
rz(5*pi/2) q[15];
cx q[15], q[14];
h q[14];
rz(0) q[14];
rz(-pi/2) q[14];
h q[14];
rz(1.3181160716528177) q[14];
h q[14];
rz(5*pi/2) q[14];
cx q[14], q[13];
h q[13];
rz(0) q[13];
rz(-pi/2) q[13];
h q[13];
rz(1.3096389158918722) q[13];
h q[13];
rz(5*pi/2) q[13];
cx q[13], q[12];
h q[12];
rz(0) q[12];
rz(-pi/2) q[12];
h q[12];
rz(1.3002465638163239) q[12];
h q[12];
rz(5*pi/2) q[12];
cx q[12], q[11];
h q[11];
rz(0) q[11];
rz(-pi/2) q[11];
h q[11];
rz(1.2897614252920828) q[11];
h q[11];
rz(5*pi/2) q[11];
cx q[11], q[10];
h q[10];
rz(0) q[10];
rz(-pi/2) q[10];
h q[10];
rz(1.277953555066321) q[10];
h q[10];
rz(5*pi/2) q[10];
cx q[10], q[9];
h q[9];
rz(0) q[9];
rz(-pi/2) q[9];
h q[9];
rz(1.264518957625227) q[9];
h q[9];
rz(5*pi/2) q[9];
cx q[9], q[8];
h q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(1.2490457723982544) q[8];
h q[8];
rz(5*pi/2) q[8];
cx q[8], q[7];
h q[7];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(1.2309594173407747) q[7];
h q[7];
rz(5*pi/2) q[7];
cx q[7], q[6];
h q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(1.209429202888189) q[6];
h q[6];
rz(5*pi/2) q[6];
cx q[6], q[5];
h q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(1.1831996401397156) q[5];
h q[5];
rz(5*pi/2) q[5];
cx q[5], q[4];
h q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(1.1502619915109316) q[4];
h q[4];
rz(5*pi/2) q[4];
cx q[4], q[3];
h q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(1.1071487177940904) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[3], q[2];
h q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(pi/3) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[2], q[1];
h q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.9553166181245096) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[1], q[0];
h q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(pi/4) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[84], q[85];
cx q[83], q[84];
cx q[82], q[83];
cx q[81], q[82];
cx q[80], q[81];
cx q[79], q[80];
cx q[78], q[79];
cx q[77], q[78];
cx q[76], q[77];
cx q[75], q[76];
cx q[74], q[75];
cx q[73], q[74];
cx q[72], q[73];
cx q[71], q[72];
cx q[70], q[71];
cx q[69], q[70];
cx q[68], q[69];
cx q[67], q[68];
cx q[66], q[67];
cx q[65], q[66];
cx q[64], q[65];
cx q[63], q[64];
cx q[62], q[63];
cx q[61], q[62];
cx q[60], q[61];
cx q[59], q[60];
cx q[58], q[59];
cx q[57], q[58];
cx q[56], q[57];
cx q[55], q[56];
cx q[54], q[55];
cx q[53], q[54];
cx q[52], q[53];
cx q[51], q[52];
cx q[50], q[51];
cx q[49], q[50];
cx q[48], q[49];
cx q[47], q[48];
cx q[46], q[47];
cx q[45], q[46];
cx q[44], q[45];
cx q[43], q[44];
cx q[42], q[43];
cx q[41], q[42];
cx q[40], q[41];
cx q[39], q[40];
cx q[38], q[39];
cx q[37], q[38];
cx q[36], q[37];
cx q[35], q[36];
cx q[34], q[35];
cx q[33], q[34];
cx q[32], q[33];
cx q[31], q[32];
cx q[30], q[31];
cx q[29], q[30];
cx q[28], q[29];
cx q[27], q[28];
cx q[26], q[27];
cx q[25], q[26];
cx q[24], q[25];
cx q[23], q[24];
cx q[22], q[23];
cx q[21], q[22];
cx q[20], q[21];
cx q[19], q[20];
cx q[18], q[19];
cx q[17], q[18];
cx q[16], q[17];
cx q[15], q[16];
cx q[14], q[15];
cx q[13], q[14];
cx q[12], q[13];
cx q[11], q[12];
cx q[10], q[11];
cx q[9], q[10];
cx q[8], q[9];
cx q[7], q[8];
cx q[6], q[7];
cx q[5], q[6];
cx q[4], q[5];
cx q[3], q[4];
cx q[2], q[3];
cx q[1], q[2];
cx q[0], q[1];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], q[11], q[12], q[13], q[14], q[15], q[16], q[17], q[18], q[19], q[20], q[21], q[22], q[23], q[24], q[25], q[26], q[27], q[28], q[29], q[30], q[31], q[32], q[33], q[34], q[35], q[36], q[37], q[38], q[39], q[40], q[41], q[42], q[43], q[44], q[45], q[46], q[47], q[48], q[49], q[50], q[51], q[52], q[53], q[54], q[55], q[56], q[57], q[58], q[59], q[60], q[61], q[62], q[63], q[64], q[65], q[66], q[67], q[68], q[69], q[70], q[71], q[72], q[73], q[74], q[75], q[76], q[77], q[78], q[79], q[80], q[81], q[82], q[83], q[84], q[85];
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
meas[14] = measure q[14];
meas[15] = measure q[15];
meas[16] = measure q[16];
meas[17] = measure q[17];
meas[18] = measure q[18];
meas[19] = measure q[19];
meas[20] = measure q[20];
meas[21] = measure q[21];
meas[22] = measure q[22];
meas[23] = measure q[23];
meas[24] = measure q[24];
meas[25] = measure q[25];
meas[26] = measure q[26];
meas[27] = measure q[27];
meas[28] = measure q[28];
meas[29] = measure q[29];
meas[30] = measure q[30];
meas[31] = measure q[31];
meas[32] = measure q[32];
meas[33] = measure q[33];
meas[34] = measure q[34];
meas[35] = measure q[35];
meas[36] = measure q[36];
meas[37] = measure q[37];
meas[38] = measure q[38];
meas[39] = measure q[39];
meas[40] = measure q[40];
meas[41] = measure q[41];
meas[42] = measure q[42];
meas[43] = measure q[43];
meas[44] = measure q[44];
meas[45] = measure q[45];
meas[46] = measure q[46];
meas[47] = measure q[47];
meas[48] = measure q[48];
meas[49] = measure q[49];
meas[50] = measure q[50];
meas[51] = measure q[51];
meas[52] = measure q[52];
meas[53] = measure q[53];
meas[54] = measure q[54];
meas[55] = measure q[55];
meas[56] = measure q[56];
meas[57] = measure q[57];
meas[58] = measure q[58];
meas[59] = measure q[59];
meas[60] = measure q[60];
meas[61] = measure q[61];
meas[62] = measure q[62];
meas[63] = measure q[63];
meas[64] = measure q[64];
meas[65] = measure q[65];
meas[66] = measure q[66];
meas[67] = measure q[67];
meas[68] = measure q[68];
meas[69] = measure q[69];
meas[70] = measure q[70];
meas[71] = measure q[71];
meas[72] = measure q[72];
meas[73] = measure q[73];
meas[74] = measure q[74];
meas[75] = measure q[75];
meas[76] = measure q[76];
meas[77] = measure q[77];
meas[78] = measure q[78];
meas[79] = measure q[79];
meas[80] = measure q[80];
meas[81] = measure q[81];
meas[82] = measure q[82];
meas[83] = measure q[83];
meas[84] = measure q[84];
meas[85] = measure q[85];
