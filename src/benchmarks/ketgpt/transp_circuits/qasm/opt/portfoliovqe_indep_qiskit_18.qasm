OPENQASM 3.0;
include "stdgates.inc";
bit[18] meas;
qubit[18] q;
rz(-pi/2) q[0];
h q[0];
rz(-3.26924626457675) q[0];
h q[0];
rz(-pi/2) q[1];
h q[1];
rz(2.1699184232773394) q[1];
h q[1];
rz(5*pi/2) q[1];
h q[1];
cx q[0], q[1];
h q[1];
rz(-pi/2) q[2];
h q[2];
rz(-3.14403449314654) q[2];
h q[2];
rz(5*pi/2) q[2];
h q[2];
cx q[0], q[2];
cx q[1], q[2];
h q[2];
rz(-pi/2) q[3];
h q[3];
rz(-6.04080603076166) q[3];
h q[3];
rz(5*pi/2) q[3];
h q[3];
cx q[0], q[3];
cx q[1], q[3];
cx q[2], q[3];
h q[3];
rz(-pi/2) q[4];
h q[4];
rz(4.49680582652583) q[4];
h q[4];
rz(5*pi/2) q[4];
h q[4];
cx q[0], q[4];
cx q[1], q[4];
cx q[2], q[4];
cx q[3], q[4];
h q[4];
rz(-pi/2) q[5];
h q[5];
rz(4.19117338521077) q[5];
h q[5];
rz(5*pi/2) q[5];
h q[5];
cx q[0], q[5];
cx q[1], q[5];
cx q[2], q[5];
cx q[3], q[5];
cx q[4], q[5];
h q[5];
rz(-pi/2) q[6];
h q[6];
rz(-2.824618887816) q[6];
h q[6];
rz(5*pi/2) q[6];
h q[6];
cx q[0], q[6];
cx q[1], q[6];
cx q[2], q[6];
cx q[3], q[6];
cx q[4], q[6];
cx q[5], q[6];
h q[6];
rz(-pi/2) q[7];
h q[7];
rz(-0.5396442665407948) q[7];
h q[7];
rz(5*pi/2) q[7];
h q[7];
cx q[0], q[7];
cx q[1], q[7];
cx q[2], q[7];
cx q[3], q[7];
cx q[4], q[7];
cx q[5], q[7];
cx q[6], q[7];
h q[7];
rz(-pi/2) q[8];
h q[8];
rz(-1.1068641672992499) q[8];
h q[8];
rz(5*pi/2) q[8];
h q[8];
cx q[0], q[8];
cx q[1], q[8];
cx q[2], q[8];
cx q[3], q[8];
cx q[4], q[8];
cx q[5], q[8];
cx q[6], q[8];
cx q[7], q[8];
h q[8];
rz(-pi/2) q[9];
h q[9];
rz(-1.60180733565973) q[9];
h q[9];
rz(5*pi/2) q[9];
h q[9];
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
rz(-pi/2) q[10];
h q[10];
rz(4.63354693039489) q[10];
h q[10];
rz(5*pi/2) q[10];
h q[10];
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
rz(-pi/2) q[11];
h q[11];
rz(-2.41504019665716) q[11];
h q[11];
rz(5*pi/2) q[11];
h q[11];
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
rz(-pi/2) q[12];
h q[12];
rz(5.94395762501631) q[12];
h q[12];
rz(5*pi/2) q[12];
h q[12];
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
rz(-pi/2) q[13];
h q[13];
rz(4.46883169415744) q[13];
h q[13];
rz(5*pi/2) q[13];
h q[13];
cx q[0], q[13];
cx q[1], q[13];
cx q[2], q[13];
cx q[3], q[13];
cx q[4], q[13];
cx q[5], q[13];
cx q[6], q[13];
cx q[7], q[13];
cx q[8], q[13];
cx q[9], q[13];
cx q[10], q[13];
cx q[11], q[13];
cx q[12], q[13];
h q[13];
rz(-pi/2) q[14];
h q[14];
rz(-4.90865840031363) q[14];
h q[14];
rz(5*pi/2) q[14];
h q[14];
cx q[0], q[14];
cx q[1], q[14];
cx q[2], q[14];
cx q[3], q[14];
cx q[4], q[14];
cx q[5], q[14];
cx q[6], q[14];
cx q[7], q[14];
cx q[8], q[14];
cx q[9], q[14];
cx q[10], q[14];
cx q[11], q[14];
cx q[12], q[14];
cx q[13], q[14];
h q[14];
rz(-pi/2) q[15];
h q[15];
rz(-4.98056687489696) q[15];
h q[15];
rz(5*pi/2) q[15];
h q[15];
cx q[0], q[15];
cx q[1], q[15];
cx q[2], q[15];
cx q[3], q[15];
cx q[4], q[15];
cx q[5], q[15];
cx q[6], q[15];
cx q[7], q[15];
cx q[8], q[15];
cx q[9], q[15];
cx q[10], q[15];
cx q[11], q[15];
cx q[12], q[15];
cx q[13], q[15];
cx q[14], q[15];
h q[15];
rz(-pi/2) q[16];
h q[16];
rz(6.733725660468011) q[16];
h q[16];
rz(5*pi/2) q[16];
h q[16];
cx q[0], q[16];
cx q[1], q[16];
cx q[2], q[16];
cx q[3], q[16];
cx q[4], q[16];
cx q[5], q[16];
cx q[6], q[16];
cx q[7], q[16];
cx q[8], q[16];
cx q[9], q[16];
cx q[10], q[16];
cx q[11], q[16];
cx q[12], q[16];
cx q[13], q[16];
cx q[14], q[16];
cx q[15], q[16];
h q[16];
rz(-pi/2) q[17];
h q[17];
rz(2.9605928590035404) q[17];
h q[17];
rz(5*pi/2) q[17];
h q[17];
cx q[0], q[17];
h q[0];
rz(-2.12515608432294) q[0];
h q[0];
cx q[1], q[17];
rz(-pi/2) q[1];
h q[1];
rz(4.48781436740723) q[1];
h q[1];
rz(5*pi/2) q[1];
h q[1];
cx q[0], q[1];
h q[1];
cx q[2], q[17];
rz(-pi/2) q[2];
h q[2];
rz(6.101732765570301) q[2];
h q[2];
rz(5*pi/2) q[2];
h q[2];
cx q[0], q[2];
cx q[1], q[2];
h q[2];
cx q[3], q[17];
rz(-pi/2) q[3];
h q[3];
rz(4.43672636288862) q[3];
h q[3];
rz(5*pi/2) q[3];
h q[3];
cx q[0], q[3];
cx q[1], q[3];
cx q[2], q[3];
h q[3];
cx q[4], q[17];
rz(-pi/2) q[4];
h q[4];
rz(-0.27227399356259196) q[4];
h q[4];
rz(5*pi/2) q[4];
h q[4];
cx q[0], q[4];
cx q[1], q[4];
cx q[2], q[4];
cx q[3], q[4];
h q[4];
cx q[5], q[17];
rz(-pi/2) q[5];
h q[5];
rz(-0.2182419446224122) q[5];
h q[5];
rz(5*pi/2) q[5];
h q[5];
cx q[0], q[5];
cx q[1], q[5];
cx q[2], q[5];
cx q[3], q[5];
cx q[4], q[5];
h q[5];
cx q[6], q[17];
rz(-pi/2) q[6];
h q[6];
rz(3.5951886243820805) q[6];
h q[6];
rz(5*pi/2) q[6];
h q[6];
cx q[0], q[6];
cx q[1], q[6];
cx q[2], q[6];
cx q[3], q[6];
cx q[4], q[6];
cx q[5], q[6];
h q[6];
cx q[7], q[17];
rz(-pi/2) q[7];
h q[7];
rz(-0.05486822483499498) q[7];
h q[7];
rz(5*pi/2) q[7];
h q[7];
cx q[0], q[7];
cx q[1], q[7];
cx q[2], q[7];
cx q[3], q[7];
cx q[4], q[7];
cx q[5], q[7];
cx q[6], q[7];
h q[7];
cx q[8], q[17];
rz(-pi/2) q[8];
h q[8];
rz(-1.57686793285032) q[8];
h q[8];
rz(5*pi/2) q[8];
h q[8];
cx q[0], q[8];
cx q[1], q[8];
cx q[2], q[8];
cx q[3], q[8];
cx q[4], q[8];
cx q[5], q[8];
cx q[6], q[8];
cx q[7], q[8];
h q[8];
cx q[9], q[17];
rz(-pi/2) q[9];
h q[9];
rz(-1.14713057114207) q[9];
h q[9];
rz(5*pi/2) q[9];
h q[9];
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
cx q[10], q[17];
rz(-pi/2) q[10];
h q[10];
rz(-5.1655447647543) q[10];
h q[10];
rz(5*pi/2) q[10];
h q[10];
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
cx q[11], q[17];
rz(-pi/2) q[11];
h q[11];
rz(5.480798810477669) q[11];
h q[11];
rz(5*pi/2) q[11];
h q[11];
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
cx q[12], q[17];
rz(-pi/2) q[12];
h q[12];
rz(-4.98199358263506) q[12];
h q[12];
rz(5*pi/2) q[12];
h q[12];
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
cx q[13], q[17];
rz(-pi/2) q[13];
h q[13];
rz(6.071427540085651) q[13];
h q[13];
rz(5*pi/2) q[13];
h q[13];
cx q[0], q[13];
cx q[1], q[13];
cx q[2], q[13];
cx q[3], q[13];
cx q[4], q[13];
cx q[5], q[13];
cx q[6], q[13];
cx q[7], q[13];
cx q[8], q[13];
cx q[9], q[13];
cx q[10], q[13];
cx q[11], q[13];
cx q[12], q[13];
h q[13];
cx q[14], q[17];
rz(-pi/2) q[14];
h q[14];
rz(-4.87726188628396) q[14];
h q[14];
rz(5*pi/2) q[14];
h q[14];
cx q[0], q[14];
cx q[1], q[14];
cx q[2], q[14];
cx q[3], q[14];
cx q[4], q[14];
cx q[5], q[14];
cx q[6], q[14];
cx q[7], q[14];
cx q[8], q[14];
cx q[9], q[14];
cx q[10], q[14];
cx q[11], q[14];
cx q[12], q[14];
cx q[13], q[14];
h q[14];
cx q[15], q[17];
rz(-pi/2) q[15];
h q[15];
rz(6.0812383847804306) q[15];
h q[15];
rz(5*pi/2) q[15];
h q[15];
cx q[0], q[15];
cx q[1], q[15];
cx q[2], q[15];
cx q[3], q[15];
cx q[4], q[15];
cx q[5], q[15];
cx q[6], q[15];
cx q[7], q[15];
cx q[8], q[15];
cx q[9], q[15];
cx q[10], q[15];
cx q[11], q[15];
cx q[12], q[15];
cx q[13], q[15];
cx q[14], q[15];
h q[15];
cx q[16], q[17];
rz(-pi/2) q[16];
h q[16];
rz(-0.8163328517932502) q[16];
h q[16];
rz(5*pi/2) q[16];
h q[16];
cx q[0], q[16];
cx q[1], q[16];
cx q[2], q[16];
cx q[3], q[16];
cx q[4], q[16];
cx q[5], q[16];
cx q[6], q[16];
cx q[7], q[16];
cx q[8], q[16];
cx q[9], q[16];
cx q[10], q[16];
cx q[11], q[16];
cx q[12], q[16];
cx q[13], q[16];
cx q[14], q[16];
cx q[15], q[16];
h q[16];
h q[17];
rz(0) q[17];
rz(-pi/2) q[17];
h q[17];
rz(-3.07383291446817) q[17];
h q[17];
rz(5*pi/2) q[17];
h q[17];
cx q[0], q[17];
h q[0];
rz(-1.79839405619759) q[0];
h q[0];
cx q[1], q[17];
rz(-pi/2) q[1];
h q[1];
rz(5.85946214213263) q[1];
h q[1];
rz(5*pi/2) q[1];
h q[1];
cx q[0], q[1];
h q[1];
cx q[2], q[17];
rz(-pi/2) q[2];
h q[2];
rz(0.23779218975116123) q[2];
h q[2];
rz(5*pi/2) q[2];
h q[2];
cx q[0], q[2];
cx q[1], q[2];
h q[2];
cx q[3], q[17];
rz(-pi/2) q[3];
h q[3];
rz(1.2771203252528398) q[3];
h q[3];
rz(5*pi/2) q[3];
h q[3];
cx q[0], q[3];
cx q[1], q[3];
cx q[2], q[3];
h q[3];
cx q[4], q[17];
rz(-pi/2) q[4];
h q[4];
rz(-5.42539650994323) q[4];
h q[4];
rz(5*pi/2) q[4];
h q[4];
cx q[0], q[4];
cx q[1], q[4];
cx q[2], q[4];
cx q[3], q[4];
h q[4];
cx q[5], q[17];
rz(-pi/2) q[5];
h q[5];
rz(2.66861204698567) q[5];
h q[5];
rz(5*pi/2) q[5];
h q[5];
cx q[0], q[5];
cx q[1], q[5];
cx q[2], q[5];
cx q[3], q[5];
cx q[4], q[5];
h q[5];
cx q[6], q[17];
rz(-pi/2) q[6];
h q[6];
rz(0.5255855238271341) q[6];
h q[6];
rz(5*pi/2) q[6];
h q[6];
cx q[0], q[6];
cx q[1], q[6];
cx q[2], q[6];
cx q[3], q[6];
cx q[4], q[6];
cx q[5], q[6];
h q[6];
cx q[7], q[17];
rz(-pi/2) q[7];
h q[7];
rz(-0.7559607924034548) q[7];
h q[7];
rz(5*pi/2) q[7];
h q[7];
cx q[0], q[7];
cx q[1], q[7];
cx q[2], q[7];
cx q[3], q[7];
cx q[4], q[7];
cx q[5], q[7];
cx q[6], q[7];
h q[7];
cx q[8], q[17];
rz(-pi/2) q[8];
h q[8];
rz(-2.47461674054595) q[8];
h q[8];
rz(5*pi/2) q[8];
h q[8];
cx q[0], q[8];
cx q[1], q[8];
cx q[2], q[8];
cx q[3], q[8];
cx q[4], q[8];
cx q[5], q[8];
cx q[6], q[8];
cx q[7], q[8];
h q[8];
cx q[9], q[17];
rz(-pi/2) q[9];
h q[9];
rz(2.02938988214429) q[9];
h q[9];
rz(5*pi/2) q[9];
h q[9];
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
cx q[10], q[17];
rz(-pi/2) q[10];
h q[10];
rz(1.94687492858953) q[10];
h q[10];
rz(5*pi/2) q[10];
h q[10];
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
cx q[11], q[17];
rz(-pi/2) q[11];
h q[11];
rz(5.78390917289437) q[11];
h q[11];
rz(5*pi/2) q[11];
h q[11];
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
cx q[12], q[17];
rz(-pi/2) q[12];
h q[12];
rz(-4.92787831275334) q[12];
h q[12];
rz(5*pi/2) q[12];
h q[12];
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
cx q[13], q[17];
rz(-pi/2) q[13];
h q[13];
rz(-1.20564924579877) q[13];
h q[13];
rz(5*pi/2) q[13];
h q[13];
cx q[0], q[13];
cx q[1], q[13];
cx q[2], q[13];
cx q[3], q[13];
cx q[4], q[13];
cx q[5], q[13];
cx q[6], q[13];
cx q[7], q[13];
cx q[8], q[13];
cx q[9], q[13];
cx q[10], q[13];
cx q[11], q[13];
cx q[12], q[13];
h q[13];
cx q[14], q[17];
rz(-pi/2) q[14];
h q[14];
rz(-5.17219421017511) q[14];
h q[14];
rz(5*pi/2) q[14];
h q[14];
cx q[0], q[14];
cx q[1], q[14];
cx q[2], q[14];
cx q[3], q[14];
cx q[4], q[14];
cx q[5], q[14];
cx q[6], q[14];
cx q[7], q[14];
cx q[8], q[14];
cx q[9], q[14];
cx q[10], q[14];
cx q[11], q[14];
cx q[12], q[14];
cx q[13], q[14];
h q[14];
cx q[15], q[17];
rz(-pi/2) q[15];
h q[15];
rz(-5.75641251822528) q[15];
h q[15];
rz(5*pi/2) q[15];
h q[15];
cx q[0], q[15];
cx q[1], q[15];
cx q[2], q[15];
cx q[3], q[15];
cx q[4], q[15];
cx q[5], q[15];
cx q[6], q[15];
cx q[7], q[15];
cx q[8], q[15];
cx q[9], q[15];
cx q[10], q[15];
cx q[11], q[15];
cx q[12], q[15];
cx q[13], q[15];
cx q[14], q[15];
h q[15];
cx q[16], q[17];
rz(-pi/2) q[16];
h q[16];
rz(5.101012549525141) q[16];
h q[16];
rz(5*pi/2) q[16];
h q[16];
cx q[0], q[16];
cx q[1], q[16];
cx q[2], q[16];
cx q[3], q[16];
cx q[4], q[16];
cx q[5], q[16];
cx q[6], q[16];
cx q[7], q[16];
cx q[8], q[16];
cx q[9], q[16];
cx q[10], q[16];
cx q[11], q[16];
cx q[12], q[16];
cx q[13], q[16];
cx q[14], q[16];
cx q[15], q[16];
h q[16];
h q[17];
rz(0) q[17];
rz(-pi/2) q[17];
h q[17];
rz(3.29568275732602) q[17];
h q[17];
rz(5*pi/2) q[17];
h q[17];
cx q[0], q[17];
h q[0];
rz(4.14190457358395) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[17];
rz(-pi/2) q[1];
h q[1];
rz(-5.68387388080703) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[17];
rz(-pi/2) q[2];
h q[2];
rz(0.4114131208590148) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[3], q[17];
rz(-pi/2) q[3];
h q[3];
rz(-5.11648835064766) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[4], q[17];
rz(-pi/2) q[4];
h q[4];
rz(-4.25288875049816) q[4];
h q[4];
rz(5*pi/2) q[4];
cx q[5], q[17];
rz(-pi/2) q[5];
h q[5];
rz(-1.94969689279542) q[5];
h q[5];
rz(5*pi/2) q[5];
cx q[6], q[17];
rz(-pi/2) q[6];
h q[6];
rz(5.011010516557189) q[6];
h q[6];
rz(5*pi/2) q[6];
cx q[7], q[17];
rz(-pi/2) q[7];
h q[7];
rz(-1.41485926162037) q[7];
h q[7];
rz(5*pi/2) q[7];
cx q[8], q[17];
rz(-pi/2) q[8];
h q[8];
rz(-0.06525843595838143) q[8];
h q[8];
rz(5*pi/2) q[8];
cx q[9], q[17];
rz(-pi/2) q[9];
h q[9];
rz(4.932729623742411) q[9];
h q[9];
rz(5*pi/2) q[9];
cx q[10], q[17];
rz(-pi/2) q[10];
h q[10];
rz(-5.43735394581648) q[10];
h q[10];
rz(5*pi/2) q[10];
cx q[11], q[17];
rz(-pi/2) q[11];
h q[11];
rz(-6.14958832044262) q[11];
h q[11];
rz(5*pi/2) q[11];
cx q[12], q[17];
rz(-pi/2) q[12];
h q[12];
rz(-4.71492746201801) q[12];
h q[12];
rz(5*pi/2) q[12];
cx q[13], q[17];
rz(-pi/2) q[13];
h q[13];
rz(2.6175876632802595) q[13];
h q[13];
rz(5*pi/2) q[13];
cx q[14], q[17];
rz(-pi/2) q[14];
h q[14];
rz(6.18578858379934) q[14];
h q[14];
rz(5*pi/2) q[14];
cx q[15], q[17];
rz(-pi/2) q[15];
h q[15];
rz(2.1672927083276896) q[15];
h q[15];
rz(5*pi/2) q[15];
cx q[16], q[17];
rz(-pi/2) q[16];
h q[16];
rz(-0.7531524677578099) q[16];
h q[16];
rz(5*pi/2) q[16];
h q[17];
rz(0) q[17];
rz(-pi/2) q[17];
h q[17];
rz(-2.54242002978215) q[17];
h q[17];
rz(5*pi/2) q[17];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], q[11], q[12], q[13], q[14], q[15], q[16], q[17];
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