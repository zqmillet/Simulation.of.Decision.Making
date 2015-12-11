#include "Main.h"

using namespace std;

int main()
{
    // Create attack nodes.
    NodeType NodeType = Attack;
    Node a01("Network Scanning", NodeType);
    Node a02("Vulnerability scanning", NodeType);
    Node a03("Buffer overflow attack on HDS", NodeType);
    Node a04("FTP attack on HDS", NodeType);
    Node a05("Brute force attack on HDS", NodeType);
    Node a06("DoS attack on HDS", NodeType);
    Node a07("Buffer overflow attack on ES", NodeType);
    Node a08("Privilege escalation attack on ES", NodeType);
    Node a09("Spoofing attack on ES", NodeType);
    Node a10("DoS attack on PLC1", NodeType);
    Node a11("DoS attack on PLC2", NodeType);
    Node a12("DoS attack on PLC3", NodeType);
    Node a13("DoS attack on PLC4", NodeType);
    Node a14("DoS attack on PLC5", NodeType);
    Node a15("DoS attack on PLC6", NodeType);
    Node a16("Reconfiguration of PLC1", NodeType);
    Node a17("Reconfiguration of PLC2", NodeType);
    Node a18("Reconfiguration of PLC3", NodeType);
    Node a19("Reconfiguration of PLC4", NodeType);
    Node a20("Reconfiguration of PLC5", NodeType);
    Node a21("Reconfiguration of PLC6", NodeType);
    Node a22("Man-in-the-middle attack on PLC1", NodeType);
    Node a23("Man-in-the-middle attack on PLC2", NodeType);
    Node a24("Man-in-the-middle attack on PLC3", NodeType);
    Node a25("Man-in-the-middle attack on PLC4", NodeType);
    Node a26("Man-in-the-middle attack on PLC5", NodeType);
    Node a27("Man-in-the-middle attack on PLC6", NodeType);

    // Create resource nodes.
    NodeType = Resource;
    Node r01("IP addresses of HDS and ES", NodeType);
    Node r02("Buffer overflow vulnerability", NodeType);
    Node r03("FTP server vulnerability", NodeType);
    Node r04("Login vulnerability", NodeType);
    Node r05("Buffer overflow vulnerability", NodeType);
    Node r06("Authentication vulnerability", NodeType);
    Node r07("Administrator authority of HDS", NodeType);
    Node r08("Crash of HDS", NodeType);
    Node r09("Administrator authority of ES", NodeType);

    // Create function nodes.
    NodeType = Function;
    Node f01("Traffic control of V1", NodeType);
    Node f02("Traffic control of V2", NodeType);
    Node f03("Traffic control of V3", NodeType);
    Node f04("Pressure reducing", NodeType);
    Node f05("Heating function", NodeType);
    Node f06("Mixing function", NodeType);
    Node f07("Liquid level sensation", NodeType);
    Node f08("Temperature sensation", NodeType);
    Node f09("Pressure sensation", NodeType);
    Node f10("Liquid level control", NodeType);
    Node f11("Temperature control", NodeType);
    Node f12("Pressure control", NodeType);

    // Create incident nodes.
    NodeType = Incident;
    Node e01("Excessive liquid level", NodeType);
    Node e02("Low liquid level", NodeType);
    Node e03("Temperature anomaly", NodeType);
    Node e04("Excessive pressure", NodeType);
    Node e05("Heater dry fired", NodeType);
    Node e06("Reactor explosion", NodeType);
    Node e07("Liquid overflow", NodeType);
    Node e08("Blender stop", NodeType);

    // Create asset nodes.
    NodeType = Asset;
    Node x01("Product damaged", NodeType);
    Node x02("Tank damaged", NodeType);
    Node x03("Heater damaged", NodeType);
    Node x04("Sensors damaged", NodeType);
    Node x05("Staff1-4 injured", NodeType);
    Node x06("Staff5-9 injured", NodeType);
    Node x07("Water pollution", NodeType);
    Node x08("Air pollution", NodeType);

    // Set the relationships of nodes
    a02.AddParent(r01);
    a03.AddParent(r01, r02);
    a04.AddParent(r01, r03);
    a05.AddParent(r01, r04);
    a06.AddParent(r01);
    a07.AddParent(r01, r05);
    a08.AddParent(r01, r06, r07);
    a09.AddParent(r01, r06, r08);
    a10.AddParent(r07, r09);
    a11.AddParent(r07, r09);
    a12.AddParent(r07, r09);
    a13.AddParent(r07, r09);
    a14.AddParent(r07, r09);
    a15.AddParent(r07, r09);
    a16.AddParent(r09);
    a17.AddParent(r09);
    a18.AddParent(r09);
    a19.AddParent(r09);
    a20.AddParent(r09);
    a21.AddParent(r09);
    a22.AddParent(r07, r09);
    a23.AddParent(r07, r09);
    a24.AddParent(r07, r09);
    a25.AddParent(r07, r09);
    a26.AddParent(r07, r09);
    a27.AddParent(r07, r09);

    r01.AddParent(a01);    
    r02.AddParent(a02);
    r03.AddParent(a02);
    r04.AddParent(a02);    
    r05.AddParent(a02);
    r06.AddParent(a02);
    r07.AddParent(a03, a04, a05);
    r08.AddParent(a06);
    r09.AddParent(a07, a08, a09);
    
    f01.AddParent(a10, a16, a22);
    f02.AddParent(a10, a16, a22);
    f03.AddParent(a15, a21, a27);
    f04.AddParent(a14, a20, a26);
    f05.AddParent(a13, a19, a25);
    f06.AddParent(a12, a18, a24);
    f07.AddParent(a11, a17, a23);
    f08.AddParent(a11, a17, a23);
    f09.AddParent(a11, a17, a23);
    f10.AddParent(f01, f02, f03, f07);
    f11.AddParent(f01, f02, f03, f05, f08);
    f12.AddParent(f04, f09);

    e01.AddParent(f10);
    e02.AddParent(f10);
    e03.AddParent(f11);
    e04.AddParent(f12);
    e05.AddParent(e01);
    e06.AddParent(e04);
    e07.AddParent(e02);
    e08.AddParent(f06);

    x01.AddParent(e03, e04, e06, e07, e08);
    x02.AddParent(e04, e06);
    x03.AddParent(e05, e06);
    x04.AddParent(e06);
    x05.AddParent(e06);
    x06.AddParent(e06, e07);
    x07.AddParent(e06, e07);
    x08.AddParent(e06);

    // Set the conditional probabilities of nodes.
    a01.Probabilities = {
        1e-8
    };

    a02.Probabilities = {
    /*
    r01 F       T
    */
        1e-8,   0.5
    };

    a03.Probabilities = {
    /*
    r02 F       F       T       T
    r01 F       T       F       T
    */
        1e-8,   1e-8,   0.65,   0.65
    };

    a04.Probabilities = {
    /*
    r03 F       F       T       T
    r01 F       T       F       T
    */
        1e-8,   1e-8,   0.65,   0.65
    };

    a05.PrintProbabilities = {
    /*
    r04 F       F       T       T
    r01 F       T       F       T
    */
        1e-8,   1e-8,   0.65,   0.65
    };

    a06.PrintProbabilities = {

    };

    a07.PrintProbabilities = {

    };

    a08.PrintProbabilities = {

    };

    a09.PrintProbabilities = {

    };

    a10.PrintProbabilities = {

    };

    a11.PrintProbabilities = {

    };

    a12.PrintProbabilities = {

    };

    a13.PrintProbabilities = {

    };

    a14.PrintProbabilities = {

    };

    a15.PrintProbabilities = {

    };

    a16.PrintProbabilities = {

    };

    a17.PrintProbabilities = {

    };

    a18.PrintProbabilities = {

    };

    a19.PrintProbabilities = {

    };

    a20.PrintProbabilities = {

    };

    a21.PrintProbabilities = {

    };

    a22.PrintProbabilities = {

    };

    a23.PrintProbabilities = {

    };

    a24.PrintProbabilities = {

    };

    a25.PrintProbabilities = {

    };
    
    a26.PrintProbabilities = {

    };

    a27.PrintProbabilities = {

    };



    system("pause");
    return EXIT_SUCCESS;
}

