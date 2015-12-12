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

    // Set the relationships of nodes.
    HO.AddParents(PT);
    HA.AddParents(HO, BT);
    SA.AddParents(HO);
    PX.AddParents(BT);

    // Set the conditional probabilities of nodes
    PT.AddAllParents(0.2);

    BT.AddAllParents(0.001);
    
    HO.AddAllParents(PT,
        0,        // F
        0.7);     // T

    SA.AddAllParents(HO,
        0.1,      // F
        0.8       // T
    );

    PX.AddAllParents(BT,
        0.01,     // F
        0.98      // T
    );

    HA.AddAllParents(HO, BT,
        0.02,     // F   F
        0.9,      // F   T
        0.7,      // T   F
        0.99      // T   T
    );

    // Create the Bayesian network.
    BayesianNetwork BayesianNetwork;

    // Add the nodes into the Bayesian network.
    // This order can be in any orler.
    BayesianNetwork.AddNode(PT, HO, BT, HA, SA, PX);

    // Initialize the Bayesian network.
    if (!BayesianNetwork.Initialize())
        return EXIT_FAILURE;
    
    // Question 1
    cout << "Solution of Question 1:" << endl;
    BayesianNetwork.Inference();
    BayesianNetwork.PrintProbabilities(OrderByName, Ascend);

    // Question 2
    cout << endl;
    cout << "Solution of Question 2:" << endl;
    BayesianNetwork.AddEvidence(PT);
    BayesianNetwork.Inference();
    BayesianNetwork.PrintProbabilities(OrderByName, Ascend);

    // Question 3
    cout << endl;
    cout << "Solution of Question 3:" << endl;
    BayesianNetwork.RemoveEvidence();
    BayesianNetwork.AddEvidence(PX);
    BayesianNetwork.Inference();
    BayesianNetwork.PrintProbabilities(OrderByName, Ascend);

    // Question 4
    cout << endl;
    cout << "Solution of Question 4:" << endl;
    BayesianNetwork.RemoveEvidence();
    BayesianNetwork.AddEvidence(HA);
    BayesianNetwork.Inference();
    BayesianNetwork.PrintProbabilities(OrderByName, Ascend);

    system("pause");
    return EXIT_SUCCESS;
}

