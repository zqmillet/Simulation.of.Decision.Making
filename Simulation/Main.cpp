#include "Main.h"

using namespace std;

int main()
{
    // Create attack nodes.
    NodeType NodeType = Attack;
    Node a1("Network Scanning", NodeType);
    Node a2("Vulnerability scanning", NodeType);
    Node a3("Buffer overflow attack on HDS", NodeType);
    Node a4("FTP attack on HDS", NodeType);
    Node a5("Brute force attack on HDS", NodeType);
    Node a6("DoS attack on HDS", NodeType);
    Node a7("Buffer overflow attack on ES", NodeType);
    Node a8("Privilege escalation attack on ES", NodeType);
    Node a9("Spoofing attack on ES", NodeType);
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
    Node r1("IP addresses of HDS and ES", NodeType);
    Node r2("Buffer overflow vulnerability", NodeType);
    Node r3("FTP server vulnerability", NodeType);
    Node r4("Login vulnerability", NodeType);
    Node r5("Buffer overflow vulnerability", NodeType);
    Node r6("Authentication vulnerability", NodeType);
    Node r7("Administrator authority of HDS", NodeType);
    Node r8("Crash of HDS", NodeType);
    Node r9("Administrator authority of ES", NodeType);

    // Create function nodes.
    NodeType = Function;
    Node f1("Traffic control of V1", NodeType);
    Node f2("Traffic control of V2", NodeType);
    Node f3("Traffic control of V3", NodeType);
    Node f4("Pressure reducing", NodeType);
    Node f5("Heating function", NodeType);
    Node f6("Mixing function", NodeType);
    Node f7("Liquid level sensation", NodeType);
    Node f8("Temperature sensation", NodeType);
    Node f9("Pressure sensation", NodeType);
    Node f10("Liquid level control", NodeType);
    Node f11("Temperature control", NodeType);
    Node f12("Pressure control", NodeType);

    // Create incident nodes.
    NodeType = Incident;
    Node e1("Excessive liquid level", NodeType);
    Node e2("Low liquid level", NodeType);
    Node e3("Temperature anomaly", NodeType);
    Node e4("Excessive pressure", NodeType);
    Node e5("Heater dry fired", NodeType);
    Node e6("Reactor explosion", NodeType);
    Node e7("Liquid overflow", NodeType);
    Node e8("Blender stop", NodeType);

    // Create asset nodes.
    NodeType = Asset;
    Node x1("Product damaged", NodeType);
    Node x2("Tank damaged", NodeType);
    Node x3("Heater damaged", NodeType);
    Node x4("Sensors damaged", NodeType);
    Node x5("Staff1-4injured", NodeType);
    Node x6("Staff5-9 injured", NodeType);
    Node x7("Water pollution", NodeType);
    Node x8("Air pollution", NodeType);



    system("pause");
    return EXIT_SUCCESS;
}

