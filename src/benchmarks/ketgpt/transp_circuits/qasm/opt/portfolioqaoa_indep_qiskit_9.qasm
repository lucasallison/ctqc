OPENQASM 3.0;
include "stdgates.inc";
bit[9] meas;
bit[9] meas6;
qubit[9] q;
h q[0];
rz(-6.006749329824105) q[0];
h q[1];
rz(-2.88430587861653) q[1];
cx q[0], q[1];
rz(-3.407547173019436) q[1];
cx q[0], q[1];
h q[2];
rz(-2.8564753852208016) q[2];
cx q[0], q[2];
rz(-3.4075554513604573) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(-3.407528919873285) q[2];
cx q[1], q[2];
h q[3];
rz(-2.8562394645135125) q[3];
cx q[0], q[3];
rz(-3.407576341559032) q[3];
cx q[0], q[3];
cx q[1], q[3];
rz(-3.4075368132371953) q[3];
cx q[1], q[3];
cx q[2], q[3];
rz(-3.4075632547685806) q[3];
cx q[2], q[3];
h q[4];
rz(-2.874910574283019) q[4];
cx q[0], q[4];
rz(-3.407527981347641) q[4];
cx q[0], q[4];
cx q[1], q[4];
rz(-3.4076213954730354) q[4];
cx q[1], q[4];
cx q[2], q[4];
rz(-3.4074974398513183) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(-3.4075767016987433) q[4];
cx q[3], q[4];
h q[5];
rz(-2.8713834441392194) q[5];
cx q[0], q[5];
rz(-3.4075806495833523) q[5];
cx q[0], q[5];
cx q[1], q[5];
rz(-3.4075383931684233) q[5];
cx q[1], q[5];
cx q[2], q[5];
rz(-3.407627161802712) q[5];
cx q[2], q[5];
cx q[3], q[5];
rz(-3.4074405558988348) q[5];
cx q[3], q[5];
cx q[4], q[5];
rz(-3.40751276084035) q[5];
cx q[4], q[5];
h q[6];
rz(-2.879252758167225) q[6];
cx q[0], q[6];
rz(-3.407584387053222) q[6];
cx q[0], q[6];
cx q[1], q[6];
rz(-3.4075784799020945) q[6];
cx q[1], q[6];
cx q[2], q[6];
rz(-3.407434872382642) q[6];
cx q[2], q[6];
cx q[3], q[6];
rz(-3.407605160223672) q[6];
cx q[3], q[6];
cx q[4], q[6];
rz(-3.407610232689953) q[6];
cx q[4], q[6];
cx q[5], q[6];
rz(-3.407524491584534) q[6];
cx q[5], q[6];
h q[7];
rz(-2.881832291849081) q[7];
cx q[0], q[7];
rz(-3.4075754698876892) q[7];
cx q[0], q[7];
cx q[1], q[7];
rz(-3.4075363126006386) q[7];
cx q[1], q[7];
cx q[2], q[7];
rz(-3.4074437203384096) q[7];
cx q[2], q[7];
cx q[3], q[7];
rz(-3.4075315174018868) q[7];
cx q[3], q[7];
cx q[4], q[7];
rz(-3.4076119454949967) q[7];
cx q[4], q[7];
cx q[5], q[7];
rz(-3.4075135282495213) q[7];
cx q[5], q[7];
cx q[6], q[7];
rz(-3.407591875333997) q[7];
cx q[6], q[7];
h q[8];
rz(-2.874918623762537) q[8];
cx q[0], q[8];
rz(-3.4075275034330175) q[8];
cx q[0], q[8];
h q[0];
rz(0.2591893525819402) q[0];
h q[0];
rz(3.317868524404803) q[0];
cx q[1], q[8];
rz(-3.4074730370736313) q[8];
cx q[1], q[8];
rz(-pi) q[1];
h q[1];
rz(0.2591893525819402) q[1];
h q[1];
rz(6.440873113729653) q[1];
cx q[0], q[1];
rz(-3.307694209588605) q[1];
cx q[0], q[1];
cx q[2], q[8];
rz(-3.407529841218551) q[8];
cx q[2], q[8];
rz(-pi) q[2];
h q[2];
rz(0.2591893525819402) q[2];
h q[2];
rz(6.46788807703931) q[2];
cx q[0], q[2];
rz(-3.3077022453454914) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(-3.3076764913230123) q[2];
cx q[1], q[2];
cx q[3], q[8];
rz(-3.407544951362952) q[8];
cx q[3], q[8];
rz(-pi) q[3];
h q[3];
rz(0.2591893525819402) q[3];
h q[3];
rz(6.468117084450743) q[3];
cx q[0], q[3];
rz(-3.307722523388715) q[3];
cx q[0], q[3];
cx q[1], q[3];
rz(-3.3076841533839536) q[3];
cx q[1], q[3];
cx q[2], q[3];
rz(-3.307709820086662) q[3];
cx q[2], q[3];
cx q[4], q[8];
rz(-3.4075402338638563) q[8];
cx q[4], q[8];
rz(-pi) q[4];
h q[4];
rz(0.2591893525819402) q[4];
h q[4];
rz(6.449993103024985) q[4];
cx q[0], q[4];
rz(-3.307675580299428) q[4];
cx q[0], q[4];
cx q[1], q[4];
rz(-3.3077662570666075) q[4];
cx q[1], q[4];
cx q[2], q[4];
rz(-3.30764593377499) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(-3.3077228729750825) q[4];
cx q[3], q[4];
cx q[5], q[8];
rz(-3.4075784553610364) q[8];
cx q[5], q[8];
rz(-pi) q[5];
h q[5];
rz(0.2591893525819402) q[5];
h q[5];
rz(6.4534168760091095) q[5];
cx q[0], q[5];
rz(-3.307726705172965) q[5];
cx q[0], q[5];
cx q[1], q[5];
rz(-3.307685687017711) q[5];
cx q[1], q[5];
cx q[2], q[5];
rz(-3.3077718544228034) q[5];
cx q[2], q[5];
cx q[3], q[5];
rz(-3.3075907167198197) q[5];
cx q[3], q[5];
cx q[4], q[5];
rz(-3.3076608058058476) q[5];
cx q[4], q[5];
cx q[6], q[8];
rz(-3.4075021764968527) q[8];
cx q[6], q[8];
rz(-pi) q[6];
h q[6];
rz(0.2591893525819402) q[6];
h q[6];
rz(6.445778160204979) q[6];
cx q[0], q[6];
rz(-3.3077303331219907) q[6];
cx q[0], q[6];
cx q[1], q[6];
rz(-3.307724599070901) q[6];
cx q[1], q[6];
cx q[2], q[6];
rz(-3.307585199750385) q[6];
cx q[2], q[6];
cx q[3], q[6];
rz(-3.307750497566421) q[6];
cx q[3], q[6];
cx q[4], q[6];
rz(-3.3077554213918274) q[6];
cx q[4], q[6];
cx q[5], q[6];
rz(-3.3076721927984973) q[6];
cx q[5], q[6];
cx q[7], q[8];
rz(-3.4075674476771978) q[8];
cx q[7], q[8];
rz(-pi) q[7];
h q[7];
rz(0.2591893525819402) q[7];
h q[7];
rz(6.443274215816336) q[7];
cx q[0], q[7];
rz(-3.307721677260369) q[7];
cx q[0], q[7];
cx q[1], q[7];
rz(-3.3076836674177863) q[7];
cx q[1], q[7];
cx q[2], q[7];
rz(-3.307593788430328) q[7];
cx q[2], q[7];
cx q[3], q[7];
rz(-3.3076790127350075) q[7];
cx q[3], q[7];
cx q[4], q[7];
rz(-3.3077570840057366) q[7];
cx q[4], q[7];
cx q[5], q[7];
rz(-3.3076615507272655) q[7];
cx q[5], q[7];
cx q[6], q[7];
rz(-3.307737601970139) q[7];
cx q[6], q[7];
rz(-pi) q[8];
h q[8];
rz(0.2591893525819402) q[8];
h q[8];
rz(6.449985289423166) q[8];
cx q[0], q[8];
rz(-3.3076751163893627) q[8];
cx q[0], q[8];
h q[0];
rz(3.0499410892167784) q[0];
h q[0];
rz(4.7529755514873315) q[0];
cx q[1], q[8];
rz(-3.3076222460834175) q[8];
cx q[1], q[8];
rz(-pi) q[1];
h q[1];
rz(3.0499410892167784) q[1];
h q[1];
rz(4.74394792165775) q[1];
cx q[0], q[1];
rz(-1.6064415577654465) q[1];
cx q[0], q[1];
cx q[2], q[8];
rz(-3.307677385669663) q[8];
cx q[2], q[8];
rz(-pi) q[2];
h q[2];
rz(3.0499410892167784) q[2];
h q[2];
rz(4.757068227524096) q[2];
cx q[0], q[2];
rz(-1.6064454604762148) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(-1.6064329525690844) q[2];
cx q[1], q[2];
cx q[3], q[8];
rz(-3.307692053034369) q[8];
cx q[3], q[8];
rz(-pi) q[3];
h q[3];
rz(3.0499410892167784) q[3];
h q[3];
rz(4.757179449118187) q[3];
cx q[0], q[3];
rz(-1.6064553088749123) q[3];
cx q[0], q[3];
cx q[1], q[3];
rz(-1.6064366737876536) q[3];
cx q[1], q[3];
cx q[2], q[3];
rz(-1.6064491392863574) q[3];
cx q[2], q[3];
cx q[4], q[8];
rz(-3.3076874737743767) q[8];
cx q[4], q[8];
rz(-pi) q[4];
h q[4];
rz(3.0499410892167784) q[4];
h q[4];
rz(4.74837720951874) q[4];
cx q[0], q[4];
rz(-1.6064325101139925) q[4];
cx q[0], q[4];
cx q[1], q[4];
rz(-1.6064765489271025) q[4];
cx q[1], q[4];
cx q[2], q[4];
rz(-1.6064181117428364) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(-1.6064554786578586) q[4];
cx q[3], q[4];
cx q[5], q[8];
rz(-3.3077245752489817) q[8];
cx q[5], q[8];
rz(-pi) q[5];
h q[5];
rz(3.0499410892167784) q[5];
h q[5];
rz(4.75004002683423) q[5];
cx q[0], q[5];
rz(-1.606457339834118) q[5];
cx q[0], q[5];
cx q[1], q[5];
rz(-1.6064374186246446) q[5];
cx q[1], q[5];
cx q[2], q[5];
rz(-1.6064792673844437) q[5];
cx q[2], q[5];
cx q[3], q[5];
rz(-1.6063912945806373) q[5];
cx q[3], q[5];
cx q[4], q[5];
rz(-1.6064253346137864) q[5];
cx q[4], q[5];
cx q[6], q[8];
rz(-3.3076505316203644) q[8];
cx q[6], q[8];
rz(-pi) q[6];
h q[6];
rz(3.0499410892167784) q[6];
h q[6];
rz(4.746330146253327) q[6];
cx q[0], q[6];
rz(-1.6064591018132235) q[6];
cx q[0], q[6];
cx q[1], q[6];
rz(-1.6064563169675332) q[6];
cx q[1], q[6];
cx q[2], q[6];
rz(-1.6063886151645816) q[6];
cx q[2], q[6];
cx q[3], q[6];
rz(-1.6064688950406105) q[6];
cx q[3], q[6];
cx q[4], q[6];
rz(-1.6064712863855342) q[6];
cx q[4], q[6];
cx q[5], q[6];
rz(-1.606430864912856) q[6];
cx q[5], q[6];
cx q[7], q[8];
rz(-3.307713890128499) q[8];
cx q[7], q[8];
rz(-pi) q[7];
h q[7];
rz(3.0499410892167784) q[7];
h q[7];
rz(4.745114060342911) q[7];
cx q[0], q[7];
rz(-1.6064548979373672) q[7];
cx q[0], q[7];
cx q[1], q[7];
rz(-1.6064364377693892) q[7];
cx q[1], q[7];
cx q[2], q[7];
rz(-1.6063927864124394) q[7];
cx q[2], q[7];
cx q[3], q[7];
rz(-1.606434177138454) q[7];
cx q[3], q[7];
cx q[4], q[7];
rz(-1.6064720938640702) q[7];
cx q[4], q[7];
cx q[5], q[7];
rz(-1.606425696398355) q[7];
cx q[5], q[7];
cx q[6], q[7];
rz(-1.6064626320608832) q[7];
cx q[6], q[7];
rz(-pi) q[8];
h q[8];
rz(3.0499410892167784) q[8];
h q[8];
rz(4.7483734147016) q[8];
cx q[0], q[8];
rz(-1.6064322848076729) q[8];
cx q[0], q[8];
h q[0];
rz(-0.0829192259733551) q[0];
h q[0];
cx q[1], q[8];
rz(-1.6064066073867083) q[8];
cx q[1], q[8];
h q[1];
rz(-0.0829192259733551) q[1];
h q[1];
cx q[2], q[8];
rz(-1.6064333869247218) q[8];
cx q[2], q[8];
h q[2];
rz(-0.0829192259733551) q[2];
h q[2];
cx q[3], q[8];
rz(-1.6064405103958512) q[8];
cx q[3], q[8];
h q[3];
rz(-0.0829192259733551) q[3];
h q[3];
cx q[4], q[8];
rz(-1.6064382863953572) q[8];
cx q[4], q[8];
h q[4];
rz(-0.0829192259733551) q[4];
h q[4];
cx q[5], q[8];
rz(-1.6064563053979868) q[8];
cx q[5], q[8];
h q[5];
rz(-0.0829192259733551) q[5];
h q[5];
cx q[6], q[8];
rz(-1.6064203447696572) q[8];
cx q[6], q[8];
h q[6];
rz(-0.0829192259733551) q[6];
h q[6];
cx q[7], q[8];
rz(-1.606451115975838) q[8];
cx q[7], q[8];
h q[7];
rz(-0.0829192259733551) q[7];
h q[7];
h q[8];
rz(-0.0829192259733551) q[8];
h q[8];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8];
meas[0] = measure q[0];
meas[1] = measure q[1];
meas[2] = measure q[2];
meas[3] = measure q[3];
meas[4] = measure q[4];
meas[5] = measure q[5];
meas[6] = measure q[6];
meas[7] = measure q[7];
meas[8] = measure q[8];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8];
meas6[0] = measure q[0];
meas6[1] = measure q[1];
meas6[2] = measure q[2];
meas6[3] = measure q[3];
meas6[4] = measure q[4];
meas6[5] = measure q[5];
meas6[6] = measure q[6];
meas6[7] = measure q[7];
meas6[8] = measure q[8];