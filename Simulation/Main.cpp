#include "Main.h"

using namespace std;

int main()
{    
    Node A("A", Attack);
    Node B("B", Attack);
    Node C("C", Attack);
    Node D("D", Function);

    BayesianNetwork BayesianNetwork;


    D.Add(A);
    A.Add(B, C);

    A.Probabilities = {
    /*
    C   F       F       T       T
    B   F       T       F       T
    */
        0.01,   0.9,    0.5,    0.99
    };

    B.Probabilities = {
        0.01
    };

    C.Probabilities = {
        0.001
    };

    D.Probabilities = {
    /*
    A   F       T
    */
        0.2,    0.5
    };

    cout << A.PrintProbabilities();

    BayesianNetwork.Add(A);
    BayesianNetwork.Add(B);
    BayesianNetwork.Add(C);
    BayesianNetwork.Add(D);

    BayesianNetwork.Initialize();

    cin.get();
    return 0;
}