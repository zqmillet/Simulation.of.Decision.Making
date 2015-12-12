#include "Main.h"

using namespace std;

int main()
{
#pragma region Create the Nodes of Bayesian Network
    #pragma region Attack Nodes
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
    #pragma endregion

    #pragma region Resource Nodes
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
    #pragma endregion

    #pragma region Function Nodes
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
    #pragma endregion  

    #pragma region  Incident Nodes
    NodeType = Incident;
    Node e01("Excessive liquid level", NodeType);
    Node e02("Low liquid level", NodeType);
    Node e03("Temperature anomaly", NodeType);
    Node e04("Excessive pressure", NodeType);
    Node e05("Heater dry fired", NodeType);
    Node e06("Reactor explosion", NodeType);
    Node e07("Liquid overflow", NodeType);
    Node e08("Blender stop", NodeType);
    #pragma endregion

    #pragma region Asset Nodes
    NodeType = Asset;
    Node x01("Product damaged", NodeType);
    Node x02("Tank damaged", NodeType);
    Node x03("Heater damaged", NodeType);
    Node x04("Sensors damaged", NodeType);
    Node x05("Staff1-4 injured", NodeType);
    Node x06("Staff5-9 injured", NodeType);
    Node x07("Water pollution", NodeType);
    Node x08("Air pollution", NodeType);
    #pragma endregion
#pragma endregion

#pragma region Set the Conditional Probabilities of Nodes
    #pragma region Attack Nodes
    a01.AddAllParents(// Has no parent node
        0.00000001);

    a02.AddAllParents(r01,
        0.00000001,  // F
        0.99999900); // T
        
    a03.AddAllParents(r01, r02,
        0.00000001,  // F    F
        0.65000000,  // F    T
        0.00000001,  // T    F
        0.65000000); // T    T
    
    a04.AddAllParents(r01, r03,
        0.00000001,  // F    F
        0.65000000,  // F    T
        0.00000001,  // T    F
        0.65000000); // T    T

    a05.AddAllParents(r01, r04,
        0.00000001,  // F    F
        0.65000000,  // F    T
        0.00000001,  // T    F
        0.65000000); // T    T

    a06.AddAllParents(r01,
        0.00000001,  // F
        0.10000000); // T

    a07.AddAllParents(r01, r05,
        0.00000001,  // F    F
        0.65000000,  // F    T
        0.00000001,  // T    F
        0.65000000); // T    T


    a08.AddAllParents(r01, r06, r07,
        0.00000001,  // F    F    F
        0.00000001,  // F    F    T
        0.00000001,  // F    T    F
        0.00000001,  // F    T    T
        0.00000001,  // T    F    F
        0.00000001,  // T    F    T
        0.00000001,  // T    T    F
        0.80000000); // T    T    T

    a09.AddAllParents(r01, r06, r08,
        0.00000001,  // F    F    F
        0.00000001,  // F    F    T
        0.00000001,  // F    T    F
        0.00000001,  // F    T    T
        0.00000001,  // T    F    F
        0.00000001,  // T    F    T
        0.00000001,  // T    T    F
        0.80000000); // T    T    T

    a10.AddAllParents(r07, r09,
        0.00000001,  // F    F
        0.30000000,  // F    T
        0.30000000,  // T    F
        0.30000000); // T    T

    a11.AddAllParents(r07, r09,
        0.00000001,  // F    F
        0.30000000,  // F    T
        0.30000000,  // T    F
        0.30000000); // T    T

    a12.AddAllParents(r07, r09,
        0.00000001,  // F    F
        0.30000000,  // F    T
        0.30000000,  // T    F
        0.30000000); // T    T

    a13.AddAllParents(r07, r09,
        0.00000001,  // F    F
        0.30000000,  // F    T
        0.30000000,  // T    F
        0.30000000); // T    T

    a14.AddAllParents(r07, r09,
        0.00000001,  // F    F
        0.30000000,  // F    T
        0.30000000,  // T    F
        0.30000000); // T    T

    a15.AddAllParents(r07, r09,
        0.00000001,  // F    F
        0.30000000,  // F    T
        0.30000000,  // T    F
        0.30000000); // T    T

    a16.AddAllParents(r09,
        0.00000001,  // F
        0.30000000); // T

    a17.AddAllParents(r09,
        0.00000001,  // F
        0.30000000); // T

    a18.AddAllParents(r09,
        0.00000001,  // F
        0.30000000); // T

    a19.AddAllParents(r09,
        0.00000001,  // F
        0.30000000); // T

    a20.AddAllParents(r09,
        0.00000001,  // F
        0.30000000); // T

    a21.AddAllParents(r09,
        0.00000001,  // F
        0.30000000); // T

    a22.AddAllParents(r07, r09,
        0.00000001,  // F    F
        0.30000000,  // F    T
        0.30000000,  // T    F
        0.30000000); // T    T

    a23.AddAllParents(r07, r09,
        0.00000001,  // F    F
        0.30000000,  // F    T
        0.30000000,  // T    F
        0.30000000); // T    T

    a24.AddAllParents(r07, r09,
        0.00000001,  // F    F
        0.30000000,  // F    T
        0.30000000,  // T    F
        0.30000000); // T    T

    a25.AddAllParents(r07, r09,
        0.00000001,  // F    F
        0.30000000,  // F    T
        0.30000000,  // T    F
        0.30000000); // T    T

    a26.AddAllParents(r07, r09,
        0.00000001,  // F    F
        0.30000000,  // F    T
        0.30000000,  // T    F
        0.30000000); // T    T

    a27.AddAllParents(r07, r09,
        0.00000001,  // F    F
        0.30000000,  // F    T
        0.30000000,  // T    F
        0.30000000); // T    T
    #pragma endregion

    #pragma region Resource Nodes
    r01.AddAllParents(a01,
        0.00000001,  // F
        0.99999900); // T

    r02.AddAllParents(a02,
        0.00000001,  // F
        0.60000000); // T

    r03.AddAllParents(a02,
        0.00000001,  // F
        0.60000000); // T

    r04.AddAllParents(a02,
        0.00000001,  // F
        0.60000000); // T

    r05.AddAllParents(a02,
        0.00000001,  // F
        0.60000000); // T

    r06.AddAllParents(a02,
        0.00000001,  // F
        0.60000000); // T

    r07.AddAllParents(a03, a04, a05,
        0.00000001,  // F    F    F
        0.20000000,  // F    F    T
        0.10000000,  // F    T    F
        0.50000000,  // F    T    T
        0.10000000,  // T    F    F
        0.50000000,  // T    F    T
        0.50000000,  // T    T    F
        0.90000000); // T    T    T

    r08.AddAllParents(a06,
        0.00000001,  // F
        0.80000000); // T

    r09.AddAllParents(a07, a08, a09,
        0.00000001,  // F    F    F
        0.80000000,  // F    F    T
        0.10000000,  // F    T    F
        0.86000000,  // F    T    T
        0.80000000,  // T    F    F
        0.85000000,  // T    F    T
        0.90000000,  // T    T    F
        0.92000000); // T    T    T
    #pragma endregion

    #pragma region Function Nodes
    f01.AddAllParents(a10, a16, a22,
        0.00000001,  // F    F    F
        0.30000000,  // F    F    T
        0.30000000,  // F    T    F
        0.60000000,  // F    T    T
        0.30000000,  // T    F    F
        0.60000000,  // T    F    T
        0.60000000,  // T    T    F
        0.88500000); // T    T    T

    f02.AddAllParents(a10, a16, a22,
        0.00000001,  // F    F    F
        0.30000000,  // F    F    T
        0.30000000,  // F    T    F
        0.60000000,  // F    T    T
        0.30000000,  // T    F    F
        0.60000000,  // T    F    T
        0.60000000,  // T    T    F
        0.88500000); // T    T    T

    f03.AddAllParents(a15, a21, a27,
        0.00000001,  // F    F    F
        0.30000000,  // F    F    T
        0.30000000,  // F    T    F
        0.60000000,  // F    T    T
        0.30000000,  // T    F    F
        0.60000000,  // T    F    T
        0.60000000,  // T    T    F
        0.88500000); // T    T    T

    f04.AddAllParents(a14, a20, a26,
        0.00000001,  // F    F    F
        0.30000000,  // F    F    T
        0.30000000,  // F    T    F
        0.60000000,  // F    T    T
        0.30000000,  // T    F    F
        0.60000000,  // T    F    T
        0.60000000,  // T    T    F
        0.88500000); // T    T    T

    f05.AddAllParents(a13, a19, a25,
        0.00000001,  // F    F    F
        0.30000000,  // F    F    T
        0.30000000,  // F    T    F
        0.60000000,  // F    T    T
        0.30000000,  // T    F    F
        0.60000000,  // T    F    T
        0.60000000,  // T    T    F
        0.88500000); // T    T    T

    f06.AddAllParents(a12, a18, a24,
        0.00000001,  // F    F    F
        0.30000000,  // F    F    T
        0.30000000,  // F    T    F
        0.60000000,  // F    T    T
        0.30000000,  // T    F    F
        0.60000000,  // T    F    T
        0.60000000,  // T    T    F
        0.88500000); // T    T    T

    f07.AddAllParents(a11, a17, a23,
        0.00000001,  // F    F    F
        0.30000000,  // F    F    T
        0.30000000,  // F    T    F
        0.60000000,  // F    T    T
        0.30000000,  // T    F    F
        0.60000000,  // T    F    T
        0.60000000,  // T    T    F
        0.88500000); // T    T    T

    f08.AddAllParents(a11, a17, a23,
        0.00000001,  // F    F    F
        0.30000000,  // F    F    T
        0.30000000,  // F    T    F
        0.60000000,  // F    T    T
        0.30000000,  // T    F    F
        0.60000000,  // T    F    T
        0.60000000,  // T    T    F
        0.88500000); // T    T    T

    f09.AddAllParents(a11, a17, a23,
        0.00000001,  // F    F    F
        0.30000000,  // F    F    T
        0.30000000,  // F    T    F
        0.60000000,  // F    T    T
        0.30000000,  // T    F    F
        0.60000000,  // T    F    T
        0.60000000,  // T    T    F
        0.88500000); // T    T    T

    f10.AddAllParents(f01, f02, f03, f07,
        0.00000001,  // F    F    F    F
        0.00000002,  // F    F    F    T
        0.00000003,  // F    F    T    F
        0.55000000,  // F    F    T    T
        0.00000002,  // F    T    F    F
        0.36000000,  // F    T    F    T
        0.66000000,  // F    T    T    F
        0.85000000,  // F    T    T    T
        0.00000001,  // T    F    F    F
        0.33000000,  // T    F    F    T
        0.46000000,  // T    F    T    F
        0.86000000,  // T    F    T    T
        0.50000000,  // T    T    F    F
        0.68000000,  // T    T    F    T
        0.86000000,  // T    T    T    F
        0.86000000); // T    T    T    T

    f11.AddAllParents(f01, f02, f03, f05, f08,
        0.00000001,  // F    F    F    F    F
        0.00000003,  // F    F    F    F    T
        0.00000004,  // F    F    F    T    F
        0.25000000,  // F    F    F    T    T
        0.00000006,  // F    F    T    F    F
        0.22560000,  // F    F    T    F    T
        0.40000000,  // F    F    T    T    F
        0.02300000,  // F    F    T    T    T
        0.00000003,  // F    T    F    F    F
        0.20000000,  // F    T    F    F    T
        0.45000000,  // F    T    F    T    F
        0.47000000,  // F    T    F    T    T
        0.00600000,  // F    T    T    F    F
        0.35000000,  // F    T    T    F    T
        0.30550000,  // F    T    T    T    F
        0.65000000,  // F    T    T    T    T
        0.00000002,  // T    F    F    F    F
        0.00000009,  // T    F    F    F    T
        0.30000000,  // T    F    F    T    F
        0.45210000,  // T    F    F    T    T
        0.00000050,  // T    F    T    F    F
        0.45230000,  // T    F    T    F    T
        0.41000000,  // T    F    T    T    F
        0.77000000,  // T    F    T    T    T
        0.20000000,  // T    T    F    F    F
        0.36000000,  // T    T    F    F    T
        0.32000000,  // T    T    F    T    F
        0.86065000,  // T    T    F    T    T
        0.08000000,  // T    T    T    F    F
        0.55230000,  // T    T    T    F    T
        0.56000000,  // T    T    T    T    F
        0.84000000); // T    T    T    T    T

    f12.AddAllParents(f04, f09,
        0.00000001,  // F    F
        0.50000000,  // F    T
        0.50000000,  // T    F
        0.80000000); // T    T
    #pragma endregion

    #pragma region Incident Nodes
    e01.AddAllParents(f10,
        0.00000003,  // F
        0.49999999); // T

    e02.AddAllParents(f10,
        0.00000003,  // F
        0.49999999); // T

    e03.AddAllParents(f11,
        0.00000003,  // F
        0.86660000); // T

    e04.AddAllParents(f12,
        0.00000001,  // F
        0.67700000); // T

    e05.AddAllParents(e01,
        0.00000001,  // F
        0.25650000); // T

    e06.AddAllParents(e04,
        0.00000001,  // F
        0.25650000); // T

    e07.AddAllParents(e02,
        0.00000001,  // F
        0.55650000); // T

    e08.AddAllParents(f06,
        0.00000002,  // F
        0.90000000); // T
    #pragma endregion

    #pragma region Asset Nodes
    x01.AddAllParents(e03, e04, e06, e07, e08,
        0.00000000,  // F    F    F    F    F
        0.60000000,  // F    F    F    F    T
        0.30000000,  // F    F    F    T    F
        0.65000000,  // F    F    F    T    T
        0.99999999,  // F    F    T    F    F
        0.99999999,  // F    F    T    F    T
        0.99999999,  // F    F    T    T    F
        0.99999999,  // F    F    T    T    T
        0.30000000,  // F    T    F    F    F
        0.65000000,  // F    T    F    F    T
        0.40000000,  // F    T    F    T    F
        0.70000000,  // F    T    F    T    T
        0.99999999,  // F    T    T    F    F
        0.99999999,  // F    T    T    F    T
        0.99999999,  // F    T    T    T    F
        0.99999999,  // F    T    T    T    T
        0.30000000,  // T    F    F    F    F
        0.65000000,  // T    F    F    F    T
        0.40000000,  // T    F    F    T    F
        0.70000000,  // T    F    F    T    T
        0.99999999,  // T    F    T    F    F
        0.99999999,  // T    F    T    F    T
        0.99999999,  // T    F    T    T    F
        0.99999999,  // T    F    T    T    T
        0.50000000,  // T    T    F    F    F
        0.60000000,  // T    T    F    F    T
        0.55000000,  // T    T    F    T    F
        0.80000000,  // T    T    F    T    T
        0.99999999,  // T    T    T    F    F
        0.99999999,  // T    T    T    F    T
        0.99999999,  // T    T    T    T    F
        0.99999999); // T    T    T    T    T

    x02.AddAllParents(e04, e06,
        0.00000000,  // F    F
        0.99990000,  // F    T
        0.50000000,  // T    F
        0.99990000); // T    T

    x03.AddAllParents(e05, e06,
        0.00000000,  // F    F
        0.90000000,  // F    T
        0.60000000,  // T    F
        0.98000000); // T    T

    x04.AddAllParents(e06,
        0.00000003,  // F
        0.95000000); // T

    x05.AddAllParents(e06,
        0.00000003,  // F
        0.80000000); // T

    x06.AddAllParents(e06, e07,
        0.00000000,  // F    F
        0.60000000,  // F    T
        0.90000000,  // T    F
        0.90000000); // T    T

    x07.AddAllParents(e06, e07,
        0.00000000,  // F    F
        0.80000000,  // F    T
        0.90000000,  // T    F
        0.90000000); // T    T

    x08.AddAllParents(e06,
        0.00000003,  // F
        0.90000000); // T
    #pragma endregion
#pragma endregion

#pragma region Initialize BayesianNetwork
    BayesianNetwork BayesianNetwork;
    BayesianNetwork.AddNodes(a01, a02, a03, a04, a05);
    BayesianNetwork.AddNodes(a06, a07, a08, a09, a10);
    BayesianNetwork.AddNodes(a11, a12, a13, a14, a15);
    BayesianNetwork.AddNodes(a16, a17, a18, a19, a20);
    BayesianNetwork.AddNodes(a21, a22, a23, a24, a25);
    BayesianNetwork.AddNodes(a26, a27);

    BayesianNetwork.AddNodes(r01, r02, r03, r04, r05);
    BayesianNetwork.AddNodes(r06, r07, r08, r09);

    BayesianNetwork.AddNodes(f01, f02, f03, f04, f05);
    BayesianNetwork.AddNodes(f06, f07, f08, f09, f10);
    BayesianNetwork.AddNodes(f11, f12);

    BayesianNetwork.AddNodes(e01, e02, e03, e04, e05);
    BayesianNetwork.AddNodes(e06, e07, e08);

    BayesianNetwork.AddNodes(x01, x02, x03, x04, x05);
    BayesianNetwork.AddNodes(x06, x07, x08);

    if (!BayesianNetwork.Initialize())
        return EXIT_FAILURE;
 #pragma endregion


    BayesianNetwork.AddEvidences(a01);
    clock_t start_time, end_time;
    int i;
    for (i = 0; i < 10; i++)
    {
        start_time = clock();
        BayesianNetwork.InferenceGibbsSampler(2000);
        end_time = clock();
        cout << "Running time is: " << static_cast<double>(end_time - start_time) / CLOCKS_PER_SEC * 1000 << "ms" << endl;
    }

    BayesianNetwork.PrintProbabilities(OrderByType, Ascend);
    


    system("pause");
    return EXIT_SUCCESS;
}

