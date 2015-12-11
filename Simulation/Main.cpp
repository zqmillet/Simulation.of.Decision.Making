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
    HO.AddParent(PT);
    HA.AddParent(HO, BT);
    SA.AddParent(HO);
    PX.AddParent(BT);

    // Set the conditional probabilities of nodes
    PT.Probabilities = {
        0.2
    };

    BT.Probabilities = {
        0.001
    };

    HO.Probabilities = {
    /*
    PT  F       T
    */
        0,      0.7
    };

    SA.Probabilities = {
    /*
    HO  F       T
    */
        0.1,    0.8  
    };

    PX.Probabilities = {
    /*
    BT  F       T
    */
        0.01,   0.98
    };

    // Please notice that the order of BT and HO, 
    // and compare with the order that they are added in the parent list.
    HA.Probabilities = {
    /*
    BT  F       F       T       T
    HO  F       T       F       T
    */
        0.02,   0.7,    0.9,    0.99
    };

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

