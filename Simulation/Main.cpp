#include "Main.h"

int main()
{    
    // Create the nodes of Bayesian network.
    Node PT("Party");
    Node HO("Hangover");
    Node BT("Brain Tumor");
    Node HA("Headache");
    Node SA("Smell Alcohol");
    Node PX("Pos Xray");

    // Set the conditional probabilities of nodes
    PT.AddAllParents( // Has no parent node
        0.200);

    BT.AddAllParents( // Has no parent node
        0.001);
    
    HO.AddAllParents(PT,
        0.000,    // F
        0.700);   // T

    SA.AddAllParents(HO,
        0.100,    // F
        0.800     // T
    );

    PX.AddAllParents(BT,
        0.010,    // F
        0.980     // T
    );

    HA.AddAllParents(HO, BT,
        0.020,    // F   F
        0.900,    // F   T
        0.700,    // T   F
        0.990     // T   T
    );

    // Create the Bayesian network.
    BayesianNetwork BayesianNetwork;

    // Add the nodes into the Bayesian network.
    // This order can be in any order.
    BayesianNetwork.AddNode(PT, HO, BT, HA, SA, PX);

    // Initialize the Bayesian network.
    if (!BayesianNetwork.Initialize())
        return EXIT_FAILURE;
    
    // Question 1
    cout << "Solution of Question 1:" << endl;
    BayesianNetwork.Inference();
    cout << "P(+" << HA.Name << BayesianNetwork.Evidence2String() << ") = " << HA.Probability << endl;

    // Question 2
    cout << endl;
    cout << "Solution of Question 2:" << endl;
    BayesianNetwork.AddEvidence(PT);
    BayesianNetwork.Inference();
    cout << "P(+" << SA.Name << BayesianNetwork.Evidence2String() << ") = " << SA.Probability << endl;

    // Question 3
    cout << endl;
    cout << "Solution of Question 3:" << endl;
    BayesianNetwork.RemoveEvidence();
    BayesianNetwork.AddEvidence(PX);
    BayesianNetwork.Inference();
    cout << "P(+" << BT.Name << BayesianNetwork.Evidence2String() << ") = " << BT.Probability << endl;

    // Question 4
    cout << endl;
    cout << "Solution of Question 4:" << endl;
    BayesianNetwork.RemoveEvidence();
    BayesianNetwork.AddEvidence(HA);
    BayesianNetwork.Inference();
    cout << "P(+" << BT.Name << BayesianNetwork.Evidence2String() << ") = " << BT.Probability << endl;

    system("pause");
    return EXIT_SUCCESS;
}

