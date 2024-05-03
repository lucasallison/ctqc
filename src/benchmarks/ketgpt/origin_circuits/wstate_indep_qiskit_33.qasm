// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// Qiskit version: {'qiskit-terra': '0.24.1', 'qiskit-aer': '0.12.0', 'qiskit-ignis': None, 'qiskit-ibmq-provider': '0.20.2', 'qiskit': '0.43.1', 'qiskit-nature': '0.6.2', 'qiskit-finance': '0.3.4', 'qiskit-optimization': '0.5.0', 'qiskit-machine-learning': '0.6.1'}

OPENQASM 2.0;
include "qelib1.inc";
qreg q[33];
creg meas[33];
ry(-pi/4) q[0];
ry(-0.9553166181245093) q[1];
ry(-pi/3) q[2];
ry(-1.1071487177940904) q[3];
ry(-1.1502619915109316) q[4];
ry(-1.183199640139716) q[5];
ry(-1.2094292028881888) q[6];
ry(-1.2309594173407747) q[7];
ry(-1.2490457723982544) q[8];
ry(-1.2645189576252271) q[9];
ry(-1.277953555066321) q[10];
ry(-1.2897614252920828) q[11];
ry(-1.3002465638163236) q[12];
ry(-1.3096389158918722) q[13];
ry(-1.318116071652818) q[14];
ry(-1.3258176636680323) q[15];
ry(-1.3328552019646882) q[16];
ry(-1.3393189628247182) q[17];
ry(-1.3452829208967654) q[18];
ry(-1.3508083493994372) q[19];
ry(-1.3559464937191843) q[20];
ry(-1.3607405877236576) q[21];
ry(-1.3652273956337226) q[22];
ry(-1.3694384060045657) q[23];
ry(-1.3734007669450157) q[24];
ry(-1.37713802635057) q[25];
ry(-1.38067072344843) q[26];
ry(-1.384016865713303) q[27];
ry(-1.387192316515978) q[28];
ry(-1.3902111126041985) q[29];
ry(-1.3930857259497849) q[30];
ry(-1.3958272811292076) q[31];
x q[32];
cz q[32],q[31];
ry(1.3958272811292076) q[31];
cz q[31],q[30];
ry(1.3930857259497849) q[30];
cz q[30],q[29];
ry(1.3902111126041985) q[29];
cz q[29],q[28];
ry(1.387192316515978) q[28];
cz q[28],q[27];
ry(1.384016865713303) q[27];
cz q[27],q[26];
ry(1.38067072344843) q[26];
cz q[26],q[25];
ry(1.37713802635057) q[25];
cz q[25],q[24];
ry(1.3734007669450157) q[24];
cz q[24],q[23];
ry(1.3694384060045657) q[23];
cz q[23],q[22];
ry(1.3652273956337226) q[22];
cz q[22],q[21];
ry(1.3607405877236576) q[21];
cz q[21],q[20];
ry(1.3559464937191843) q[20];
cz q[20],q[19];
ry(1.3508083493994372) q[19];
cz q[19],q[18];
ry(1.3452829208967654) q[18];
cz q[18],q[17];
ry(1.3393189628247182) q[17];
cz q[17],q[16];
ry(1.3328552019646882) q[16];
cz q[16],q[15];
ry(1.3258176636680323) q[15];
cz q[15],q[14];
ry(1.318116071652818) q[14];
cz q[14],q[13];
ry(1.3096389158918722) q[13];
cz q[13],q[12];
ry(1.3002465638163236) q[12];
cz q[12],q[11];
ry(1.2897614252920828) q[11];
cz q[11],q[10];
ry(1.277953555066321) q[10];
cz q[10],q[9];
cx q[31],q[32];
cx q[30],q[31];
cx q[29],q[30];
cx q[28],q[29];
cx q[27],q[28];
cx q[26],q[27];
cx q[25],q[26];
cx q[24],q[25];
cx q[23],q[24];
cx q[22],q[23];
cx q[21],q[22];
cx q[20],q[21];
cx q[19],q[20];
cx q[18],q[19];
cx q[17],q[18];
cx q[16],q[17];
cx q[15],q[16];
cx q[14],q[15];
cx q[13],q[14];
cx q[12],q[13];
cx q[11],q[12];
cx q[10],q[11];
ry(1.2645189576252271) q[9];
cz q[9],q[8];
ry(1.2490457723982544) q[8];
cz q[8],q[7];
ry(1.2309594173407747) q[7];
cz q[7],q[6];
ry(1.2094292028881888) q[6];
cz q[6],q[5];
ry(1.183199640139716) q[5];
cz q[5],q[4];
ry(1.1502619915109316) q[4];
cz q[4],q[3];
ry(1.1071487177940904) q[3];
cz q[3],q[2];
ry(pi/3) q[2];
cz q[2],q[1];
ry(0.9553166181245093) q[1];
cz q[1],q[0];
ry(pi/4) q[0];
cx q[9],q[10];
cx q[8],q[9];
cx q[7],q[8];
cx q[6],q[7];
cx q[5],q[6];
cx q[4],q[5];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9],q[10],q[11],q[12],q[13],q[14],q[15],q[16],q[17],q[18],q[19],q[20],q[21],q[22],q[23],q[24],q[25],q[26],q[27],q[28],q[29],q[30],q[31],q[32];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
measure q[6] -> meas[6];
measure q[7] -> meas[7];
measure q[8] -> meas[8];
measure q[9] -> meas[9];
measure q[10] -> meas[10];
measure q[11] -> meas[11];
measure q[12] -> meas[12];
measure q[13] -> meas[13];
measure q[14] -> meas[14];
measure q[15] -> meas[15];
measure q[16] -> meas[16];
measure q[17] -> meas[17];
measure q[18] -> meas[18];
measure q[19] -> meas[19];
measure q[20] -> meas[20];
measure q[21] -> meas[21];
measure q[22] -> meas[22];
measure q[23] -> meas[23];
measure q[24] -> meas[24];
measure q[25] -> meas[25];
measure q[26] -> meas[26];
measure q[27] -> meas[27];
measure q[28] -> meas[28];
measure q[29] -> meas[29];
measure q[30] -> meas[30];
measure q[31] -> meas[31];
measure q[32] -> meas[32];
