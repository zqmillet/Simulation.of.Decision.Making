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

    //BayesianNetwork.Add(A, B, C, D);

    BayesianNetwork.AddNode(C, D);
    BayesianNetwork.AddNode(A, B);

    if (!BayesianNetwork.Initialize())
        return EXIT_FAILURE;

    BayesianNetwork.Inference();
    BayesianNetwork.PrintProbabilities();

    BayesianNetwork.AddEvidence(C, A, C, D);
    BayesianNetwork.Inference();
    BayesianNetwork.PrintProbabilities();

    BayesianNetwork.RemoveEvidence(C, B);
    BayesianNetwork.Inference();
    BayesianNetwork.PrintProbabilities();

    system("pause");
    return EXIT_SUCCESS;
}