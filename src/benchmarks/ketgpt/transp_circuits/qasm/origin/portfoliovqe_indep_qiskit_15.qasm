OPENQASM 3.0;
include "stdgates.inc";
bit[15] meas;
qubit[15] q;
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(1.7488284619514332) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(0.5462788509235832) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
h q[1];
cx q[0], q[1];
h q[1];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(4.657019342253593) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
h q[2];
cx q[0], q[2];
h q[2];
h q[2];
cx q[1], q[2];
h q[2];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(9.083015402028202) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi) q[3];
h q[3];
cx q[0], q[3];
h q[3];
h q[3];
cx q[1], q[3];
h q[3];
h q[3];
cx q[2], q[3];
h q[3];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(2.357704420900736) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi) q[4];
h q[4];
cx q[0], q[4];
h q[4];
h q[4];
cx q[1], q[4];
h q[4];
h q[4];
cx q[2], q[4];
h q[4];
h q[4];
cx q[3], q[4];
h q[4];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(4.234640428773393) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi) q[5];
h q[5];
cx q[0], q[5];
h q[5];
h q[5];
cx q[1], q[5];
h q[5];
h q[5];
cx q[2], q[5];
h q[5];
h q[5];
cx q[3], q[5];
h q[5];
h q[5];
cx q[4], q[5];
h q[5];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(-1.1517295021395269) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
h q[6];
cx q[0], q[6];
h q[6];
h q[6];
cx q[1], q[6];
h q[6];
h q[6];
cx q[2], q[6];
h q[6];
h q[6];
cx q[3], q[6];
h q[6];
h q[6];
cx q[4], q[6];
h q[6];
h q[6];
cx q[5], q[6];
h q[6];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(-1.0698661584784368) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi) q[7];
h q[7];
cx q[0], q[7];
h q[7];
h q[7];
cx q[1], q[7];
h q[7];
h q[7];
cx q[2], q[7];
h q[7];
h q[7];
cx q[3], q[7];
h q[7];
h q[7];
cx q[4], q[7];
h q[7];
h q[7];
cx q[5], q[7];
h q[7];
h q[7];
cx q[6], q[7];
h q[7];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(-2.9499449954350867) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3*pi) q[8];
h q[8];
cx q[0], q[8];
h q[8];
h q[8];
cx q[1], q[8];
h q[8];
h q[8];
cx q[2], q[8];
h q[8];
h q[8];
cx q[3], q[8];
h q[8];
h q[8];
cx q[4], q[8];
h q[8];
h q[8];
cx q[5], q[8];
h q[8];
h q[8];
cx q[6], q[8];
h q[8];
h q[8];
cx q[7], q[8];
h q[8];
rz(0) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(-0.261450816345957) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3*pi) q[9];
h q[9];
cx q[0], q[9];
h q[9];
h q[9];
cx q[1], q[9];
h q[9];
h q[9];
cx q[2], q[9];
h q[9];
h q[9];
cx q[3], q[9];
h q[9];
h q[9];
cx q[4], q[9];
h q[9];
h q[9];
cx q[5], q[9];
h q[9];
h q[9];
cx q[6], q[9];
h q[9];
h q[9];
cx q[7], q[9];
h q[9];
h q[9];
cx q[8], q[9];
h q[9];
rz(0) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(9.514805979170102) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(3*pi) q[10];
h q[10];
cx q[0], q[10];
h q[10];
h q[10];
cx q[1], q[10];
h q[10];
h q[10];
cx q[2], q[10];
h q[10];
h q[10];
cx q[3], q[10];
h q[10];
h q[10];
cx q[4], q[10];
h q[10];
h q[10];
cx q[5], q[10];
h q[10];
h q[10];
cx q[6], q[10];
h q[10];
h q[10];
cx q[7], q[10];
h q[10];
h q[10];
cx q[8], q[10];
h q[10];
h q[10];
cx q[9], q[10];
h q[10];
rz(0) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(5.550020923121883) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(3*pi) q[11];
h q[11];
cx q[0], q[11];
h q[11];
h q[11];
cx q[1], q[11];
h q[11];
h q[11];
cx q[2], q[11];
h q[11];
h q[11];
cx q[3], q[11];
h q[11];
h q[11];
cx q[4], q[11];
h q[11];
h q[11];
cx q[5], q[11];
h q[11];
h q[11];
cx q[6], q[11];
h q[11];
h q[11];
cx q[7], q[11];
h q[11];
h q[11];
cx q[8], q[11];
h q[11];
h q[11];
cx q[9], q[11];
h q[11];
h q[11];
cx q[10], q[11];
h q[11];
rz(0) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(5.961050171723303) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(3*pi) q[12];
h q[12];
cx q[0], q[12];
h q[12];
h q[12];
cx q[1], q[12];
h q[12];
h q[12];
cx q[2], q[12];
h q[12];
h q[12];
cx q[3], q[12];
h q[12];
h q[12];
cx q[4], q[12];
h q[12];
h q[12];
cx q[5], q[12];
h q[12];
h q[12];
cx q[6], q[12];
h q[12];
h q[12];
cx q[7], q[12];
h q[12];
h q[12];
cx q[8], q[12];
h q[12];
h q[12];
cx q[9], q[12];
h q[12];
h q[12];
cx q[10], q[12];
h q[12];
h q[12];
cx q[11], q[12];
h q[12];
rz(0) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(0.5721970032854231) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(3*pi) q[13];
h q[13];
cx q[0], q[13];
h q[13];
h q[13];
cx q[1], q[13];
h q[13];
h q[13];
cx q[2], q[13];
h q[13];
h q[13];
cx q[3], q[13];
h q[13];
h q[13];
cx q[4], q[13];
h q[13];
h q[13];
cx q[5], q[13];
h q[13];
h q[13];
cx q[6], q[13];
h q[13];
h q[13];
cx q[7], q[13];
h q[13];
h q[13];
cx q[8], q[13];
h q[13];
h q[13];
cx q[9], q[13];
h q[13];
h q[13];
cx q[10], q[13];
h q[13];
h q[13];
cx q[11], q[13];
h q[13];
h q[13];
cx q[12], q[13];
h q[13];
rz(0) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(9.490586969262363) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(3*pi) q[14];
h q[14];
cx q[0], q[14];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(-0.09888435675678675) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
h q[14];
h q[14];
cx q[1], q[14];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(8.674873952698082) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
h q[1];
cx q[0], q[1];
h q[1];
h q[14];
h q[14];
cx q[2], q[14];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(10.057232177617763) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
h q[2];
cx q[0], q[2];
h q[2];
h q[2];
cx q[1], q[2];
h q[2];
h q[14];
h q[14];
cx q[3], q[14];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(-1.4431128029313065) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi) q[3];
h q[3];
cx q[0], q[3];
h q[3];
h q[3];
cx q[1], q[3];
h q[3];
h q[3];
cx q[2], q[3];
h q[3];
h q[14];
h q[14];
cx q[4], q[14];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(-2.4827638840630266) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi) q[4];
h q[4];
cx q[0], q[4];
h q[4];
h q[4];
cx q[1], q[4];
h q[4];
h q[4];
cx q[2], q[4];
h q[4];
h q[4];
cx q[3], q[4];
h q[4];
h q[14];
h q[14];
cx q[5], q[14];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(-0.7019605539064369) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi) q[5];
h q[5];
cx q[0], q[5];
h q[5];
h q[5];
cx q[1], q[5];
h q[5];
h q[5];
cx q[2], q[5];
h q[5];
h q[5];
cx q[3], q[5];
h q[5];
h q[5];
cx q[4], q[5];
h q[5];
h q[14];
h q[14];
cx q[6], q[14];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(5.647664319331453) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
h q[6];
cx q[0], q[6];
h q[6];
h q[6];
cx q[1], q[6];
h q[6];
h q[6];
cx q[2], q[6];
h q[6];
h q[6];
cx q[3], q[6];
h q[6];
h q[6];
cx q[4], q[6];
h q[6];
h q[6];
cx q[5], q[6];
h q[6];
h q[14];
h q[14];
cx q[7], q[14];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(8.708150510710194) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi) q[7];
h q[7];
cx q[0], q[7];
h q[7];
h q[7];
cx q[1], q[7];
h q[7];
h q[7];
cx q[2], q[7];
h q[7];
h q[7];
cx q[3], q[7];
h q[7];
h q[7];
cx q[4], q[7];
h q[7];
h q[7];
cx q[5], q[7];
h q[7];
h q[7];
cx q[6], q[7];
h q[7];
h q[14];
h q[14];
cx q[8], q[14];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(5.729408730442033) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3*pi) q[8];
h q[8];
cx q[0], q[8];
h q[8];
h q[8];
cx q[1], q[8];
h q[8];
h q[8];
cx q[2], q[8];
h q[8];
h q[8];
cx q[3], q[8];
h q[8];
h q[8];
cx q[4], q[8];
h q[8];
h q[8];
cx q[5], q[8];
h q[8];
h q[8];
cx q[6], q[8];
h q[8];
h q[8];
cx q[7], q[8];
h q[8];
h q[14];
h q[14];
cx q[9], q[14];
rz(0) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3.854301478386786) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3*pi) q[9];
h q[9];
cx q[0], q[9];
h q[9];
h q[9];
cx q[1], q[9];
h q[9];
h q[9];
cx q[2], q[9];
h q[9];
h q[9];
cx q[3], q[9];
h q[9];
h q[9];
cx q[4], q[9];
h q[9];
h q[9];
cx q[5], q[9];
h q[9];
h q[9];
cx q[6], q[9];
h q[9];
h q[9];
cx q[7], q[9];
h q[9];
h q[9];
cx q[8], q[9];
h q[9];
h q[14];
h q[14];
cx q[10], q[14];
rz(0) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(-0.6189779329230367) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(3*pi) q[10];
h q[10];
cx q[0], q[10];
h q[10];
h q[10];
cx q[1], q[10];
h q[10];
h q[10];
cx q[2], q[10];
h q[10];
h q[10];
cx q[3], q[10];
h q[10];
h q[10];
cx q[4], q[10];
h q[10];
h q[10];
cx q[5], q[10];
h q[10];
h q[10];
cx q[6], q[10];
h q[10];
h q[10];
cx q[7], q[10];
h q[10];
h q[10];
cx q[8], q[10];
h q[10];
h q[10];
cx q[9], q[10];
h q[10];
h q[14];
h q[14];
cx q[11], q[14];
rz(0) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(4.224801059106883) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(3*pi) q[11];
h q[11];
cx q[0], q[11];
h q[11];
h q[11];
cx q[1], q[11];
h q[11];
h q[11];
cx q[2], q[11];
h q[11];
h q[11];
cx q[3], q[11];
h q[11];
h q[11];
cx q[4], q[11];
h q[11];
h q[11];
cx q[5], q[11];
h q[11];
h q[11];
cx q[6], q[11];
h q[11];
h q[11];
cx q[7], q[11];
h q[11];
h q[11];
cx q[8], q[11];
h q[11];
h q[11];
cx q[9], q[11];
h q[11];
h q[11];
cx q[10], q[11];
h q[11];
h q[14];
h q[14];
cx q[12], q[14];
rz(0) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(0.8079029377937932) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(3*pi) q[12];
h q[12];
cx q[0], q[12];
h q[12];
h q[12];
cx q[1], q[12];
h q[12];
h q[12];
cx q[2], q[12];
h q[12];
h q[12];
cx q[3], q[12];
h q[12];
h q[12];
cx q[4], q[12];
h q[12];
h q[12];
cx q[5], q[12];
h q[12];
h q[12];
cx q[6], q[12];
h q[12];
h q[12];
cx q[7], q[12];
h q[12];
h q[12];
cx q[8], q[12];
h q[12];
h q[12];
cx q[9], q[12];
h q[12];
h q[12];
cx q[10], q[12];
h q[12];
h q[12];
cx q[11], q[12];
h q[12];
h q[14];
h q[14];
cx q[13], q[14];
rz(0) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(-0.22881309993368681) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(3*pi) q[13];
h q[13];
cx q[0], q[13];
h q[13];
h q[13];
cx q[1], q[13];
h q[13];
h q[13];
cx q[2], q[13];
h q[13];
h q[13];
cx q[3], q[13];
h q[13];
h q[13];
cx q[4], q[13];
h q[13];
h q[13];
cx q[5], q[13];
h q[13];
h q[13];
cx q[6], q[13];
h q[13];
h q[13];
cx q[7], q[13];
h q[13];
h q[13];
cx q[8], q[13];
h q[13];
h q[13];
cx q[9], q[13];
h q[13];
h q[13];
cx q[10], q[13];
h q[13];
h q[13];
cx q[11], q[13];
h q[13];
h q[13];
cx q[12], q[13];
h q[13];
h q[14];
rz(0) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(6.7600326550206535) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(3*pi) q[14];
h q[14];
cx q[0], q[14];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(7.022686155767763) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
h q[14];
h q[14];
cx q[1], q[14];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(1.315922672052953) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
h q[1];
cx q[0], q[1];
h q[1];
h q[14];
h q[14];
cx q[2], q[14];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(2.026828619989903) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
h q[2];
cx q[0], q[2];
h q[2];
h q[2];
cx q[1], q[2];
h q[2];
h q[14];
h q[14];
cx q[3], q[14];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(0.3964998636787431) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi) q[3];
h q[3];
cx q[0], q[3];
h q[3];
h q[3];
cx q[1], q[3];
h q[3];
h q[3];
cx q[2], q[3];
h q[3];
h q[14];
h q[14];
cx q[4], q[14];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(8.196808490348703) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi) q[4];
h q[4];
cx q[0], q[4];
h q[4];
h q[4];
cx q[1], q[4];
h q[4];
h q[4];
cx q[2], q[4];
h q[4];
h q[4];
cx q[3], q[4];
h q[4];
h q[14];
h q[14];
cx q[5], q[14];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(7.2129240989379735) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi) q[5];
h q[5];
cx q[0], q[5];
h q[5];
h q[5];
cx q[1], q[5];
h q[5];
h q[5];
cx q[2], q[5];
h q[5];
h q[5];
cx q[3], q[5];
h q[5];
h q[5];
cx q[4], q[5];
h q[5];
h q[14];
h q[14];
cx q[6], q[14];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(-1.3806478804678166) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
h q[6];
cx q[0], q[6];
h q[6];
h q[6];
cx q[1], q[6];
h q[6];
h q[6];
cx q[2], q[6];
h q[6];
h q[6];
cx q[3], q[6];
h q[6];
h q[6];
cx q[4], q[6];
h q[6];
h q[6];
cx q[5], q[6];
h q[6];
h q[14];
h q[14];
cx q[7], q[14];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(-0.43639483869150686) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi) q[7];
h q[7];
cx q[0], q[7];
h q[7];
h q[7];
cx q[1], q[7];
h q[7];
h q[7];
cx q[2], q[7];
h q[7];
h q[7];
cx q[3], q[7];
h q[7];
h q[7];
cx q[4], q[7];
h q[7];
h q[7];
cx q[5], q[7];
h q[7];
h q[7];
cx q[6], q[7];
h q[7];
h q[14];
h q[14];
cx q[8], q[14];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(5.010452943569764) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3*pi) q[8];
h q[8];
cx q[0], q[8];
h q[8];
h q[8];
cx q[1], q[8];
h q[8];
h q[8];
cx q[2], q[8];
h q[8];
h q[8];
cx q[3], q[8];
h q[8];
h q[8];
cx q[4], q[8];
h q[8];
h q[8];
cx q[5], q[8];
h q[8];
h q[8];
cx q[6], q[8];
h q[8];
h q[8];
cx q[7], q[8];
h q[8];
h q[14];
h q[14];
cx q[9], q[14];
rz(0) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(6.754957200099444) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3*pi) q[9];
h q[9];
cx q[0], q[9];
h q[9];
h q[9];
cx q[1], q[9];
h q[9];
h q[9];
cx q[2], q[9];
h q[9];
h q[9];
cx q[3], q[9];
h q[9];
h q[9];
cx q[4], q[9];
h q[9];
h q[9];
cx q[5], q[9];
h q[9];
h q[9];
cx q[6], q[9];
h q[9];
h q[9];
cx q[7], q[9];
h q[9];
h q[9];
cx q[8], q[9];
h q[9];
h q[14];
h q[14];
cx q[10], q[14];
rz(0) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(0.17852884841288308) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(3*pi) q[10];
h q[10];
cx q[0], q[10];
h q[10];
h q[10];
cx q[1], q[10];
h q[10];
h q[10];
cx q[2], q[10];
h q[10];
h q[10];
cx q[3], q[10];
h q[10];
h q[10];
cx q[4], q[10];
h q[10];
h q[10];
cx q[5], q[10];
h q[10];
h q[10];
cx q[6], q[10];
h q[10];
h q[10];
cx q[7], q[10];
h q[10];
h q[10];
cx q[8], q[10];
h q[10];
h q[10];
cx q[9], q[10];
h q[10];
h q[14];
h q[14];
cx q[11], q[14];
rz(0) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(4.412067663662183) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(3*pi) q[11];
h q[11];
cx q[0], q[11];
h q[11];
h q[11];
cx q[1], q[11];
h q[11];
h q[11];
cx q[2], q[11];
h q[11];
h q[11];
cx q[3], q[11];
h q[11];
h q[11];
cx q[4], q[11];
h q[11];
h q[11];
cx q[5], q[11];
h q[11];
h q[11];
cx q[6], q[11];
h q[11];
h q[11];
cx q[7], q[11];
h q[11];
h q[11];
cx q[8], q[11];
h q[11];
h q[11];
cx q[9], q[11];
h q[11];
h q[11];
cx q[10], q[11];
h q[11];
h q[14];
h q[14];
cx q[12], q[14];
rz(0) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(-1.8597450504906865) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(3*pi) q[12];
h q[12];
cx q[0], q[12];
h q[12];
h q[12];
cx q[1], q[12];
h q[12];
h q[12];
cx q[2], q[12];
h q[12];
h q[12];
cx q[3], q[12];
h q[12];
h q[12];
cx q[4], q[12];
h q[12];
h q[12];
cx q[5], q[12];
h q[12];
h q[12];
cx q[6], q[12];
h q[12];
h q[12];
cx q[7], q[12];
h q[12];
h q[12];
cx q[8], q[12];
h q[12];
h q[12];
cx q[9], q[12];
h q[12];
h q[12];
cx q[10], q[12];
h q[12];
h q[12];
cx q[11], q[12];
h q[12];
h q[14];
h q[14];
cx q[13], q[14];
rz(0) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(4.069730169986155) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(3*pi) q[13];
h q[13];
cx q[0], q[13];
h q[13];
h q[13];
cx q[1], q[13];
h q[13];
h q[13];
cx q[2], q[13];
h q[13];
h q[13];
cx q[3], q[13];
h q[13];
h q[13];
cx q[4], q[13];
h q[13];
h q[13];
cx q[5], q[13];
h q[13];
h q[13];
cx q[6], q[13];
h q[13];
h q[13];
cx q[7], q[13];
h q[13];
h q[13];
cx q[8], q[13];
h q[13];
h q[13];
cx q[9], q[13];
h q[13];
h q[13];
cx q[10], q[13];
h q[13];
h q[13];
cx q[11], q[13];
h q[13];
h q[13];
cx q[12], q[13];
h q[13];
h q[14];
rz(0) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(5.921375780555543) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(3*pi) q[14];
h q[14];
cx q[0], q[14];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(-2.164294022235567) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
h q[14];
h q[14];
cx q[1], q[14];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(8.210351739997094) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
h q[14];
h q[14];
cx q[2], q[14];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3.473465708517061) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
h q[14];
h q[14];
cx q[3], q[14];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(6.281230602753833) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi) q[3];
h q[14];
h q[14];
cx q[4], q[14];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(0.38423188264446306) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi) q[4];
h q[14];
h q[14];
cx q[5], q[14];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(5.804220581789333) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi) q[5];
h q[14];
h q[14];
cx q[6], q[14];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(8.530505969600192) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
h q[14];
h q[14];
cx q[7], q[14];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(-0.7151403152322771) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi) q[7];
h q[14];
h q[14];
cx q[8], q[14];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(-2.2583750496360366) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3*pi) q[8];
h q[14];
h q[14];
cx q[9], q[14];
rz(0) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3.719357348819363) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3*pi) q[9];
h q[14];
h q[14];
cx q[10], q[14];
rz(0) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(3.556219790091506) q[10];
rz(-pi/2) q[10];
h q[10];
rz(-pi/2) q[10];
rz(3*pi) q[10];
h q[14];
h q[14];
cx q[11], q[14];
rz(0) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(3.2045443496712798) q[11];
rz(-pi/2) q[11];
h q[11];
rz(-pi/2) q[11];
rz(3*pi) q[11];
h q[14];
h q[14];
cx q[12], q[14];
rz(0) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(4.912886442405293) q[12];
rz(-pi/2) q[12];
h q[12];
rz(-pi/2) q[12];
rz(3*pi) q[12];
h q[14];
h q[14];
cx q[13], q[14];
rz(0) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(-1.8078293681996271) q[13];
rz(-pi/2) q[13];
h q[13];
rz(-pi/2) q[13];
rz(3*pi) q[13];
h q[14];
rz(0) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(4.436969559879993) q[14];
rz(-pi/2) q[14];
h q[14];
rz(-pi/2) q[14];
rz(3*pi) q[14];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], q[11], q[12], q[13], q[14];
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