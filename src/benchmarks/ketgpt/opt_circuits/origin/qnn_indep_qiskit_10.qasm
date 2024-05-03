OPENQASM 3.0;
include "stdgates.inc";
bit[10] meas;
qubit[10] q;
rz(-3*pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.5707963267948966) q[0];
rz(-3*pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.5707963267948966) q[1];
cx q[0], q[1];
rz(9.17283818781952) q[1];
cx q[0], q[1];
rz(-3*pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3.5707963267948966) q[2];
cx q[0], q[2];
rz(9.17283818781952) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(9.17283818781952) q[2];
cx q[1], q[2];
rz(-3*pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3.5707963267948966) q[3];
cx q[0], q[3];
rz(9.17283818781952) q[3];
cx q[0], q[3];
cx q[1], q[3];
rz(9.17283818781952) q[3];
cx q[1], q[3];
cx q[2], q[3];
rz(9.17283818781952) q[3];
cx q[2], q[3];
rz(-3*pi/2) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3.5707963267948966) q[4];
cx q[0], q[4];
rz(9.17283818781952) q[4];
cx q[0], q[4];
cx q[1], q[4];
rz(9.17283818781952) q[4];
cx q[1], q[4];
cx q[2], q[4];
rz(9.17283818781952) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(9.17283818781952) q[4];
cx q[3], q[4];
rz(-3*pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3.5707963267948966) q[5];
cx q[0], q[5];
rz(9.17283818781952) q[5];
cx q[0], q[5];
cx q[1], q[5];
rz(9.17283818781952) q[5];
cx q[1], q[5];
cx q[2], q[5];
rz(9.17283818781952) q[5];
cx q[2], q[5];
cx q[3], q[5];
rz(9.17283818781952) q[5];
cx q[3], q[5];
cx q[4], q[5];
rz(9.17283818781952) q[5];
cx q[4], q[5];
rz(-3*pi/2) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.5707963267948966) q[6];
cx q[0], q[6];
rz(9.17283818781952) q[6];
cx q[0], q[6];
cx q[1], q[6];
rz(9.17283818781952) q[6];
cx q[1], q[6];
cx q[2], q[6];
rz(9.17283818781952) q[6];
cx q[2], q[6];
cx q[3], q[6];
rz(9.17283818781952) q[6];
cx q[3], q[6];
cx q[4], q[6];
rz(9.17283818781952) q[6];
cx q[4], q[6];
cx q[5], q[6];
rz(9.17283818781952) q[6];
cx q[5], q[6];
rz(-3*pi/2) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3.5707963267948966) q[7];
cx q[0], q[7];
rz(9.17283818781952) q[7];
cx q[0], q[7];
cx q[1], q[7];
rz(9.17283818781952) q[7];
cx q[1], q[7];
cx q[2], q[7];
rz(9.17283818781952) q[7];
cx q[2], q[7];
cx q[3], q[7];
rz(9.17283818781952) q[7];
cx q[3], q[7];
cx q[4], q[7];
rz(9.17283818781952) q[7];
cx q[4], q[7];
cx q[5], q[7];
rz(9.17283818781952) q[7];
cx q[5], q[7];
cx q[6], q[7];
rz(9.17283818781952) q[7];
cx q[6], q[7];
rz(-3*pi/2) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3.5707963267948966) q[8];
cx q[0], q[8];
rz(9.17283818781952) q[8];
cx q[0], q[8];
cx q[1], q[8];
rz(9.17283818781952) q[8];
cx q[1], q[8];
cx q[2], q[8];
rz(9.17283818781952) q[8];
cx q[2], q[8];
cx q[3], q[8];
rz(9.17283818781952) q[8];
cx q[3], q[8];
cx q[4], q[8];
rz(9.17283818781952) q[8];
cx q[4], q[8];
cx q[5], q[8];
rz(9.17283818781952) q[8];
cx q[5], q[8];
cx q[6], q[8];
rz(9.17283818781952) q[8];
cx q[6], q[8];
cx q[7], q[8];
rz(9.17283818781952) q[8];
cx q[7], q[8];
rz(-3*pi/2) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3.5707963267948966) q[9];
cx q[0], q[9];
rz(9.17283818781952) q[9];
cx q[0], q[9];
rz(-3*pi/2) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.5707963267948966) q[0];
cx q[1], q[9];
rz(9.17283818781952) q[9];
cx q[1], q[9];
rz(-3*pi/2) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.5707963267948966) q[1];
cx q[0], q[1];
rz(9.17283818781952) q[1];
cx q[0], q[1];
cx q[2], q[9];
rz(9.17283818781952) q[9];
cx q[2], q[9];
rz(-3*pi/2) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3.5707963267948966) q[2];
cx q[0], q[2];
rz(9.17283818781952) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(9.17283818781952) q[2];
cx q[1], q[2];
cx q[3], q[9];
rz(9.17283818781952) q[9];
cx q[3], q[9];
rz(-3*pi/2) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3.5707963267948966) q[3];
cx q[0], q[3];
rz(9.17283818781952) q[3];
cx q[0], q[3];
cx q[1], q[3];
rz(9.17283818781952) q[3];
cx q[1], q[3];
cx q[2], q[3];
rz(9.17283818781952) q[3];
cx q[2], q[3];
cx q[4], q[9];
rz(9.17283818781952) q[9];
cx q[4], q[9];
rz(-3*pi/2) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3.5707963267948966) q[4];
cx q[0], q[4];
rz(9.17283818781952) q[4];
cx q[0], q[4];
cx q[1], q[4];
rz(9.17283818781952) q[4];
cx q[1], q[4];
cx q[2], q[4];
rz(9.17283818781952) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(9.17283818781952) q[4];
cx q[3], q[4];
cx q[5], q[9];
rz(9.17283818781952) q[9];
cx q[5], q[9];
rz(-3*pi/2) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3.5707963267948966) q[5];
cx q[0], q[5];
rz(9.17283818781952) q[5];
cx q[0], q[5];
cx q[1], q[5];
rz(9.17283818781952) q[5];
cx q[1], q[5];
cx q[2], q[5];
rz(9.17283818781952) q[5];
cx q[2], q[5];
cx q[3], q[5];
rz(9.17283818781952) q[5];
cx q[3], q[5];
cx q[4], q[5];
rz(9.17283818781952) q[5];
cx q[4], q[5];
cx q[6], q[9];
rz(9.17283818781952) q[9];
cx q[6], q[9];
rz(-3*pi/2) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.5707963267948966) q[6];
cx q[0], q[6];
rz(9.17283818781952) q[6];
cx q[0], q[6];
cx q[1], q[6];
rz(9.17283818781952) q[6];
cx q[1], q[6];
cx q[2], q[6];
rz(9.17283818781952) q[6];
cx q[2], q[6];
cx q[3], q[6];
rz(9.17283818781952) q[6];
cx q[3], q[6];
cx q[4], q[6];
rz(9.17283818781952) q[6];
cx q[4], q[6];
cx q[5], q[6];
rz(9.17283818781952) q[6];
cx q[5], q[6];
cx q[7], q[9];
rz(9.17283818781952) q[9];
cx q[7], q[9];
rz(-3*pi/2) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3.5707963267948966) q[7];
cx q[0], q[7];
rz(9.17283818781952) q[7];
cx q[0], q[7];
cx q[1], q[7];
rz(9.17283818781952) q[7];
cx q[1], q[7];
cx q[2], q[7];
rz(9.17283818781952) q[7];
cx q[2], q[7];
cx q[3], q[7];
rz(9.17283818781952) q[7];
cx q[3], q[7];
cx q[4], q[7];
rz(9.17283818781952) q[7];
cx q[4], q[7];
cx q[5], q[7];
rz(9.17283818781952) q[7];
cx q[5], q[7];
cx q[6], q[7];
rz(9.17283818781952) q[7];
cx q[6], q[7];
cx q[8], q[9];
rz(9.17283818781952) q[9];
cx q[8], q[9];
rz(-3*pi/2) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3.5707963267948966) q[8];
cx q[0], q[8];
rz(9.17283818781952) q[8];
cx q[0], q[8];
cx q[1], q[8];
rz(9.17283818781952) q[8];
cx q[1], q[8];
cx q[2], q[8];
rz(9.17283818781952) q[8];
cx q[2], q[8];
cx q[3], q[8];
rz(9.17283818781952) q[8];
cx q[3], q[8];
cx q[4], q[8];
rz(9.17283818781952) q[8];
cx q[4], q[8];
cx q[5], q[8];
rz(9.17283818781952) q[8];
cx q[5], q[8];
cx q[6], q[8];
rz(9.17283818781952) q[8];
cx q[6], q[8];
cx q[7], q[8];
rz(9.17283818781952) q[8];
cx q[7], q[8];
rz(-3*pi/2) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3.5707963267948966) q[9];
cx q[0], q[9];
rz(9.17283818781952) q[9];
cx q[0], q[9];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.1923692164647535) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
cx q[1], q[9];
rz(9.17283818781952) q[9];
cx q[1], q[9];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.1486005882890513) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
cx q[2], q[9];
rz(9.17283818781952) q[9];
cx q[2], q[9];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3.395839779777046) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
cx q[3], q[9];
rz(9.17283818781952) q[9];
cx q[3], q[9];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(4.101294943857223) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi) q[3];
cx q[4], q[9];
rz(9.17283818781952) q[9];
cx q[4], q[9];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3.2980895513737183) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi) q[4];
cx q[5], q[9];
rz(9.17283818781952) q[9];
cx q[5], q[9];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3.567767507893585) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi) q[5];
cx q[6], q[9];
rz(9.17283818781952) q[9];
cx q[6], q[9];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.906244149047525) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
cx q[7], q[9];
rz(9.17283818781952) q[9];
cx q[7], q[9];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3.1784891551108605) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi) q[7];
cx q[8], q[9];
rz(9.17283818781952) q[9];
cx q[8], q[9];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3.244432570242849) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3*pi) q[8];
rz(0) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3.957954491957448) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3*pi) q[9];
cx q[8], q[9];
cx q[7], q[8];
cx q[6], q[7];
cx q[5], q[6];
cx q[4], q[5];
cx q[3], q[4];
cx q[2], q[3];
cx q[1], q[2];
cx q[0], q[1];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3.5102195144281683) q[0];
rz(-pi/2) q[0];
h q[0];
rz(-pi/2) q[0];
rz(3*pi) q[0];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3.996972464742786) q[1];
rz(-pi/2) q[1];
h q[1];
rz(-pi/2) q[1];
rz(3*pi) q[1];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3.568345088715713) q[2];
rz(-pi/2) q[2];
h q[2];
rz(-pi/2) q[2];
rz(3*pi) q[2];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3.5888431500711953) q[3];
rz(-pi/2) q[3];
h q[3];
rz(-pi/2) q[3];
rz(3*pi) q[3];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3.5005807098745283) q[4];
rz(-pi/2) q[4];
h q[4];
rz(-pi/2) q[4];
rz(3*pi) q[4];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3.826950106132807) q[5];
rz(-pi/2) q[5];
h q[5];
rz(-pi/2) q[5];
rz(3*pi) q[5];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3.841530976837129) q[6];
rz(-pi/2) q[6];
h q[6];
rz(-pi/2) q[6];
rz(3*pi) q[6];
rz(0) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3.960564451421396) q[7];
rz(-pi/2) q[7];
h q[7];
rz(-pi/2) q[7];
rz(3*pi) q[7];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3.327560400473855) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-pi/2) q[8];
rz(3*pi) q[8];
rz(0) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3.6224616463771673) q[9];
rz(-pi/2) q[9];
h q[9];
rz(-pi/2) q[9];
rz(3*pi) q[9];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9];
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
