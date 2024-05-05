OPENQASM 3.0;
include "stdgates.inc";
bit[35] c;
qubit[35] q;
qubit[1] psi;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];
h q[12];
h q[13];
h q[14];
h q[15];
h q[16];
h q[17];
h q[18];
h q[19];
h q[20];
h q[21];
h q[22];
h q[23];
h q[24];
h q[25];
h q[26];
h q[27];
h q[28];
h q[29];
h q[30];
h q[31];
h q[32];
h q[33];
h q[34];
h psi[0];
rz(pi) psi[0];
h psi[0];
rz(2.917203377732919) psi[0];
cx psi[0], q[0];
rz(-0.224389275856874) q[0];
cx psi[0], q[0];
rz(0.224389275856874) q[0];
cx psi[0], q[1];
rz(-0.448778551713748) q[1];
cx psi[0], q[1];
rz(0.448778551713748) q[1];
cx psi[0], q[2];
rz(-0.897557103427496) q[2];
cx psi[0], q[2];
rz(0.897557103427496) q[2];
cx psi[0], q[3];
rz(1.3464784467348012) q[3];
cx psi[0], q[3];
rz(-1.3464784467348012) q[3];
cx psi[0], q[4];
rz(-0.4486357601201907) q[4];
cx psi[0], q[4];
rz(0.4486357601201907) q[4];
cx psi[0], q[5];
rz(-0.8972715202403814) q[5];
cx psi[0], q[5];
rz(0.8972715202403814) q[5];
cx psi[0], q[6];
rz(1.3470496131090304) q[6];
cx psi[0], q[6];
rz(-1.3470496131090304) q[6];
cx psi[0], q[7];
rz(-0.4474934273717322) q[7];
cx psi[0], q[7];
rz(0.4474934273717322) q[7];
cx psi[0], q[8];
rz(-0.8949868547434644) q[8];
cx psi[0], q[8];
rz(0.8949868547434644) q[8];
cx psi[0], q[9];
rz(1.3516189441028643) q[9];
cx psi[0], q[9];
rz(-1.3516189441028643) q[9];
cx psi[0], q[10];
rz(-0.43835476538406437) q[10];
cx psi[0], q[10];
rz(0.43835476538406437) q[10];
cx psi[0], q[11];
rz(-0.8767095307681287) q[11];
cx psi[0], q[11];
rz(0.8767095307681287) q[11];
cx psi[0], q[12];
rz(1.3881735920535356) q[12];
cx psi[0], q[12];
rz(-1.3881735920535356) q[12];
cx psi[0], q[13];
rz(-0.36524546948272196) q[13];
cx psi[0], q[13];
rz(0.36524546948272196) q[13];
cx psi[0], q[14];
rz(-0.7304909389654439) q[14];
cx psi[0], q[14];
rz(0.7304909389654439) q[14];
cx psi[0], q[15];
rz(-1.4609818779308879) q[15];
cx psi[0], q[15];
rz(1.4609818779308879) q[15];
cx psi[0], q[16];
rz(0.21962889772801722) q[16];
cx psi[0], q[16];
rz(-0.21962889772801722) q[16];
cx psi[0], q[17];
rz(0.43925779545603444) q[17];
cx psi[0], q[17];
rz(-2.0100421380260256) q[17];
cx psi[0], q[18];
rz(0.8785155909120689) q[18];
cx psi[0], q[18];
rz(-0.8785155909120689) q[18];
cx q[16], q[18];
cx q[18], q[16];
cx q[16], q[18];
rz(-1.5707723583450859) q[16];
rz(-pi/524288) q[18];
rz(-1.5707843425699912) q[18];
cx psi[0], q[19];
rz(-1.3845614717656554) q[19];
cx psi[0], q[19];
rz(1.3845614717656554) q[19];
cx q[15], q[19];
cx q[19], q[15];
cx q[15], q[19];
rz(-1.5707483898952752) q[15];
rz(-pi/1048576) q[19];
rz(-1.570790334682444) q[19];
cx psi[0], q[20];
rz(0.37246971005848223) q[20];
cx psi[0], q[20];
rz(-0.37246971005848223) q[20];
cx q[14], q[20];
cx q[20], q[14];
cx q[14], q[20];
rz(-1.5707004529956536) q[14];
rz(-pi/2097152) q[20];
rz(-1.5707933307386703) q[20];
cx psi[0], q[21];
rz(0.7449394201169645) q[21];
cx psi[0], q[21];
rz(-0.7449394201169645) q[21];
cx q[13], q[21];
cx q[21], q[13];
cx q[13], q[21];
rz(-1.5706045791964107) q[13];
rz(-pi/4194304) q[21];
rz(-1.5707948287667834) q[21];
cx psi[0], q[22];
rz(1.489878840233929) q[22];
cx psi[0], q[22];
rz(-1.489878840233929) q[22];
cx q[12], q[22];
cx q[22], q[12];
cx q[12], q[22];
rz(-1.570412831597925) q[12];
rz(-pi/8388608) q[22];
rz(-1.57079557778084) q[22];
cx psi[0], q[23];
rz(-0.16183497312193515) q[23];
cx psi[0], q[23];
rz(0.16183497312193515) q[23];
cx q[11], q[23];
cx q[23], q[11];
cx q[11], q[23];
rz(-1.5700293364009537) q[11];
rz(-pi/16777216) q[23];
rz(-1.5707959522878683) q[23];
cx psi[0], q[24];
rz(-0.3236699462438703) q[24];
cx psi[0], q[24];
rz(0.3236699462438703) q[24];
cx q[10], q[24];
cx q[24], q[10];
cx q[10], q[24];
rz(-1.569262346007011) q[10];
rz(-pi/33554432) q[24];
rz(-1.5707961395413825) q[24];
cx psi[0], q[25];
rz(-0.6473398924877406) q[25];
cx psi[0], q[25];
rz(0.6473398924877406) q[25];
cx q[9], q[25];
cx q[25], q[9];
cx q[9], q[25];
rz(-1.5677283652191254) q[9];
rz(-pi/67108864) q[25];
rz(-1.5707962331681395) q[25];
cx psi[0], q[26];
rz(-1.2946797849754812) q[26];
cx psi[0], q[26];
rz(1.2946797849754812) q[26];
cx q[8], q[26];
cx q[26], q[8];
cx q[8], q[26];
rz(-1.564660403643354) q[8];
rz(-pi/134217728) q[26];
rz(-1.570796279981518) q[26];
cx psi[0], q[27];
rz(0.5522330836388308) q[27];
cx psi[0], q[27];
rz(-0.5522330836388308) q[27];
cx q[7], q[27];
cx q[27], q[7];
cx q[7], q[27];
rz(-1.5585244804918115) q[7];
rz(-pi/268435456) q[27];
rz(-1.5707963033882073) q[27];
cx psi[0], q[28];
rz(1.1044661672776617) q[28];
cx psi[0], q[28];
rz(-1.1044661672776617) q[28];
cx q[6], q[28];
cx q[28], q[6];
cx q[6], q[28];
rz(-1.5462526341887264) q[6];
rz(-pi/536870912) q[28];
rz(-1.570796315091552) q[28];
cx psi[0], q[29];
rz(-0.9326603190344698) q[29];
cx psi[0], q[29];
rz(0.9326603190344698) q[29];
cx q[5], q[29];
cx q[29], q[5];
cx q[5], q[29];
rz(-1.521708941582556) q[5];
rz(-pi/1073741824) q[29];
rz(-1.5707963209432243) q[29];
cx psi[0], q[30];
rz(1.2762720155208536) q[30];
cx psi[0], q[30];
rz(-1.2762720155208536) q[30];
cx q[4], q[30];
cx q[30], q[4];
cx q[4], q[30];
rz(-1.4726215563702154) q[4];
rz(-pi/2147483648) q[30];
rz(-1.5707963238690605) q[30];
cx psi[0], q[31];
rz(-3*pi/16) q[31];
cx psi[0], q[31];
rz(3*pi/16) q[31];
cx q[3], q[31];
cx q[31], q[3];
cx q[3], q[31];
rz(-7*pi/16) q[3];
rz(0) q[31];
rz(-1.5707963253319785) q[31];
cx psi[0], q[32];
rz(-3*pi/8) q[32];
cx psi[0], q[32];
rz(3*pi/8) q[32];
cx q[2], q[32];
cx q[32], q[2];
cx q[2], q[32];
rz(-3*pi/8) q[2];
rz(0) q[32];
rz(-pi/2) q[32];
cx psi[0], q[33];
rz(pi/4) q[33];
cx psi[0], q[33];
rz(-pi/4) q[33];
cx q[1], q[33];
cx q[33], q[1];
cx q[1], q[33];
rz(-pi/4) q[1];
rz(0) q[33];
rz(-pi/2) q[33];
cx psi[0], q[34];
rz(-pi/2) q[34];
cx psi[0], q[34];
rz(pi/2) q[34];
cx q[0], q[34];
cx q[34], q[0];
cx q[0], q[34];
h q[0];
cx q[1], q[0];
rz(pi/4) q[0];
cx q[1], q[0];
rz(-pi/4) q[0];
h q[1];
cx q[2], q[0];
rz(pi/8) q[0];
cx q[2], q[0];
rz(-pi/8) q[0];
cx q[2], q[1];
rz(pi/4) q[1];
cx q[2], q[1];
rz(-pi/4) q[1];
h q[2];
cx q[3], q[0];
rz(pi/16) q[0];
cx q[3], q[0];
rz(-pi/16) q[0];
cx q[3], q[1];
rz(pi/8) q[1];
cx q[3], q[1];
rz(-pi/8) q[1];
cx q[3], q[2];
rz(pi/4) q[2];
cx q[3], q[2];
rz(-pi/4) q[2];
h q[3];
cx q[4], q[0];
rz(pi/32) q[0];
cx q[4], q[0];
rz(-pi/32) q[0];
cx q[4], q[1];
rz(pi/16) q[1];
cx q[4], q[1];
rz(-pi/16) q[1];
cx q[4], q[2];
rz(pi/8) q[2];
cx q[4], q[2];
rz(-pi/8) q[2];
cx q[4], q[3];
rz(pi/4) q[3];
cx q[4], q[3];
rz(-pi/4) q[3];
h q[4];
cx q[5], q[0];
rz(pi/64) q[0];
cx q[5], q[0];
rz(-pi/64) q[0];
cx q[5], q[1];
rz(pi/32) q[1];
cx q[5], q[1];
rz(-pi/32) q[1];
cx q[5], q[2];
rz(pi/16) q[2];
cx q[5], q[2];
rz(-pi/16) q[2];
cx q[5], q[3];
rz(pi/8) q[3];
cx q[5], q[3];
rz(-pi/8) q[3];
cx q[5], q[4];
rz(pi/4) q[4];
cx q[5], q[4];
rz(-pi/4) q[4];
h q[5];
cx q[6], q[0];
rz(pi/128) q[0];
cx q[6], q[0];
rz(-pi/128) q[0];
cx q[6], q[1];
rz(pi/64) q[1];
cx q[6], q[1];
rz(-pi/64) q[1];
cx q[6], q[2];
rz(pi/32) q[2];
cx q[6], q[2];
rz(-pi/32) q[2];
cx q[6], q[3];
rz(pi/16) q[3];
cx q[6], q[3];
rz(-pi/16) q[3];
cx q[6], q[4];
rz(pi/8) q[4];
cx q[6], q[4];
rz(-pi/8) q[4];
cx q[6], q[5];
rz(pi/4) q[5];
cx q[6], q[5];
rz(-pi/4) q[5];
h q[6];
cx q[7], q[0];
rz(pi/256) q[0];
cx q[7], q[0];
rz(-pi/256) q[0];
cx q[7], q[1];
rz(pi/128) q[1];
cx q[7], q[1];
rz(-pi/128) q[1];
cx q[7], q[2];
rz(pi/64) q[2];
cx q[7], q[2];
rz(-pi/64) q[2];
cx q[7], q[3];
rz(pi/32) q[3];
cx q[7], q[3];
rz(-pi/32) q[3];
cx q[7], q[4];
rz(pi/16) q[4];
cx q[7], q[4];
rz(-pi/16) q[4];
cx q[7], q[5];
rz(pi/8) q[5];
cx q[7], q[5];
rz(-pi/8) q[5];
cx q[7], q[6];
rz(pi/4) q[6];
cx q[7], q[6];
rz(-pi/4) q[6];
h q[7];
cx q[8], q[0];
rz(pi/512) q[0];
cx q[8], q[0];
rz(-pi/512) q[0];
cx q[8], q[1];
rz(pi/256) q[1];
cx q[8], q[1];
rz(-pi/256) q[1];
cx q[8], q[2];
rz(pi/128) q[2];
cx q[8], q[2];
rz(-pi/128) q[2];
cx q[8], q[3];
rz(pi/64) q[3];
cx q[8], q[3];
rz(-pi/64) q[3];
cx q[8], q[4];
rz(pi/32) q[4];
cx q[8], q[4];
rz(-pi/32) q[4];
cx q[8], q[5];
rz(pi/16) q[5];
cx q[8], q[5];
rz(-pi/16) q[5];
cx q[8], q[6];
rz(pi/8) q[6];
cx q[8], q[6];
rz(-pi/8) q[6];
cx q[8], q[7];
rz(pi/4) q[7];
cx q[8], q[7];
rz(-pi/4) q[7];
h q[8];
cx q[9], q[0];
rz(pi/1024) q[0];
cx q[9], q[0];
rz(-pi/1024) q[0];
cx q[9], q[1];
rz(pi/512) q[1];
cx q[9], q[1];
rz(-pi/512) q[1];
cx q[9], q[2];
rz(pi/256) q[2];
cx q[9], q[2];
rz(-pi/256) q[2];
cx q[9], q[3];
rz(pi/128) q[3];
cx q[9], q[3];
rz(-pi/128) q[3];
cx q[9], q[4];
rz(pi/64) q[4];
cx q[9], q[4];
rz(-pi/64) q[4];
cx q[9], q[5];
rz(pi/32) q[5];
cx q[9], q[5];
rz(-pi/32) q[5];
cx q[9], q[6];
rz(pi/16) q[6];
cx q[9], q[6];
rz(-pi/16) q[6];
cx q[9], q[7];
rz(pi/8) q[7];
cx q[9], q[7];
rz(-pi/8) q[7];
cx q[9], q[8];
rz(pi/4) q[8];
cx q[9], q[8];
rz(-pi/4) q[8];
h q[9];
cx q[10], q[0];
rz(pi/2048) q[0];
cx q[10], q[0];
rz(-pi/2048) q[0];
cx q[10], q[1];
rz(pi/1024) q[1];
cx q[10], q[1];
rz(-pi/1024) q[1];
cx q[10], q[2];
rz(pi/512) q[2];
cx q[10], q[2];
rz(-pi/512) q[2];
cx q[10], q[3];
rz(pi/256) q[3];
cx q[10], q[3];
rz(-pi/256) q[3];
cx q[10], q[4];
rz(pi/128) q[4];
cx q[10], q[4];
rz(-pi/128) q[4];
cx q[10], q[5];
rz(pi/64) q[5];
cx q[10], q[5];
rz(-pi/64) q[5];
cx q[10], q[6];
rz(pi/32) q[6];
cx q[10], q[6];
rz(-pi/32) q[6];
cx q[10], q[7];
rz(pi/16) q[7];
cx q[10], q[7];
rz(-pi/16) q[7];
cx q[10], q[8];
rz(pi/8) q[8];
cx q[10], q[8];
rz(-pi/8) q[8];
cx q[10], q[9];
rz(pi/4) q[9];
cx q[10], q[9];
rz(-pi/4) q[9];
h q[10];
cx q[11], q[0];
rz(pi/4096) q[0];
cx q[11], q[0];
rz(-pi/4096) q[0];
cx q[11], q[1];
rz(pi/2048) q[1];
cx q[11], q[1];
rz(-pi/2048) q[1];
cx q[11], q[2];
rz(pi/1024) q[2];
cx q[11], q[2];
rz(-pi/1024) q[2];
cx q[11], q[3];
rz(pi/512) q[3];
cx q[11], q[3];
rz(-pi/512) q[3];
cx q[11], q[4];
rz(pi/256) q[4];
cx q[11], q[4];
rz(-pi/256) q[4];
cx q[11], q[5];
rz(pi/128) q[5];
cx q[11], q[5];
rz(-pi/128) q[5];
cx q[11], q[6];
rz(pi/64) q[6];
cx q[11], q[6];
rz(-pi/64) q[6];
cx q[11], q[7];
rz(pi/32) q[7];
cx q[11], q[7];
rz(-pi/32) q[7];
cx q[11], q[8];
rz(pi/16) q[8];
cx q[11], q[8];
rz(-pi/16) q[8];
cx q[11], q[9];
rz(pi/8) q[9];
cx q[11], q[9];
rz(-pi/8) q[9];
cx q[11], q[10];
rz(pi/4) q[10];
cx q[11], q[10];
rz(-pi/4) q[10];
h q[11];
cx q[12], q[0];
rz(pi/8192) q[0];
cx q[12], q[0];
rz(-pi/8192) q[0];
cx q[12], q[1];
rz(pi/4096) q[1];
cx q[12], q[1];
rz(-pi/4096) q[1];
cx q[12], q[2];
rz(pi/2048) q[2];
cx q[12], q[2];
rz(-pi/2048) q[2];
cx q[12], q[3];
rz(pi/1024) q[3];
cx q[12], q[3];
rz(-pi/1024) q[3];
cx q[12], q[4];
rz(pi/512) q[4];
cx q[12], q[4];
rz(-pi/512) q[4];
cx q[12], q[5];
rz(pi/256) q[5];
cx q[12], q[5];
rz(-pi/256) q[5];
cx q[12], q[6];
rz(pi/128) q[6];
cx q[12], q[6];
rz(-pi/128) q[6];
cx q[12], q[7];
rz(pi/64) q[7];
cx q[12], q[7];
rz(-pi/64) q[7];
cx q[12], q[8];
rz(pi/32) q[8];
cx q[12], q[8];
rz(-pi/32) q[8];
cx q[12], q[9];
rz(pi/16) q[9];
cx q[12], q[9];
rz(-pi/16) q[9];
cx q[12], q[10];
rz(pi/8) q[10];
cx q[12], q[10];
rz(-pi/8) q[10];
cx q[12], q[11];
rz(pi/4) q[11];
cx q[12], q[11];
rz(-pi/4) q[11];
h q[12];
cx q[13], q[0];
rz(pi/16384) q[0];
cx q[13], q[0];
rz(-pi/16384) q[0];
cx q[13], q[1];
rz(pi/8192) q[1];
cx q[13], q[1];
rz(-pi/8192) q[1];
cx q[13], q[2];
rz(pi/4096) q[2];
cx q[13], q[2];
rz(-pi/4096) q[2];
cx q[13], q[3];
rz(pi/2048) q[3];
cx q[13], q[3];
rz(-pi/2048) q[3];
cx q[13], q[4];
rz(pi/1024) q[4];
cx q[13], q[4];
rz(-pi/1024) q[4];
cx q[13], q[5];
rz(pi/512) q[5];
cx q[13], q[5];
rz(-pi/512) q[5];
cx q[13], q[6];
rz(pi/256) q[6];
cx q[13], q[6];
rz(-pi/256) q[6];
cx q[13], q[7];
rz(pi/128) q[7];
cx q[13], q[7];
rz(-pi/128) q[7];
cx q[13], q[8];
rz(pi/64) q[8];
cx q[13], q[8];
rz(-pi/64) q[8];
cx q[13], q[9];
rz(pi/32) q[9];
cx q[13], q[9];
rz(-pi/32) q[9];
cx q[13], q[10];
rz(pi/16) q[10];
cx q[13], q[10];
rz(-pi/16) q[10];
cx q[13], q[11];
rz(pi/8) q[11];
cx q[13], q[11];
rz(-pi/8) q[11];
cx q[13], q[12];
rz(pi/4) q[12];
cx q[13], q[12];
rz(-pi/4) q[12];
h q[13];
cx q[14], q[0];
rz(pi/32768) q[0];
cx q[14], q[0];
rz(-pi/32768) q[0];
cx q[14], q[1];
rz(pi/16384) q[1];
cx q[14], q[1];
rz(-pi/16384) q[1];
cx q[14], q[2];
rz(pi/8192) q[2];
cx q[14], q[2];
rz(-pi/8192) q[2];
cx q[14], q[3];
rz(pi/4096) q[3];
cx q[14], q[3];
rz(-pi/4096) q[3];
cx q[14], q[4];
rz(pi/2048) q[4];
cx q[14], q[4];
rz(-pi/2048) q[4];
cx q[14], q[5];
rz(pi/1024) q[5];
cx q[14], q[5];
rz(-pi/1024) q[5];
cx q[14], q[6];
rz(pi/512) q[6];
cx q[14], q[6];
rz(-pi/512) q[6];
cx q[14], q[7];
rz(pi/256) q[7];
cx q[14], q[7];
rz(-pi/256) q[7];
cx q[14], q[8];
rz(pi/128) q[8];
cx q[14], q[8];
rz(-pi/128) q[8];
cx q[14], q[9];
rz(pi/64) q[9];
cx q[14], q[9];
rz(-pi/64) q[9];
cx q[14], q[10];
rz(pi/32) q[10];
cx q[14], q[10];
rz(-pi/32) q[10];
cx q[14], q[11];
rz(pi/16) q[11];
cx q[14], q[11];
rz(-pi/16) q[11];
cx q[14], q[12];
rz(pi/8) q[12];
cx q[14], q[12];
rz(-pi/8) q[12];
cx q[14], q[13];
rz(pi/4) q[13];
cx q[14], q[13];
rz(-pi/4) q[13];
h q[14];
cx q[15], q[0];
rz(pi/65536) q[0];
cx q[15], q[0];
rz(-pi/65536) q[0];
cx q[15], q[1];
rz(pi/32768) q[1];
cx q[15], q[1];
rz(-pi/32768) q[1];
cx q[15], q[2];
rz(pi/16384) q[2];
cx q[15], q[2];
rz(-pi/16384) q[2];
cx q[15], q[3];
rz(pi/8192) q[3];
cx q[15], q[3];
rz(-pi/8192) q[3];
cx q[15], q[4];
rz(pi/4096) q[4];
cx q[15], q[4];
rz(-pi/4096) q[4];
cx q[15], q[5];
rz(pi/2048) q[5];
cx q[15], q[5];
rz(-pi/2048) q[5];
cx q[15], q[6];
rz(pi/1024) q[6];
cx q[15], q[6];
rz(-pi/1024) q[6];
cx q[15], q[7];
rz(pi/512) q[7];
cx q[15], q[7];
rz(-pi/512) q[7];
cx q[15], q[8];
rz(pi/256) q[8];
cx q[15], q[8];
rz(-pi/256) q[8];
cx q[15], q[9];
rz(pi/128) q[9];
cx q[15], q[9];
rz(-pi/128) q[9];
cx q[15], q[10];
rz(pi/64) q[10];
cx q[15], q[10];
rz(-pi/64) q[10];
cx q[15], q[11];
rz(pi/32) q[11];
cx q[15], q[11];
rz(-pi/32) q[11];
cx q[15], q[12];
rz(pi/16) q[12];
cx q[15], q[12];
rz(-pi/16) q[12];
cx q[15], q[13];
rz(pi/8) q[13];
cx q[15], q[13];
rz(-pi/8) q[13];
cx q[15], q[14];
rz(pi/4) q[14];
cx q[15], q[14];
rz(-pi/4) q[14];
h q[15];
cx q[16], q[0];
rz(pi/131072) q[0];
cx q[16], q[0];
rz(-pi/131072) q[0];
cx q[16], q[1];
rz(pi/65536) q[1];
cx q[16], q[1];
rz(-pi/65536) q[1];
cx q[16], q[2];
rz(pi/32768) q[2];
cx q[16], q[2];
rz(-pi/32768) q[2];
cx q[16], q[3];
rz(pi/16384) q[3];
cx q[16], q[3];
rz(-pi/16384) q[3];
cx q[16], q[4];
rz(pi/8192) q[4];
cx q[16], q[4];
rz(-pi/8192) q[4];
cx q[16], q[5];
rz(pi/4096) q[5];
cx q[16], q[5];
rz(-pi/4096) q[5];
cx q[16], q[6];
rz(pi/2048) q[6];
cx q[16], q[6];
rz(-pi/2048) q[6];
cx q[16], q[7];
rz(pi/1024) q[7];
cx q[16], q[7];
rz(-pi/1024) q[7];
cx q[16], q[8];
rz(pi/512) q[8];
cx q[16], q[8];
rz(-pi/512) q[8];
cx q[16], q[9];
rz(pi/256) q[9];
cx q[16], q[9];
rz(-pi/256) q[9];
cx q[16], q[10];
rz(pi/128) q[10];
cx q[16], q[10];
rz(-pi/128) q[10];
cx q[16], q[11];
rz(pi/64) q[11];
cx q[16], q[11];
rz(-pi/64) q[11];
cx q[16], q[12];
rz(pi/32) q[12];
cx q[16], q[12];
rz(-pi/32) q[12];
cx q[16], q[13];
rz(pi/16) q[13];
cx q[16], q[13];
rz(-pi/16) q[13];
cx q[16], q[14];
rz(pi/8) q[14];
cx q[16], q[14];
rz(-pi/8) q[14];
cx q[16], q[15];
rz(pi/4) q[15];
cx q[16], q[15];
rz(-pi/4) q[15];
h q[16];
cx q[17], q[0];
rz(pi/262144) q[0];
cx q[17], q[0];
rz(-pi/262144) q[0];
cx q[17], q[1];
rz(pi/131072) q[1];
cx q[17], q[1];
rz(-pi/131072) q[1];
cx q[17], q[2];
rz(pi/65536) q[2];
cx q[17], q[2];
rz(-pi/65536) q[2];
cx q[17], q[3];
rz(pi/32768) q[3];
cx q[17], q[3];
rz(-pi/32768) q[3];
cx q[17], q[4];
rz(pi/16384) q[4];
cx q[17], q[4];
rz(-pi/16384) q[4];
cx q[17], q[5];
rz(pi/8192) q[5];
cx q[17], q[5];
rz(-pi/8192) q[5];
cx q[17], q[6];
rz(pi/4096) q[6];
cx q[17], q[6];
rz(-pi/4096) q[6];
cx q[17], q[7];
rz(pi/2048) q[7];
cx q[17], q[7];
rz(-pi/2048) q[7];
cx q[17], q[8];
rz(pi/1024) q[8];
cx q[17], q[8];
rz(-pi/1024) q[8];
cx q[17], q[9];
rz(pi/512) q[9];
cx q[17], q[9];
rz(-pi/512) q[9];
cx q[17], q[10];
rz(pi/256) q[10];
cx q[17], q[10];
rz(-pi/256) q[10];
cx q[17], q[11];
rz(pi/128) q[11];
cx q[17], q[11];
rz(-pi/128) q[11];
cx q[17], q[12];
rz(pi/64) q[12];
cx q[17], q[12];
rz(-pi/64) q[12];
cx q[17], q[13];
rz(pi/32) q[13];
cx q[17], q[13];
rz(-pi/32) q[13];
cx q[17], q[14];
rz(pi/16) q[14];
cx q[17], q[14];
rz(-pi/16) q[14];
cx q[17], q[15];
rz(pi/8) q[15];
cx q[17], q[15];
rz(-pi/8) q[15];
cx q[17], q[16];
rz(pi/4) q[16];
cx q[17], q[16];
rz(-pi/4) q[16];
h q[17];
cx q[18], q[1];
rz(pi/262144) q[1];
cx q[18], q[1];
rz(-pi/262144) q[1];
cx q[18], q[2];
rz(pi/131072) q[2];
cx q[18], q[2];
rz(-pi/131072) q[2];
cx q[18], q[3];
rz(pi/65536) q[3];
cx q[18], q[3];
rz(-pi/65536) q[3];
cx q[18], q[4];
rz(pi/32768) q[4];
cx q[18], q[4];
rz(-pi/32768) q[4];
cx q[18], q[5];
rz(pi/16384) q[5];
cx q[18], q[5];
rz(-pi/16384) q[5];
cx q[18], q[6];
rz(pi/8192) q[6];
cx q[18], q[6];
rz(-pi/8192) q[6];
cx q[18], q[7];
rz(pi/4096) q[7];
cx q[18], q[7];
rz(-pi/4096) q[7];
cx q[18], q[8];
rz(pi/2048) q[8];
cx q[18], q[8];
rz(-pi/2048) q[8];
cx q[18], q[9];
rz(pi/1024) q[9];
cx q[18], q[9];
rz(-pi/1024) q[9];
cx q[18], q[10];
rz(pi/512) q[10];
cx q[18], q[10];
rz(-pi/512) q[10];
cx q[18], q[11];
rz(pi/256) q[11];
cx q[18], q[11];
rz(-pi/256) q[11];
cx q[18], q[12];
rz(pi/128) q[12];
cx q[18], q[12];
rz(-pi/128) q[12];
cx q[18], q[13];
rz(pi/64) q[13];
cx q[18], q[13];
rz(-pi/64) q[13];
cx q[18], q[14];
rz(pi/32) q[14];
cx q[18], q[14];
rz(-pi/32) q[14];
cx q[18], q[15];
rz(pi/16) q[15];
cx q[18], q[15];
rz(-pi/16) q[15];
cx q[18], q[16];
rz(pi/8) q[16];
cx q[18], q[16];
rz(-pi/8) q[16];
cx q[18], q[17];
rz(pi/4) q[17];
cx q[18], q[17];
rz(-pi/4) q[17];
h q[18];
cx q[19], q[2];
rz(pi/262144) q[2];
cx q[19], q[2];
rz(-pi/262144) q[2];
cx q[19], q[3];
rz(pi/131072) q[3];
cx q[19], q[3];
rz(-pi/131072) q[3];
cx q[19], q[4];
rz(pi/65536) q[4];
cx q[19], q[4];
rz(-pi/65536) q[4];
cx q[19], q[5];
rz(pi/32768) q[5];
cx q[19], q[5];
rz(-pi/32768) q[5];
cx q[19], q[6];
rz(pi/16384) q[6];
cx q[19], q[6];
rz(-pi/16384) q[6];
cx q[19], q[7];
rz(pi/8192) q[7];
cx q[19], q[7];
rz(-pi/8192) q[7];
cx q[19], q[8];
rz(pi/4096) q[8];
cx q[19], q[8];
rz(-pi/4096) q[8];
cx q[19], q[9];
rz(pi/2048) q[9];
cx q[19], q[9];
rz(-pi/2048) q[9];
cx q[19], q[10];
rz(pi/1024) q[10];
cx q[19], q[10];
rz(-pi/1024) q[10];
cx q[19], q[11];
rz(pi/512) q[11];
cx q[19], q[11];
rz(-pi/512) q[11];
cx q[19], q[12];
rz(pi/256) q[12];
cx q[19], q[12];
rz(-pi/256) q[12];
cx q[19], q[13];
rz(pi/128) q[13];
cx q[19], q[13];
rz(-pi/128) q[13];
cx q[19], q[14];
rz(pi/64) q[14];
cx q[19], q[14];
rz(-pi/64) q[14];
cx q[19], q[15];
rz(pi/32) q[15];
cx q[19], q[15];
rz(-pi/32) q[15];
cx q[19], q[16];
rz(pi/16) q[16];
cx q[19], q[16];
rz(-pi/16) q[16];
cx q[19], q[17];
rz(pi/8) q[17];
cx q[19], q[17];
rz(-pi/8) q[17];
cx q[19], q[18];
rz(pi/4) q[18];
cx q[19], q[18];
rz(-pi/4) q[18];
h q[19];
cx q[20], q[3];
rz(pi/262144) q[3];
cx q[20], q[3];
rz(-pi/262144) q[3];
cx q[20], q[4];
rz(pi/131072) q[4];
cx q[20], q[4];
rz(-pi/131072) q[4];
cx q[20], q[5];
rz(pi/65536) q[5];
cx q[20], q[5];
rz(-pi/65536) q[5];
cx q[20], q[6];
rz(pi/32768) q[6];
cx q[20], q[6];
rz(-pi/32768) q[6];
cx q[20], q[7];
rz(pi/16384) q[7];
cx q[20], q[7];
rz(-pi/16384) q[7];
cx q[20], q[8];
rz(pi/8192) q[8];
cx q[20], q[8];
rz(-pi/8192) q[8];
cx q[20], q[9];
rz(pi/4096) q[9];
cx q[20], q[9];
rz(-pi/4096) q[9];
cx q[20], q[10];
rz(pi/2048) q[10];
cx q[20], q[10];
rz(-pi/2048) q[10];
cx q[20], q[11];
rz(pi/1024) q[11];
cx q[20], q[11];
rz(-pi/1024) q[11];
cx q[20], q[12];
rz(pi/512) q[12];
cx q[20], q[12];
rz(-pi/512) q[12];
cx q[20], q[13];
rz(pi/256) q[13];
cx q[20], q[13];
rz(-pi/256) q[13];
cx q[20], q[14];
rz(pi/128) q[14];
cx q[20], q[14];
rz(-pi/128) q[14];
cx q[20], q[15];
rz(pi/64) q[15];
cx q[20], q[15];
rz(-pi/64) q[15];
cx q[20], q[16];
rz(pi/32) q[16];
cx q[20], q[16];
rz(-pi/32) q[16];
cx q[20], q[17];
rz(pi/16) q[17];
cx q[20], q[17];
rz(-pi/16) q[17];
cx q[20], q[18];
rz(pi/8) q[18];
cx q[20], q[18];
rz(-pi/8) q[18];
cx q[20], q[19];
rz(pi/4) q[19];
cx q[20], q[19];
rz(-pi/4) q[19];
h q[20];
cx q[21], q[4];
rz(pi/262144) q[4];
cx q[21], q[4];
rz(-pi/262144) q[4];
cx q[21], q[5];
rz(pi/131072) q[5];
cx q[21], q[5];
rz(-pi/131072) q[5];
cx q[21], q[6];
rz(pi/65536) q[6];
cx q[21], q[6];
rz(-pi/65536) q[6];
cx q[21], q[7];
rz(pi/32768) q[7];
cx q[21], q[7];
rz(-pi/32768) q[7];
cx q[21], q[8];
rz(pi/16384) q[8];
cx q[21], q[8];
rz(-pi/16384) q[8];
cx q[21], q[9];
rz(pi/8192) q[9];
cx q[21], q[9];
rz(-pi/8192) q[9];
cx q[21], q[10];
rz(pi/4096) q[10];
cx q[21], q[10];
rz(-pi/4096) q[10];
cx q[21], q[11];
rz(pi/2048) q[11];
cx q[21], q[11];
rz(-pi/2048) q[11];
cx q[21], q[12];
rz(pi/1024) q[12];
cx q[21], q[12];
rz(-pi/1024) q[12];
cx q[21], q[13];
rz(pi/512) q[13];
cx q[21], q[13];
rz(-pi/512) q[13];
cx q[21], q[14];
rz(pi/256) q[14];
cx q[21], q[14];
rz(-pi/256) q[14];
cx q[21], q[15];
rz(pi/128) q[15];
cx q[21], q[15];
rz(-pi/128) q[15];
cx q[21], q[16];
rz(pi/64) q[16];
cx q[21], q[16];
rz(-pi/64) q[16];
cx q[21], q[17];
rz(pi/32) q[17];
cx q[21], q[17];
rz(-pi/32) q[17];
cx q[21], q[18];
rz(pi/16) q[18];
cx q[21], q[18];
rz(-pi/16) q[18];
cx q[21], q[19];
rz(pi/8) q[19];
cx q[21], q[19];
rz(-pi/8) q[19];
cx q[21], q[20];
rz(pi/4) q[20];
cx q[21], q[20];
rz(-pi/4) q[20];
h q[21];
cx q[22], q[5];
rz(pi/262144) q[5];
cx q[22], q[5];
rz(-pi/262144) q[5];
cx q[22], q[6];
rz(pi/131072) q[6];
cx q[22], q[6];
rz(-pi/131072) q[6];
cx q[22], q[7];
rz(pi/65536) q[7];
cx q[22], q[7];
rz(-pi/65536) q[7];
cx q[22], q[8];
rz(pi/32768) q[8];
cx q[22], q[8];
rz(-pi/32768) q[8];
cx q[22], q[9];
rz(pi/16384) q[9];
cx q[22], q[9];
rz(-pi/16384) q[9];
cx q[22], q[10];
rz(pi/8192) q[10];
cx q[22], q[10];
rz(-pi/8192) q[10];
cx q[22], q[11];
rz(pi/4096) q[11];
cx q[22], q[11];
rz(-pi/4096) q[11];
cx q[22], q[12];
rz(pi/2048) q[12];
cx q[22], q[12];
rz(-pi/2048) q[12];
cx q[22], q[13];
rz(pi/1024) q[13];
cx q[22], q[13];
rz(-pi/1024) q[13];
cx q[22], q[14];
rz(pi/512) q[14];
cx q[22], q[14];
rz(-pi/512) q[14];
cx q[22], q[15];
rz(pi/256) q[15];
cx q[22], q[15];
rz(-pi/256) q[15];
cx q[22], q[16];
rz(pi/128) q[16];
cx q[22], q[16];
rz(-pi/128) q[16];
cx q[22], q[17];
rz(pi/64) q[17];
cx q[22], q[17];
rz(-pi/64) q[17];
cx q[22], q[18];
rz(pi/32) q[18];
cx q[22], q[18];
rz(-pi/32) q[18];
cx q[22], q[19];
rz(pi/16) q[19];
cx q[22], q[19];
rz(-pi/16) q[19];
cx q[22], q[20];
rz(pi/8) q[20];
cx q[22], q[20];
rz(-pi/8) q[20];
cx q[22], q[21];
rz(pi/4) q[21];
cx q[22], q[21];
rz(-pi/4) q[21];
h q[22];
cx q[23], q[6];
rz(pi/262144) q[6];
cx q[23], q[6];
rz(-pi/262144) q[6];
cx q[23], q[7];
rz(pi/131072) q[7];
cx q[23], q[7];
rz(-pi/131072) q[7];
cx q[23], q[8];
rz(pi/65536) q[8];
cx q[23], q[8];
rz(-pi/65536) q[8];
cx q[23], q[9];
rz(pi/32768) q[9];
cx q[23], q[9];
rz(-pi/32768) q[9];
cx q[23], q[10];
rz(pi/16384) q[10];
cx q[23], q[10];
rz(-pi/16384) q[10];
cx q[23], q[11];
rz(pi/8192) q[11];
cx q[23], q[11];
rz(-pi/8192) q[11];
cx q[23], q[12];
rz(pi/4096) q[12];
cx q[23], q[12];
rz(-pi/4096) q[12];
cx q[23], q[13];
rz(pi/2048) q[13];
cx q[23], q[13];
rz(-pi/2048) q[13];
cx q[23], q[14];
rz(pi/1024) q[14];
cx q[23], q[14];
rz(-pi/1024) q[14];
cx q[23], q[15];
rz(pi/512) q[15];
cx q[23], q[15];
rz(-pi/512) q[15];
cx q[23], q[16];
rz(pi/256) q[16];
cx q[23], q[16];
rz(-pi/256) q[16];
cx q[23], q[17];
rz(pi/128) q[17];
cx q[23], q[17];
rz(-pi/128) q[17];
cx q[23], q[18];
rz(pi/64) q[18];
cx q[23], q[18];
rz(-pi/64) q[18];
cx q[23], q[19];
rz(pi/32) q[19];
cx q[23], q[19];
rz(-pi/32) q[19];
cx q[23], q[20];
rz(pi/16) q[20];
cx q[23], q[20];
rz(-pi/16) q[20];
cx q[23], q[21];
rz(pi/8) q[21];
cx q[23], q[21];
rz(-pi/8) q[21];
cx q[23], q[22];
rz(pi/4) q[22];
cx q[23], q[22];
rz(-pi/4) q[22];
h q[23];
cx q[24], q[7];
rz(pi/262144) q[7];
cx q[24], q[7];
rz(-pi/262144) q[7];
cx q[24], q[8];
rz(pi/131072) q[8];
cx q[24], q[8];
rz(-pi/131072) q[8];
cx q[24], q[9];
rz(pi/65536) q[9];
cx q[24], q[9];
rz(-pi/65536) q[9];
cx q[24], q[10];
rz(pi/32768) q[10];
cx q[24], q[10];
rz(-pi/32768) q[10];
cx q[24], q[11];
rz(pi/16384) q[11];
cx q[24], q[11];
rz(-pi/16384) q[11];
cx q[24], q[12];
rz(pi/8192) q[12];
cx q[24], q[12];
rz(-pi/8192) q[12];
cx q[24], q[13];
rz(pi/4096) q[13];
cx q[24], q[13];
rz(-pi/4096) q[13];
cx q[24], q[14];
rz(pi/2048) q[14];
cx q[24], q[14];
rz(-pi/2048) q[14];
cx q[24], q[15];
rz(pi/1024) q[15];
cx q[24], q[15];
rz(-pi/1024) q[15];
cx q[24], q[16];
rz(pi/512) q[16];
cx q[24], q[16];
rz(-pi/512) q[16];
cx q[24], q[17];
rz(pi/256) q[17];
cx q[24], q[17];
rz(-pi/256) q[17];
cx q[24], q[18];
rz(pi/128) q[18];
cx q[24], q[18];
rz(-pi/128) q[18];
cx q[24], q[19];
rz(pi/64) q[19];
cx q[24], q[19];
rz(-pi/64) q[19];
cx q[24], q[20];
rz(pi/32) q[20];
cx q[24], q[20];
rz(-pi/32) q[20];
cx q[24], q[21];
rz(pi/16) q[21];
cx q[24], q[21];
rz(-pi/16) q[21];
cx q[24], q[22];
rz(pi/8) q[22];
cx q[24], q[22];
rz(-pi/8) q[22];
cx q[24], q[23];
rz(pi/4) q[23];
cx q[24], q[23];
rz(-pi/4) q[23];
h q[24];
cx q[25], q[8];
rz(pi/262144) q[8];
cx q[25], q[8];
rz(-pi/262144) q[8];
cx q[25], q[9];
rz(pi/131072) q[9];
cx q[25], q[9];
rz(-pi/131072) q[9];
cx q[25], q[10];
rz(pi/65536) q[10];
cx q[25], q[10];
rz(-pi/65536) q[10];
cx q[25], q[11];
rz(pi/32768) q[11];
cx q[25], q[11];
rz(-pi/32768) q[11];
cx q[25], q[12];
rz(pi/16384) q[12];
cx q[25], q[12];
rz(-pi/16384) q[12];
cx q[25], q[13];
rz(pi/8192) q[13];
cx q[25], q[13];
rz(-pi/8192) q[13];
cx q[25], q[14];
rz(pi/4096) q[14];
cx q[25], q[14];
rz(-pi/4096) q[14];
cx q[25], q[15];
rz(pi/2048) q[15];
cx q[25], q[15];
rz(-pi/2048) q[15];
cx q[25], q[16];
rz(pi/1024) q[16];
cx q[25], q[16];
rz(-pi/1024) q[16];
cx q[25], q[17];
rz(pi/512) q[17];
cx q[25], q[17];
rz(-pi/512) q[17];
cx q[25], q[18];
rz(pi/256) q[18];
cx q[25], q[18];
rz(-pi/256) q[18];
cx q[25], q[19];
rz(pi/128) q[19];
cx q[25], q[19];
rz(-pi/128) q[19];
cx q[25], q[20];
rz(pi/64) q[20];
cx q[25], q[20];
rz(-pi/64) q[20];
cx q[25], q[21];
rz(pi/32) q[21];
cx q[25], q[21];
rz(-pi/32) q[21];
cx q[25], q[22];
rz(pi/16) q[22];
cx q[25], q[22];
rz(-pi/16) q[22];
cx q[25], q[23];
rz(pi/8) q[23];
cx q[25], q[23];
rz(-pi/8) q[23];
cx q[25], q[24];
rz(pi/4) q[24];
cx q[25], q[24];
rz(-pi/4) q[24];
h q[25];
cx q[26], q[9];
rz(pi/262144) q[9];
cx q[26], q[9];
rz(-pi/262144) q[9];
cx q[26], q[10];
rz(pi/131072) q[10];
cx q[26], q[10];
rz(-pi/131072) q[10];
cx q[26], q[11];
rz(pi/65536) q[11];
cx q[26], q[11];
rz(-pi/65536) q[11];
cx q[26], q[12];
rz(pi/32768) q[12];
cx q[26], q[12];
rz(-pi/32768) q[12];
cx q[26], q[13];
rz(pi/16384) q[13];
cx q[26], q[13];
rz(-pi/16384) q[13];
cx q[26], q[14];
rz(pi/8192) q[14];
cx q[26], q[14];
rz(-pi/8192) q[14];
cx q[26], q[15];
rz(pi/4096) q[15];
cx q[26], q[15];
rz(-pi/4096) q[15];
cx q[26], q[16];
rz(pi/2048) q[16];
cx q[26], q[16];
rz(-pi/2048) q[16];
cx q[26], q[17];
rz(pi/1024) q[17];
cx q[26], q[17];
rz(-pi/1024) q[17];
cx q[26], q[18];
rz(pi/512) q[18];
cx q[26], q[18];
rz(-pi/512) q[18];
cx q[26], q[19];
rz(pi/256) q[19];
cx q[26], q[19];
rz(-pi/256) q[19];
cx q[26], q[20];
rz(pi/128) q[20];
cx q[26], q[20];
rz(-pi/128) q[20];
cx q[26], q[21];
rz(pi/64) q[21];
cx q[26], q[21];
rz(-pi/64) q[21];
cx q[26], q[22];
rz(pi/32) q[22];
cx q[26], q[22];
rz(-pi/32) q[22];
cx q[26], q[23];
rz(pi/16) q[23];
cx q[26], q[23];
rz(-pi/16) q[23];
cx q[26], q[24];
rz(pi/8) q[24];
cx q[26], q[24];
rz(-pi/8) q[24];
cx q[26], q[25];
rz(pi/4) q[25];
cx q[26], q[25];
rz(-pi/4) q[25];
h q[26];
cx q[27], q[10];
rz(pi/262144) q[10];
cx q[27], q[10];
rz(-pi/262144) q[10];
cx q[27], q[11];
rz(pi/131072) q[11];
cx q[27], q[11];
rz(-pi/131072) q[11];
cx q[27], q[12];
rz(pi/65536) q[12];
cx q[27], q[12];
rz(-pi/65536) q[12];
cx q[27], q[13];
rz(pi/32768) q[13];
cx q[27], q[13];
rz(-pi/32768) q[13];
cx q[27], q[14];
rz(pi/16384) q[14];
cx q[27], q[14];
rz(-pi/16384) q[14];
cx q[27], q[15];
rz(pi/8192) q[15];
cx q[27], q[15];
rz(-pi/8192) q[15];
cx q[27], q[16];
rz(pi/4096) q[16];
cx q[27], q[16];
rz(-pi/4096) q[16];
cx q[27], q[17];
rz(pi/2048) q[17];
cx q[27], q[17];
rz(-pi/2048) q[17];
cx q[27], q[18];
rz(pi/1024) q[18];
cx q[27], q[18];
rz(-pi/1024) q[18];
cx q[27], q[19];
rz(pi/512) q[19];
cx q[27], q[19];
rz(-pi/512) q[19];
cx q[27], q[20];
rz(pi/256) q[20];
cx q[27], q[20];
rz(-pi/256) q[20];
cx q[27], q[21];
rz(pi/128) q[21];
cx q[27], q[21];
rz(-pi/128) q[21];
cx q[27], q[22];
rz(pi/64) q[22];
cx q[27], q[22];
rz(-pi/64) q[22];
cx q[27], q[23];
rz(pi/32) q[23];
cx q[27], q[23];
rz(-pi/32) q[23];
cx q[27], q[24];
rz(pi/16) q[24];
cx q[27], q[24];
rz(-pi/16) q[24];
cx q[27], q[25];
rz(pi/8) q[25];
cx q[27], q[25];
rz(-pi/8) q[25];
cx q[27], q[26];
rz(pi/4) q[26];
cx q[27], q[26];
rz(-pi/4) q[26];
h q[27];
cx q[28], q[11];
rz(pi/262144) q[11];
cx q[28], q[11];
rz(-pi/262144) q[11];
cx q[28], q[12];
rz(pi/131072) q[12];
cx q[28], q[12];
rz(-pi/131072) q[12];
cx q[28], q[13];
rz(pi/65536) q[13];
cx q[28], q[13];
rz(-pi/65536) q[13];
cx q[28], q[14];
rz(pi/32768) q[14];
cx q[28], q[14];
rz(-pi/32768) q[14];
cx q[28], q[15];
rz(pi/16384) q[15];
cx q[28], q[15];
rz(-pi/16384) q[15];
cx q[28], q[16];
rz(pi/8192) q[16];
cx q[28], q[16];
rz(-pi/8192) q[16];
cx q[28], q[17];
rz(pi/4096) q[17];
cx q[28], q[17];
rz(-pi/4096) q[17];
cx q[28], q[18];
rz(pi/2048) q[18];
cx q[28], q[18];
rz(-pi/2048) q[18];
cx q[28], q[19];
rz(pi/1024) q[19];
cx q[28], q[19];
rz(-pi/1024) q[19];
cx q[28], q[20];
rz(pi/512) q[20];
cx q[28], q[20];
rz(-pi/512) q[20];
cx q[28], q[21];
rz(pi/256) q[21];
cx q[28], q[21];
rz(-pi/256) q[21];
cx q[28], q[22];
rz(pi/128) q[22];
cx q[28], q[22];
rz(-pi/128) q[22];
cx q[28], q[23];
rz(pi/64) q[23];
cx q[28], q[23];
rz(-pi/64) q[23];
cx q[28], q[24];
rz(pi/32) q[24];
cx q[28], q[24];
rz(-pi/32) q[24];
cx q[28], q[25];
rz(pi/16) q[25];
cx q[28], q[25];
rz(-pi/16) q[25];
cx q[28], q[26];
rz(pi/8) q[26];
cx q[28], q[26];
rz(-pi/8) q[26];
cx q[28], q[27];
rz(pi/4) q[27];
cx q[28], q[27];
rz(-pi/4) q[27];
h q[28];
cx q[29], q[12];
rz(pi/262144) q[12];
cx q[29], q[12];
rz(-pi/262144) q[12];
cx q[29], q[13];
rz(pi/131072) q[13];
cx q[29], q[13];
rz(-pi/131072) q[13];
cx q[29], q[14];
rz(pi/65536) q[14];
cx q[29], q[14];
rz(-pi/65536) q[14];
cx q[29], q[15];
rz(pi/32768) q[15];
cx q[29], q[15];
rz(-pi/32768) q[15];
cx q[29], q[16];
rz(pi/16384) q[16];
cx q[29], q[16];
rz(-pi/16384) q[16];
cx q[29], q[17];
rz(pi/8192) q[17];
cx q[29], q[17];
rz(-pi/8192) q[17];
cx q[29], q[18];
rz(pi/4096) q[18];
cx q[29], q[18];
rz(-pi/4096) q[18];
cx q[29], q[19];
rz(pi/2048) q[19];
cx q[29], q[19];
rz(-pi/2048) q[19];
cx q[29], q[20];
rz(pi/1024) q[20];
cx q[29], q[20];
rz(-pi/1024) q[20];
cx q[29], q[21];
rz(pi/512) q[21];
cx q[29], q[21];
rz(-pi/512) q[21];
cx q[29], q[22];
rz(pi/256) q[22];
cx q[29], q[22];
rz(-pi/256) q[22];
cx q[29], q[23];
rz(pi/128) q[23];
cx q[29], q[23];
rz(-pi/128) q[23];
cx q[29], q[24];
rz(pi/64) q[24];
cx q[29], q[24];
rz(-pi/64) q[24];
cx q[29], q[25];
rz(pi/32) q[25];
cx q[29], q[25];
rz(-pi/32) q[25];
cx q[29], q[26];
rz(pi/16) q[26];
cx q[29], q[26];
rz(-pi/16) q[26];
cx q[29], q[27];
rz(pi/8) q[27];
cx q[29], q[27];
rz(-pi/8) q[27];
cx q[29], q[28];
rz(pi/4) q[28];
cx q[29], q[28];
rz(-pi/4) q[28];
h q[29];
cx q[30], q[13];
rz(pi/262144) q[13];
cx q[30], q[13];
rz(-pi/262144) q[13];
cx q[30], q[14];
rz(pi/131072) q[14];
cx q[30], q[14];
rz(-pi/131072) q[14];
cx q[30], q[15];
rz(pi/65536) q[15];
cx q[30], q[15];
rz(-pi/65536) q[15];
cx q[30], q[16];
rz(pi/32768) q[16];
cx q[30], q[16];
rz(-pi/32768) q[16];
cx q[30], q[17];
rz(pi/16384) q[17];
cx q[30], q[17];
rz(-pi/16384) q[17];
cx q[30], q[18];
rz(pi/8192) q[18];
cx q[30], q[18];
rz(-pi/8192) q[18];
cx q[30], q[19];
rz(pi/4096) q[19];
cx q[30], q[19];
rz(-pi/4096) q[19];
cx q[30], q[20];
rz(pi/2048) q[20];
cx q[30], q[20];
rz(-pi/2048) q[20];
cx q[30], q[21];
rz(pi/1024) q[21];
cx q[30], q[21];
rz(-pi/1024) q[21];
cx q[30], q[22];
rz(pi/512) q[22];
cx q[30], q[22];
rz(-pi/512) q[22];
cx q[30], q[23];
rz(pi/256) q[23];
cx q[30], q[23];
rz(-pi/256) q[23];
cx q[30], q[24];
rz(pi/128) q[24];
cx q[30], q[24];
rz(-pi/128) q[24];
cx q[30], q[25];
rz(pi/64) q[25];
cx q[30], q[25];
rz(-pi/64) q[25];
cx q[30], q[26];
rz(pi/32) q[26];
cx q[30], q[26];
rz(-pi/32) q[26];
cx q[30], q[27];
rz(pi/16) q[27];
cx q[30], q[27];
rz(-pi/16) q[27];
cx q[30], q[28];
rz(pi/8) q[28];
cx q[30], q[28];
rz(-pi/8) q[28];
cx q[30], q[29];
rz(pi/4) q[29];
cx q[30], q[29];
rz(-pi/4) q[29];
h q[30];
cx q[31], q[14];
rz(pi/262144) q[14];
cx q[31], q[14];
rz(-pi/262144) q[14];
cx q[31], q[15];
rz(pi/131072) q[15];
cx q[31], q[15];
rz(-pi/131072) q[15];
cx q[31], q[16];
rz(pi/65536) q[16];
cx q[31], q[16];
rz(-pi/65536) q[16];
cx q[31], q[17];
rz(pi/32768) q[17];
cx q[31], q[17];
rz(-pi/32768) q[17];
cx q[31], q[18];
rz(pi/16384) q[18];
cx q[31], q[18];
rz(-pi/16384) q[18];
cx q[31], q[19];
rz(pi/8192) q[19];
cx q[31], q[19];
rz(-pi/8192) q[19];
cx q[31], q[20];
rz(pi/4096) q[20];
cx q[31], q[20];
rz(-pi/4096) q[20];
cx q[31], q[21];
rz(pi/2048) q[21];
cx q[31], q[21];
rz(-pi/2048) q[21];
cx q[31], q[22];
rz(pi/1024) q[22];
cx q[31], q[22];
rz(-pi/1024) q[22];
cx q[31], q[23];
rz(pi/512) q[23];
cx q[31], q[23];
rz(-pi/512) q[23];
cx q[31], q[24];
rz(pi/256) q[24];
cx q[31], q[24];
rz(-pi/256) q[24];
cx q[31], q[25];
rz(pi/128) q[25];
cx q[31], q[25];
rz(-pi/128) q[25];
cx q[31], q[26];
rz(pi/64) q[26];
cx q[31], q[26];
rz(-pi/64) q[26];
cx q[31], q[27];
rz(pi/32) q[27];
cx q[31], q[27];
rz(-pi/32) q[27];
cx q[31], q[28];
rz(pi/16) q[28];
cx q[31], q[28];
rz(-pi/16) q[28];
cx q[31], q[29];
rz(pi/8) q[29];
cx q[31], q[29];
rz(-pi/8) q[29];
cx q[31], q[30];
rz(pi/4) q[30];
cx q[31], q[30];
rz(-pi/4) q[30];
h q[31];
cx q[32], q[15];
rz(pi/262144) q[15];
cx q[32], q[15];
rz(-pi/262144) q[15];
cx q[32], q[16];
rz(pi/131072) q[16];
cx q[32], q[16];
rz(-pi/131072) q[16];
cx q[32], q[17];
rz(pi/65536) q[17];
cx q[32], q[17];
rz(-pi/65536) q[17];
cx q[32], q[18];
rz(pi/32768) q[18];
cx q[32], q[18];
rz(-pi/32768) q[18];
cx q[32], q[19];
rz(pi/16384) q[19];
cx q[32], q[19];
rz(-pi/16384) q[19];
cx q[32], q[20];
rz(pi/8192) q[20];
cx q[32], q[20];
rz(-pi/8192) q[20];
cx q[32], q[21];
rz(pi/4096) q[21];
cx q[32], q[21];
rz(-pi/4096) q[21];
cx q[32], q[22];
rz(pi/2048) q[22];
cx q[32], q[22];
rz(-pi/2048) q[22];
cx q[32], q[23];
rz(pi/1024) q[23];
cx q[32], q[23];
rz(-pi/1024) q[23];
cx q[32], q[24];
rz(pi/512) q[24];
cx q[32], q[24];
rz(-pi/512) q[24];
cx q[32], q[25];
rz(pi/256) q[25];
cx q[32], q[25];
rz(-pi/256) q[25];
cx q[32], q[26];
rz(pi/128) q[26];
cx q[32], q[26];
rz(-pi/128) q[26];
cx q[32], q[27];
rz(pi/64) q[27];
cx q[32], q[27];
rz(-pi/64) q[27];
cx q[32], q[28];
rz(pi/32) q[28];
cx q[32], q[28];
rz(-pi/32) q[28];
cx q[32], q[29];
rz(pi/16) q[29];
cx q[32], q[29];
rz(-pi/16) q[29];
cx q[32], q[30];
rz(pi/8) q[30];
cx q[32], q[30];
rz(-pi/8) q[30];
cx q[32], q[31];
rz(pi/4) q[31];
cx q[32], q[31];
rz(-pi/4) q[31];
h q[32];
cx q[33], q[16];
rz(pi/262144) q[16];
cx q[33], q[16];
rz(-pi/262144) q[16];
cx q[33], q[17];
rz(pi/131072) q[17];
cx q[33], q[17];
rz(-pi/131072) q[17];
cx q[33], q[18];
rz(pi/65536) q[18];
cx q[33], q[18];
rz(-pi/65536) q[18];
cx q[33], q[19];
rz(pi/32768) q[19];
cx q[33], q[19];
rz(-pi/32768) q[19];
cx q[33], q[20];
rz(pi/16384) q[20];
cx q[33], q[20];
rz(-pi/16384) q[20];
cx q[33], q[21];
rz(pi/8192) q[21];
cx q[33], q[21];
rz(-pi/8192) q[21];
cx q[33], q[22];
rz(pi/4096) q[22];
cx q[33], q[22];
rz(-pi/4096) q[22];
cx q[33], q[23];
rz(pi/2048) q[23];
cx q[33], q[23];
rz(-pi/2048) q[23];
cx q[33], q[24];
rz(pi/1024) q[24];
cx q[33], q[24];
rz(-pi/1024) q[24];
cx q[33], q[25];
rz(pi/512) q[25];
cx q[33], q[25];
rz(-pi/512) q[25];
cx q[33], q[26];
rz(pi/256) q[26];
cx q[33], q[26];
rz(-pi/256) q[26];
cx q[33], q[27];
rz(pi/128) q[27];
cx q[33], q[27];
rz(-pi/128) q[27];
cx q[33], q[28];
rz(pi/64) q[28];
cx q[33], q[28];
rz(-pi/64) q[28];
cx q[33], q[29];
rz(pi/32) q[29];
cx q[33], q[29];
rz(-pi/32) q[29];
cx q[33], q[30];
rz(pi/16) q[30];
cx q[33], q[30];
rz(-pi/16) q[30];
cx q[33], q[31];
rz(pi/8) q[31];
cx q[33], q[31];
rz(-pi/8) q[31];
cx q[33], q[32];
rz(pi/4) q[32];
cx q[33], q[32];
rz(-pi/4) q[32];
h q[33];
rz(0) q[34];
rz(-pi/2) q[34];
cx q[34], q[17];
rz(pi/262144) q[17];
cx q[34], q[17];
rz(-pi/262144) q[17];
cx q[34], q[18];
rz(pi/131072) q[18];
cx q[34], q[18];
rz(-pi/131072) q[18];
cx q[34], q[19];
rz(pi/65536) q[19];
cx q[34], q[19];
rz(-pi/65536) q[19];
cx q[34], q[20];
rz(pi/32768) q[20];
cx q[34], q[20];
rz(-pi/32768) q[20];
cx q[34], q[21];
rz(pi/16384) q[21];
cx q[34], q[21];
rz(-pi/16384) q[21];
cx q[34], q[22];
rz(pi/8192) q[22];
cx q[34], q[22];
rz(-pi/8192) q[22];
cx q[34], q[23];
rz(pi/4096) q[23];
cx q[34], q[23];
rz(-pi/4096) q[23];
cx q[34], q[24];
rz(pi/2048) q[24];
cx q[34], q[24];
rz(-pi/2048) q[24];
cx q[34], q[25];
rz(pi/1024) q[25];
cx q[34], q[25];
rz(-pi/1024) q[25];
cx q[34], q[26];
rz(pi/512) q[26];
cx q[34], q[26];
rz(-pi/512) q[26];
cx q[34], q[27];
rz(pi/256) q[27];
cx q[34], q[27];
rz(-pi/256) q[27];
cx q[34], q[28];
rz(pi/128) q[28];
cx q[34], q[28];
rz(-pi/128) q[28];
cx q[34], q[29];
rz(pi/64) q[29];
cx q[34], q[29];
rz(-pi/64) q[29];
cx q[34], q[30];
rz(pi/32) q[30];
cx q[34], q[30];
rz(-pi/32) q[30];
cx q[34], q[31];
rz(pi/16) q[31];
cx q[34], q[31];
rz(-pi/16) q[31];
cx q[34], q[32];
rz(pi/8) q[32];
cx q[34], q[32];
rz(-pi/8) q[32];
cx q[34], q[33];
rz(pi/4) q[33];
cx q[34], q[33];
rz(-pi/4) q[33];
h q[34];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], q[11], q[12], q[13], q[14], q[15], q[16], q[17], q[18], q[19], q[20], q[21], q[22], q[23], q[24], q[25], q[26], q[27], q[28], q[29], q[30], q[31], q[32], q[33], q[34], psi[0];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];
c[9] = measure q[9];
c[10] = measure q[10];
c[11] = measure q[11];
c[12] = measure q[12];
c[13] = measure q[13];
c[14] = measure q[14];
c[15] = measure q[15];
c[16] = measure q[16];
c[17] = measure q[17];
c[18] = measure q[18];
c[19] = measure q[19];
c[20] = measure q[20];
c[21] = measure q[21];
c[22] = measure q[22];
c[23] = measure q[23];
c[24] = measure q[24];
c[25] = measure q[25];
c[26] = measure q[26];
c[27] = measure q[27];
c[28] = measure q[28];
c[29] = measure q[29];
c[30] = measure q[30];
c[31] = measure q[31];
c[32] = measure q[32];
c[33] = measure q[33];
c[34] = measure q[34];