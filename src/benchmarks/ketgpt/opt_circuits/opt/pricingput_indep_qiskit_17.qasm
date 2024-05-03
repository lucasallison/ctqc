OPENQASM 3.0;
include "stdgates.inc";
bit[17] meas;
qubit[17] q;
rz(-pi/2) q[0];
h q[0];
rz(1.5765713111425983) q[0];
h q[0];
rz(5*pi/2) q[0];
rz(-pi/2) q[1];
h q[1];
rz(1.5823090188579112) q[1];
h q[1];
rz(5*pi/2) q[1];
rz(-pi/2) q[2];
h q[2];
rz(1.5935292771638938) q[2];
h q[2];
rz(5*pi/2) q[2];
rz(-pi/2) q[3];
h q[3];
rz(1.6140899847616943) q[3];
h q[3];
rz(5*pi/2) q[3];
rz(-pi/2) q[4];
h q[4];
rz(1.6438454055481637) q[4];
h q[4];
rz(5*pi/2) q[4];
rz(-pi/2) q[5];
h q[5];
rz(1.6611919395054304) q[5];
h q[5];
rz(5*pi/2) q[5];
rz(-pi/2) q[6];
h q[6];
rz(1.6456790807969384) q[6];
h q[6];
rz(5*pi/2) q[6];
rz(-pi/2) q[7];
h q[7];
rz(1.5132577997678176) q[7];
h q[7];
rz(3*pi) q[7];
cx q[7], q[6];
rz(0) q[6];
rz(-pi/2) q[6];
h q[6];
rz(0.8541072460194208) q[6];
h q[6];
rz(5*pi/2) q[6];
cx q[7], q[6];
cx q[6], q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(0.2608149580033374) q[5];
h q[5];
rz(5*pi/2) q[5];
cx q[7], q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(0.11717965633363425) q[5];
h q[5];
rz(5*pi/2) q[5];
cx q[6], q[5];
rz(0) q[5];
rz(-pi/2) q[5];
h q[5];
rz(0.5301791166053285) q[5];
h q[5];
rz(5*pi/2) q[5];
cx q[7], q[5];
cx q[5], q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(0.08104360060191329) q[4];
h q[4];
rz(5*pi/2) q[4];
cx q[6], q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(0.020012001043265393) q[4];
h q[4];
rz(5*pi/2) q[4];
cx q[5], q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(0.16147933412681503) q[4];
h q[4];
rz(5*pi/2) q[4];
cx q[7], q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(0.08313433891710575) q[4];
h q[4];
rz(5*pi/2) q[4];
cx q[5], q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(0.00877166955196218) q[4];
h q[4];
rz(5*pi/2) q[4];
cx q[6], q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(0.040976012555094865) q[4];
h q[4];
rz(5*pi/2) q[4];
cx q[5], q[4];
rz(0) q[4];
rz(-pi/2) q[4];
h q[4];
rz(0.3029932533202988) q[4];
h q[4];
rz(5*pi/2) q[4];
cx q[7], q[4];
cx q[4], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(0.022654896250005052) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[5], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(0.0035065493768620115) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[4], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(0.0450421416570741) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[6], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(0.013696914413324102) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[4], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(0.0011182692042166487) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[5], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(0.00687894201422834) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[4], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(0.08782952500298702) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[7], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(0.047738713710002045) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[4], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(0.004088011156408999) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[5], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(0.0006771520901946992) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[4], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(0.008156349278967134) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[6], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(0.02455986917443198) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[4], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(0.0020702382065489466) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[5], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(0.012355959017209095) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[4], q[3];
rz(0) q[3];
rz(-pi/2) q[3];
h q[3];
rz(0.15971324147727728) q[3];
h q[3];
rz(5*pi/2) q[3];
cx q[7], q[3];
cx q[3], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.005881279961627683) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[4], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.0005033013085249394) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[3], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.011736443963990428) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[5], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.001982792102216635) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[3], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.00010269935370255112) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[4], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.0009944413476556946) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[3], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.023268196170339372) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[6], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.007482407830416982) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[3], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.00038226346340941575) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[4], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(4.5532993902863694e-05) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[3], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.0007616770786906812) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[5], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.0037865929359792716) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[3], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.0001939861331177184) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[4], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.0018990775964478068) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[3], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.045035867252506634) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[7], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.02487174764791744) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[3], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.0012025349853348466) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[4], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.00013833285958941843) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[3], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.002396213285531079) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[5], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.0005420860049838438) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[3], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(3.490754302193366e-05) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[4], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.00027216459264112203) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[3], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.004722820783543913) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[6], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.01296890596182454) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[3], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.0006356976881614074) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[4], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(7.368688837594561e-05) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[3], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.0012667345393642115) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[5], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.006557869129176552) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[3], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.000322505194865208) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[4], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.0032883142271762367) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[3], q[2];
rz(0) q[2];
rz(-pi/2) q[2];
h q[2];
rz(0.08113056048600509) q[2];
h q[2];
rz(5*pi/2) q[2];
cx q[7], q[2];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.0014856810784271701) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[3], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(6.555538256902693e-05) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.0029695171860684155) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[4], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.00026093054583231634) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
cx q[3], q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.00013059457851438694) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.005924405143682421) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[5], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.0010240159327805642) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(2.8480147776122067e-05) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[3], q[1];
cx q[2], q[1];
rz(-pi/2) q[1];
h q[1];
rz(5.687728086112287e-05) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[4], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.0005139909814086963) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(1.4322888107098919e-05) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[3], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.00025724631796952835) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.01173571031386933) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[6], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.003828336682454747) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.0001031895250753756) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[3], q[1];
cx q[2], q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.0002060971473034634) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[4], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(2.7587148057950373e-05) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
cx q[3], q[1];
rz(-pi/2) q[1];
h q[1];
rz(1.3819412787441365e-05) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.0004099705676687826) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[5], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.001941552077616926) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(5.2698893132419045e-05) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[3], q[1];
cx q[2], q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.00010525164289987288) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[4], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.000974351838482157) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(2.6495243993451822e-05) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[3], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.0004876279991696819) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.02266832888749093) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[7], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.012571300282149256) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.0003135656583475033) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[3], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(1.9518127345463654e-05) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.000626398613250867) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[4], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(7.744339382709242e-05) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
cx q[3], q[1];
rz(-pi/2) q[1];
h q[1];
rz(3.8784736049013446e-05) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.0012470090203193784) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[5], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.0003002909957534605) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(1.1142751813686402e-05) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[3], q[1];
cx q[2], q[1];
rz(-pi/2) q[1];
h q[1];
rz(2.22391513182707e-05) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[4], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.00015110136508988958) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
cx q[3], q[1];
rz(-pi/2) q[1];
h q[1];
rz(7.567197922142554e-05) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.0024499043877361792) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[6], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.006578726657583189) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.0001675793852626839) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[3], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(1.0681274804635876e-05) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.0003347480333970587) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[4], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(4.236490548148453e-05) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
cx q[3], q[1];
rz(-pi/2) q[1];
h q[1];
rz(2.1218546249812675e-05) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.0006662528346961238) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[5], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.0033314438914753275) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(8.540083480301774e-05) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[3], q[1];
cx q[2], q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.0001705892684205068) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[4], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.0016711956386643578) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(4.291234975717373e-05) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[3], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.0008362891461062283) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[2], q[1];
rz(0) q[1];
rz(-pi/2) q[1];
h q[1];
rz(0.040735197837102) q[1];
h q[1];
rz(5*pi/2) q[1];
cx q[7], q[1];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.00037241299307844145) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[2], q[0];
cx q[1], q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.0007447069517185767) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[3], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(3.3090980993577546e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
cx q[2], q[0];
rz(-pi/2) q[0];
h q[0];
rz(1.6549878241622906e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.0014884640301890961) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[4], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.00013167257674684407) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[2], q[0];
cx q[3], q[0];
rz(-pi/2) q[0];
h q[0];
rz(6.590555845864543e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
cx q[2], q[0];
rz(-pi/2) q[0];
h q[0];
rz(3.29614699308145e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.002969404325057212) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[5], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.0005162265996583315) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[2], q[0];
rz(-pi/2) q[0];
h q[0];
rz(1.4607266697552745e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[3], q[0];
cx q[2], q[0];
rz(-pi/2) q[0];
h q[0];
rz(2.916738021641052e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[4], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.0002591674481555728) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[2], q[0];
cx q[3], q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.00012971736252787025) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
cx q[2], q[0];
rz(-pi/2) q[0];
h q[0];
rz(6.487544608546614e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.0058808439723883055) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[6], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.0019253364994136213) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(2.629682738275463e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[2], q[0];
cx q[1], q[0];
rz(-pi/2) q[0];
h q[0];
rz(5.257414512316316e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[3], q[0];
cx q[2], q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.00010499290347976142) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[4], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(1.4432994050128656e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[3], q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.0002087641496264503) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[5], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.0009769805966448608) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(1.3451453174440076e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[2], q[0];
cx q[1], q[0];
rz(-pi/2) q[0];
h q[0];
rz(2.689271035016816e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[3], q[0];
cx q[2], q[0];
rz(-pi/2) q[0];
h q[0];
rz(5.3704222894079834e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[4], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.0004903700522214116) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[2], q[0];
rz(-pi/2) q[0];
h q[0];
rz(1.3527308067029509e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[3], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.00024542310368369513) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
cx q[2], q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.0001227414111295566) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.011353318651995625) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[7], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.00630292914325592) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(7.923038682111638e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[2], q[0];
cx q[1], q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.00015841180979547786) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[3], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(1.0039216665091999e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[2], q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.00031643336929798593) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[4], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(3.980235198230986e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[2], q[0];
cx q[3], q[0];
rz(-pi/2) q[0];
h q[0];
rz(1.9936719825253135e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[2], q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.0006297902629390784) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[5], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.00015393870038238333) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[3], q[0];
rz(-pi/2) q[0];
h q[0];
rz(1.1754551406895075e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[4], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(7.7501637454791e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[2], q[0];
cx q[3], q[0];
rz(-pi/2) q[0];
h q[0];
rz(3.881861413956855e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
cx q[2], q[0];
rz(-pi/2) q[0];
h q[0];
rz(1.9417822099576654e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.0012362912729959596) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[6], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.0033014326275067063) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(4.245986665996071e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[2], q[0];
cx q[1], q[0];
rz(-pi/2) q[0];
h q[0];
rz(8.489191154081865e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[3], q[0];
cx q[2], q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.0001695621356807564) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[4], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(2.191039502541514e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[2], q[0];
cx q[3], q[0];
rz(-pi/2) q[0];
h q[0];
rz(1.0976041372678935e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[2], q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.0003373783694842203) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[5], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.0016724633419178403) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(2.166334393338687e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[2], q[0];
cx q[1], q[0];
rz(-pi/2) q[0];
h q[0];
rz(4.331220851527817e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[3], q[0];
cx q[2], q[0];
rz(-pi/2) q[0];
h q[0];
rz(8.650905548579502e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[4], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.0008390728533806957) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(1.088923534675601e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[2], q[0];
cx q[1], q[0];
rz(-pi/2) q[0];
h q[0];
rz(2.1771152515892567e-05) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[3], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.0004198957504852885) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
cx q[2], q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.0002099929242294074) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[1], q[0];
rz(0) q[0];
rz(-pi/2) q[0];
h q[0];
rz(0.020389206874409815) q[0];
h q[0];
rz(5*pi/2) q[0];
cx q[7], q[0];
rz(-pi/2) q[8];
h q[8];
rz(5*pi/8) q[8];
h q[8];
rz(5*pi/2) q[8];
h q[8];
rz(pi/2) q[8];
h q[8];
rz(-0.002693862540588401) q[8];
cx q[0], q[8];
rz(0.002693862540588401) q[8];
cx q[0], q[8];
rz(-0.005387725081176802) q[8];
cx q[1], q[8];
rz(0.005387725081176802) q[8];
cx q[1], q[8];
h q[1];
rz(pi) q[1];
h q[1];
rz(-0.010775450162353603) q[8];
cx q[2], q[8];
rz(0.010775450162353603) q[8];
cx q[2], q[8];
h q[2];
rz(pi) q[2];
h q[2];
rz(-0.021550900324707207) q[8];
cx q[3], q[8];
rz(0.021550900324707207) q[8];
cx q[3], q[8];
h q[3];
rz(pi) q[3];
h q[3];
rz(-0.043101800649414414) q[8];
cx q[4], q[8];
rz(0.043101800649414414) q[8];
cx q[4], q[8];
rz(-0.08620360129882883) q[8];
cx q[5], q[8];
rz(0.08620360129882883) q[8];
cx q[5], q[8];
h q[5];
rz(pi) q[5];
h q[5];
rz(-0.17240720259765765) q[8];
cx q[6], q[8];
rz(0.17240720259765765) q[8];
cx q[6], q[8];
h q[6];
rz(pi) q[6];
h q[6];
rz(-0.3448144051953153) q[8];
cx q[7], q[8];
rz(0.3448144051953153) q[8];
cx q[7], q[8];
h q[8];
rz(-pi/2) q[8];
h q[8];
h q[9];
h q[10];
rz(pi) q[10];
h q[10];
h q[11];
rz(pi) q[11];
cx q[10], q[11];
rz(-pi/4) q[11];
cx q[1], q[11];
rz(pi/4) q[11];
cx q[10], q[11];
rz(pi/4) q[10];
rz(-pi/4) q[11];
cx q[1], q[11];
cx q[1], q[10];
rz(pi/2) q[1];
rz(-pi/4) q[10];
cx q[1], q[10];
rz(5*pi/4) q[11];
h q[11];
h q[12];
rz(pi) q[12];
cx q[11], q[12];
rz(-pi/4) q[12];
cx q[2], q[12];
rz(pi/4) q[12];
cx q[11], q[12];
rz(pi/4) q[11];
rz(-pi/4) q[12];
cx q[2], q[12];
cx q[2], q[11];
rz(pi/2) q[2];
rz(-pi/4) q[11];
cx q[2], q[11];
rz(5*pi/4) q[12];
h q[12];
h q[13];
rz(pi) q[13];
cx q[12], q[13];
rz(-pi/4) q[13];
cx q[3], q[13];
rz(pi/4) q[13];
cx q[12], q[13];
rz(pi/4) q[12];
rz(-pi/4) q[13];
cx q[3], q[13];
cx q[3], q[12];
rz(pi/2) q[3];
rz(-pi/4) q[12];
cx q[3], q[12];
rz(pi/4) q[13];
h q[13];
h q[14];
cx q[13], q[14];
rz(-pi/4) q[14];
cx q[4], q[14];
rz(pi/4) q[14];
cx q[13], q[14];
rz(pi/4) q[13];
rz(-pi/4) q[14];
cx q[4], q[14];
cx q[4], q[13];
rz(3*pi/4) q[4];
rz(-pi/4) q[13];
cx q[4], q[13];
rz(5*pi/4) q[14];
h q[14];
h q[15];
rz(pi) q[15];
cx q[14], q[15];
rz(-pi/4) q[15];
cx q[5], q[15];
rz(pi/4) q[15];
cx q[14], q[15];
rz(pi/4) q[14];
rz(-pi/4) q[15];
cx q[5], q[15];
cx q[5], q[14];
rz(pi/2) q[5];
rz(-pi/4) q[14];
cx q[5], q[14];
rz(5*pi/4) q[15];
h q[15];
h q[16];
rz(pi) q[16];
cx q[15], q[16];
rz(-pi/4) q[16];
cx q[6], q[16];
rz(pi/4) q[16];
cx q[15], q[16];
rz(pi/4) q[15];
rz(-pi/4) q[16];
cx q[6], q[16];
cx q[6], q[15];
rz(pi/2) q[6];
rz(-pi/4) q[15];
cx q[6], q[15];
rz(pi/4) q[16];
h q[16];
cx q[16], q[9];
rz(-pi/4) q[9];
cx q[7], q[9];
rz(pi/4) q[9];
cx q[16], q[9];
rz(-pi/4) q[9];
cx q[7], q[9];
rz(pi/4) q[9];
h q[9];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(pi/8) q[8];
h q[8];
rz(5*pi/2) q[8];
cx q[9], q[8];
rz(-3*pi/2) q[8];
h q[8];
rz(pi/8) q[8];
h q[8];
rz(3*pi/2) q[8];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-0.0013469312702940606) q[8];
h q[8];
rz(5*pi/2) q[8];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(0.0013469312702940606) q[8];
h q[8];
rz(5*pi/2) q[8];
h q[8];
cx q[0], q[8];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
cx q[0], q[8];
rz(pi/4) q[0];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
h q[8];
cx q[9], q[0];
rz(-pi/4) q[0];
cx q[9], q[0];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(0.0013469312702940606) q[8];
h q[8];
rz(5*pi/2) q[8];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-0.0013469312702940606) q[8];
h q[8];
rz(5*pi/2) q[8];
h q[8];
cx q[0], q[8];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
cx q[0], q[8];
rz(pi/4) q[0];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
h q[8];
cx q[9], q[0];
rz(-pi/4) q[0];
cx q[9], q[0];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-0.0026938625405885652) q[8];
h q[8];
rz(5*pi/2) q[8];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(0.0026938625405885652) q[8];
h q[8];
rz(5*pi/2) q[8];
h q[8];
rz(pi/4) q[16];
cx q[7], q[16];
rz(-pi/4) q[16];
cx q[7], q[16];
h q[16];
rz(pi) q[16];
cx q[15], q[16];
rz(-pi/4) q[16];
cx q[6], q[16];
rz(pi/4) q[16];
cx q[15], q[16];
rz(pi/4) q[15];
rz(-pi/4) q[16];
cx q[6], q[16];
cx q[6], q[15];
rz(-pi/4) q[15];
cx q[6], q[15];
h q[6];
rz(pi) q[6];
h q[6];
h q[15];
cx q[14], q[15];
rz(-pi/4) q[15];
cx q[5], q[15];
rz(pi/4) q[15];
cx q[14], q[15];
rz(pi/4) q[14];
rz(-pi/4) q[15];
cx q[5], q[15];
cx q[5], q[14];
rz(-pi/4) q[14];
cx q[5], q[14];
h q[5];
rz(pi) q[5];
h q[5];
h q[14];
rz(pi) q[14];
cx q[13], q[14];
rz(-pi/4) q[14];
cx q[4], q[14];
rz(pi/4) q[14];
cx q[13], q[14];
rz(pi/4) q[13];
rz(-pi/4) q[14];
cx q[4], q[14];
cx q[4], q[13];
rz(-pi/4) q[13];
cx q[4], q[13];
h q[13];
rz(pi) q[13];
cx q[12], q[13];
rz(-pi/4) q[13];
cx q[3], q[13];
rz(pi/4) q[13];
cx q[12], q[13];
rz(pi/4) q[12];
rz(-pi/4) q[13];
cx q[3], q[13];
cx q[3], q[12];
rz(-pi/4) q[12];
cx q[3], q[12];
h q[3];
rz(pi) q[3];
h q[3];
h q[12];
cx q[11], q[12];
rz(-pi/4) q[12];
cx q[2], q[12];
rz(pi/4) q[12];
cx q[11], q[12];
rz(pi/4) q[11];
rz(-pi/4) q[12];
cx q[2], q[12];
cx q[2], q[11];
rz(-pi/4) q[11];
cx q[2], q[11];
h q[2];
rz(pi) q[2];
h q[2];
h q[11];
cx q[10], q[11];
rz(-pi/4) q[11];
cx q[1], q[11];
rz(pi/4) q[11];
cx q[10], q[11];
rz(pi/4) q[10];
rz(-pi/4) q[11];
cx q[1], q[11];
cx q[1], q[10];
rz(-pi/4) q[10];
cx q[1], q[10];
h q[1];
rz(pi) q[1];
h q[1];
cx q[1], q[8];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
cx q[1], q[8];
rz(pi/4) q[1];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
h q[8];
cx q[9], q[1];
rz(-pi/4) q[1];
cx q[9], q[1];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(0.0026938625405885652) q[8];
h q[8];
rz(5*pi/2) q[8];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-0.0026938625405885652) q[8];
h q[8];
rz(5*pi/2) q[8];
h q[8];
cx q[1], q[8];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
cx q[1], q[8];
rz(pi/4) q[1];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
h q[8];
cx q[9], q[1];
rz(-pi/4) q[1];
cx q[9], q[1];
h q[1];
rz(pi) q[1];
h q[1];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-0.005387725081176686) q[8];
h q[8];
rz(5*pi/2) q[8];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(0.005387725081176686) q[8];
h q[8];
rz(5*pi/2) q[8];
h q[8];
cx q[2], q[8];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
cx q[2], q[8];
rz(pi/4) q[2];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
h q[8];
cx q[9], q[2];
rz(-pi/4) q[2];
cx q[9], q[2];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(0.005387725081176686) q[8];
h q[8];
rz(5*pi/2) q[8];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-0.005387725081176686) q[8];
h q[8];
rz(5*pi/2) q[8];
h q[8];
cx q[2], q[8];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
cx q[2], q[8];
rz(pi/4) q[2];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
h q[8];
cx q[9], q[2];
rz(-pi/4) q[2];
cx q[9], q[2];
h q[2];
rz(pi) q[2];
h q[2];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-0.010775450162353817) q[8];
h q[8];
rz(5*pi/2) q[8];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(0.010775450162353817) q[8];
h q[8];
rz(5*pi/2) q[8];
h q[8];
cx q[3], q[8];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
cx q[3], q[8];
rz(pi/4) q[3];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
h q[8];
cx q[9], q[3];
rz(-pi/4) q[3];
cx q[9], q[3];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(0.010775450162353817) q[8];
h q[8];
rz(5*pi/2) q[8];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-0.010775450162353817) q[8];
h q[8];
rz(5*pi/2) q[8];
h q[8];
cx q[3], q[8];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
cx q[3], q[8];
rz(pi/4) q[3];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
h q[8];
cx q[9], q[3];
rz(-pi/4) q[3];
cx q[9], q[3];
h q[3];
rz(pi) q[3];
h q[3];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-0.02155090032470719) q[8];
h q[8];
rz(5*pi/2) q[8];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(0.02155090032470719) q[8];
h q[8];
rz(5*pi/2) q[8];
h q[8];
cx q[4], q[8];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
cx q[4], q[8];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
h q[8];
cx q[9], q[4];
rz(-pi/4) q[4];
cx q[9], q[4];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(0.02155090032470719) q[8];
h q[8];
rz(5*pi/2) q[8];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-0.02155090032470719) q[8];
h q[8];
rz(5*pi/2) q[8];
h q[8];
cx q[4], q[8];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
cx q[4], q[8];
rz(pi/4) q[4];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
h q[8];
cx q[9], q[4];
rz(-pi/4) q[4];
cx q[9], q[4];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-0.04310180064941438) q[8];
h q[8];
rz(5*pi/2) q[8];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(0.04310180064941438) q[8];
h q[8];
rz(5*pi/2) q[8];
h q[8];
cx q[5], q[8];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
cx q[5], q[8];
rz(pi/4) q[5];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
h q[8];
cx q[9], q[5];
rz(-pi/4) q[5];
cx q[9], q[5];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(0.04310180064941438) q[8];
h q[8];
rz(5*pi/2) q[8];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-0.04310180064941438) q[8];
h q[8];
rz(5*pi/2) q[8];
h q[8];
cx q[5], q[8];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
cx q[5], q[8];
rz(pi/4) q[5];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
h q[8];
cx q[9], q[5];
rz(-pi/4) q[5];
cx q[9], q[5];
h q[5];
rz(pi) q[5];
h q[5];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-0.08620360129882876) q[8];
h q[8];
rz(5*pi/2) q[8];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(0.08620360129882876) q[8];
h q[8];
rz(5*pi/2) q[8];
h q[8];
cx q[6], q[8];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
cx q[6], q[8];
rz(pi/4) q[6];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
h q[8];
cx q[9], q[6];
rz(-pi/4) q[6];
cx q[9], q[6];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(0.08620360129882876) q[8];
h q[8];
rz(5*pi/2) q[8];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-0.08620360129882876) q[8];
h q[8];
rz(5*pi/2) q[8];
h q[8];
cx q[6], q[8];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
cx q[6], q[8];
rz(pi/4) q[6];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
h q[8];
cx q[9], q[6];
rz(-pi/4) q[6];
cx q[9], q[6];
h q[6];
rz(pi) q[6];
h q[6];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-0.17240720259765752) q[8];
h q[8];
rz(5*pi/2) q[8];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(0.17240720259765752) q[8];
h q[8];
rz(5*pi/2) q[8];
h q[8];
cx q[7], q[8];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
cx q[7], q[8];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
h q[8];
cx q[9], q[7];
rz(-pi/4) q[7];
cx q[9], q[7];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(0.17240720259765752) q[8];
h q[8];
rz(5*pi/2) q[8];
cx q[9], q[8];
rz(0) q[8];
rz(-pi/2) q[8];
h q[8];
rz(-0.17240720259765752) q[8];
h q[8];
rz(5*pi/2) q[8];
h q[8];
cx q[7], q[8];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
cx q[7], q[8];
rz(pi/4) q[7];
rz(-pi/4) q[8];
cx q[9], q[8];
rz(pi/4) q[8];
h q[8];
cx q[9], q[7];
rz(-pi/4) q[7];
cx q[9], q[7];
h q[9];
rz(pi/4) q[11];
cx q[10], q[11];
rz(-pi/4) q[11];
cx q[1], q[11];
rz(pi/4) q[11];
cx q[10], q[11];
rz(pi/4) q[10];
rz(-pi/4) q[11];
cx q[1], q[11];
cx q[1], q[10];
rz(pi/2) q[1];
rz(-pi/4) q[10];
cx q[1], q[10];
rz(pi/4) q[11];
h q[11];
rz(pi/4) q[12];
cx q[11], q[12];
rz(-pi/4) q[12];
cx q[2], q[12];
rz(pi/4) q[12];
cx q[11], q[12];
rz(pi/4) q[11];
rz(-pi/4) q[12];
cx q[2], q[12];
cx q[2], q[11];
rz(pi/2) q[2];
rz(-pi/4) q[11];
cx q[2], q[11];
rz(pi/4) q[12];
h q[12];
rz(pi/4) q[13];
cx q[12], q[13];
rz(-pi/4) q[13];
cx q[3], q[13];
rz(pi/4) q[13];
cx q[12], q[13];
rz(pi/4) q[12];
rz(-pi/4) q[13];
cx q[3], q[13];
cx q[3], q[12];
rz(pi/2) q[3];
rz(-pi/4) q[12];
cx q[3], q[12];
rz(5*pi/4) q[13];
h q[13];
rz(pi/4) q[14];
cx q[13], q[14];
rz(-pi/4) q[14];
cx q[4], q[14];
rz(pi/4) q[14];
cx q[13], q[14];
rz(pi/4) q[13];
rz(-pi/4) q[14];
cx q[4], q[14];
cx q[4], q[13];
rz(pi/2) q[4];
rz(-pi/4) q[13];
cx q[4], q[13];
rz(5*pi/4) q[14];
h q[14];
rz(pi/4) q[15];
cx q[14], q[15];
rz(-pi/4) q[15];
cx q[5], q[15];
rz(pi/4) q[15];
cx q[14], q[15];
rz(pi/4) q[14];
rz(-pi/4) q[15];
cx q[5], q[15];
cx q[5], q[14];
rz(pi/2) q[5];
rz(-pi/4) q[14];
cx q[5], q[14];
rz(pi/4) q[15];
h q[15];
rz(pi/4) q[16];
cx q[15], q[16];
rz(-pi/4) q[16];
cx q[6], q[16];
rz(pi/4) q[16];
cx q[15], q[16];
rz(pi/4) q[15];
rz(-pi/4) q[16];
cx q[6], q[16];
cx q[6], q[15];
rz(pi/2) q[6];
rz(-pi/4) q[15];
cx q[6], q[15];
rz(5*pi/4) q[16];
h q[16];
cx q[16], q[9];
rz(-pi/4) q[9];
cx q[7], q[9];
rz(pi/4) q[9];
cx q[16], q[9];
rz(-pi/4) q[9];
cx q[7], q[9];
rz(pi/4) q[9];
h q[9];
rz(pi/4) q[16];
cx q[7], q[16];
rz(pi/4) q[7];
rz(-pi/4) q[16];
cx q[7], q[16];
h q[16];
cx q[15], q[16];
rz(-pi/4) q[16];
cx q[6], q[16];
rz(pi/4) q[16];
cx q[15], q[16];
rz(pi/4) q[15];
rz(-pi/4) q[16];
cx q[6], q[16];
cx q[6], q[15];
rz(-pi/4) q[15];
cx q[6], q[15];
h q[6];
rz(pi) q[6];
h q[6];
h q[15];
rz(pi) q[15];
cx q[14], q[15];
rz(-pi/4) q[15];
cx q[5], q[15];
rz(pi/4) q[15];
cx q[14], q[15];
rz(pi/4) q[14];
rz(-pi/4) q[15];
cx q[5], q[15];
cx q[5], q[14];
rz(-pi/4) q[14];
cx q[5], q[14];
h q[5];
rz(pi) q[5];
h q[5];
h q[14];
rz(pi) q[14];
cx q[13], q[14];
rz(-pi/4) q[14];
cx q[4], q[14];
rz(pi/4) q[14];
cx q[13], q[14];
rz(pi/4) q[13];
rz(-pi/4) q[14];
cx q[4], q[14];
cx q[4], q[13];
rz(-pi/4) q[13];
cx q[4], q[13];
h q[13];
cx q[12], q[13];
rz(-pi/4) q[13];
cx q[3], q[13];
rz(pi/4) q[13];
cx q[12], q[13];
rz(pi/4) q[12];
rz(-pi/4) q[13];
cx q[3], q[13];
cx q[3], q[12];
rz(-pi/4) q[12];
cx q[3], q[12];
h q[3];
rz(pi) q[3];
h q[3];
h q[12];
rz(pi) q[12];
cx q[11], q[12];
rz(-pi/4) q[12];
cx q[2], q[12];
rz(pi/4) q[12];
cx q[11], q[12];
rz(pi/4) q[11];
rz(-pi/4) q[12];
cx q[2], q[12];
cx q[2], q[11];
rz(-pi/4) q[11];
cx q[2], q[11];
h q[2];
rz(pi) q[2];
h q[2];
h q[11];
rz(pi) q[11];
cx q[10], q[11];
rz(-pi/4) q[11];
cx q[1], q[11];
rz(pi/4) q[11];
cx q[10], q[11];
rz(pi/4) q[10];
rz(-pi/4) q[11];
cx q[1], q[11];
cx q[1], q[10];
rz(-pi/4) q[10];
cx q[1], q[10];
h q[1];
rz(pi) q[1];
h q[1];
h q[10];
rz(pi) q[10];
h q[10];
rz(5*pi/4) q[11];
h q[11];
rz(5*pi/4) q[12];
h q[12];
rz(5*pi/4) q[13];
h q[13];
rz(pi/4) q[14];
h q[14];
rz(5*pi/4) q[15];
h q[15];
rz(5*pi/4) q[16];
h q[16];
barrier q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7], q[8], q[9], q[10], q[11], q[12], q[13], q[14], q[15], q[16];
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
