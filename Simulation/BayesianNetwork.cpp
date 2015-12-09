#include "BayesianNetwork.h"

using namespace dlib;
using namespace bayes_node_utils;

BayesianNetwork::BayesianNetwork()
{
    this->Nodes.clear();
}


BayesianNetwork::~BayesianNetwork()
{
    this->Nodes.clear();
}

void BayesianNetwork::Add(Node & Node)
{
    // If this node has been added into the Bayesian network, return.
    int i;
    for (i = 0; i < (int)Nodes.size(); i++)
        if (Nodes[i] == &Node)
            return;

    // If this node does not exist in the Bayesian network,
    // set the index of this node, and add it into the Bayesian network.
    Node.Index = Nodes.size();
    this->Nodes.push_back(&Node);
}

bool BayesianNetwork::Initialize()
{
    // Set number of nodes.
    this->Graph.set_number_of_nodes(this->Nodes.size());

    // Add edges.
    int i, j;
    for (i = 0; i < (int)this->Nodes.size(); i++)
        for (j = 0; j < (int)this->Nodes[i]->Parents.size(); j++)
            this->Graph.add_edge(this->Nodes[i]->Parents[j]->Index, this->Nodes[i]->Index);


    // Inform all the nodes in the network that they are binary nodes.
    for (i = 0; i < (int)this->Nodes.size(); i++)
        set_node_num_values(this->Graph, this->Nodes[i]->Index, 2);

    // Set the conditional probabilities for all nodes.
    assignment parent_state;

    for (i = 0; i < (int)this->Nodes.size(); i++)
    {
        // For ith node, set its parent nodes. 
        parent_state.clear();
        for (j = 0; j < (int)this->Nodes[i]->Parents.size(); j++)
            parent_state.add(this->Nodes[i]->Parents[j]->Index);

        // If 2 ^ (the number of parent nodes) != the number of probabilities, throw the error.
        if (1 << (int)this->Nodes[i]->Parents.size() != this->Nodes[i]->Probabilities.size())
        {
            cout << "There is an error in Node \"" << \
                this->Nodes[i]->Name << "\"." << endl << \
                "The number of its parent nodes is " << \
                (int)this->Nodes[i]->Parents.size() << \
                ", but the number of its conditional probabilities is " << \
                (int)this->Nodes[i]->Probabilities.size() << endl;
            return false;
        }

        // Set the conditional probabilities.
        int k; 
        for (k = 0; k < 1 << (int)this->Nodes[i]->Parents.size(); k++) // k = 0, 1, 2, ... , (2^n - 1)
        {
            for (j = 0; j < (int)this->Nodes[i]->Parents.size(); j++) // j = 0, 1, 2, ... , n
                parent_state[Nodes[i]->Parents[j]->Index] = (k >> j) & 0x1;           

            if (this->Nodes[i]->Probabilities[k] < 0 || this->Nodes[i]->Probabilities[k] > 1)
            {
                cout << "There is an error in Node \"" << \
                    this->Nodes[i]->Name << "\"." << endl << \
                    "";
            }

            set_node_probability(this->Graph, this->Nodes[i]->Index, 1, parent_state, this->Nodes[i]->Probabilities[k]);
            set_node_probability(this->Graph, this->Nodes[i]->Index, 0, parent_state, 1 - this->Nodes[i]->Probabilities[k]);
        }      
    }
    
    return true;
}


