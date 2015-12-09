#include "BayesianNetwork.h"

using namespace std;
using namespace dlib;
using namespace bayes_node_utils;

BayesianNetwork::BayesianNetwork()
{
    this->Nodes.clear();
    this->Evidences.clear();
}


BayesianNetwork::~BayesianNetwork()
{
    this->Nodes.clear();
    this->Evidences.clear();
}

void BayesianNetwork::AddNode(Node & Node1)
{
    // If this node has been added into the Bayesian network, return.
    int i;
    for (i = 0; i < (int)this->Nodes.size(); i++)
        if (this->Nodes[i] == &Node1)
            return;

    // If this node does not exist in the Bayesian network,
    // set the index of this node, and add it into the Bayesian network.
    Node1.Index = this->Nodes.size();
    this->Nodes.push_back(&Node1);
}

void BayesianNetwork::AddNode(Node & Node1, Node & Node2)
{
    this->AddNode(Node1);
    this->AddNode(Node2);
}

void BayesianNetwork::AddNode(Node & Node1, Node & Node2, Node & Node3)
{
    this->AddNode(Node1, Node2);
    this->AddNode(Node3);
}

void BayesianNetwork::AddNode(Node & Node1, Node & Node2, Node & Node3, Node & Node4)
{
    this->AddNode(Node1, Node2, Node3);
    this->AddNode(Node4);
}

void BayesianNetwork::AddNode(Node & Node1, Node & Node2, Node & Node3, Node & Node4, Node & Node5)
{
    this->AddNode(Node1, Node2, Node3, Node4);
    this->AddNode(Node5);
}

void BayesianNetwork::AddNode(Node & Node1, Node & Node2, Node & Node3, Node & Node4, Node & Node5, Node & Node6)
{
    this->AddNode(Node1, Node2, Node3, Node4, Node5);
    this->AddNode(Node6);
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
                cout << "There is an error in Node \"" << this->Nodes[i]->Name << "\"." << endl << \
                    this->Nodes[i]->PrintProbability(k) << endl;
                return false;
            }

            set_node_probability(this->Graph, this->Nodes[i]->Index, 1, parent_state, this->Nodes[i]->Probabilities[k]);
            set_node_probability(this->Graph, this->Nodes[i]->Index, 0, parent_state, 1 - this->Nodes[i]->Probabilities[k]);
        }      
    }

    create_moral_graph(this->Graph, this->JoinTree);
    create_join_tree(this->JoinTree, this->JoinTree);
    
    return true;
}

void BayesianNetwork::AddEvidence(Node & Node1)
{
    int i;
    for (i = 0; i < (int)this->Evidences.size(); i++)
        if (&Node1 == this->Evidences[i])
            return;

    this->Evidences.push_back(&Node1);
    set_node_value(this->Graph, Node1.Index, 1);
    set_node_as_evidence(this->Graph, Node1.Index);
}

void BayesianNetwork::AddEvidence(Node & Node1, Node & Node2)
{
    AddEvidence(Node1);
    AddEvidence(Node2);
}

void BayesianNetwork::AddEvidence(Node & Node1, Node & Node2, Node & Node3)
{
    AddEvidence(Node1, Node2);
    AddEvidence(Node3);
}

void BayesianNetwork::AddEvidence(Node & Node1, Node & Node2, Node & Node3, Node & Node4)
{
    AddEvidence(Node1, Node2, Node3);
    AddEvidence(Node4);
}

void BayesianNetwork::AddEvidence(Node & Node1, Node & Node2, Node & Node3, Node & Node4, Node & Node5)
{
    AddEvidence(Node1, Node2, Node3, Node4);
    AddEvidence(Node5);
}

void BayesianNetwork::AddEvidence(Node & Node1, Node & Node2, Node & Node3, Node & Node4, Node & Node5, Node & Node6)
{
    AddEvidence(Node1, Node2, Node3, Node4, Node5);
    AddEvidence(Node6);
}

void BayesianNetwork::Inference()
{
    bayesian_network_join_tree solution(this->Graph, JoinTree);
    Probabilities.clear();

    int i;
    for (i = 0; i < (int)this->Nodes.size(); i++)
        Probabilities.push_back(solution.probability(this->Nodes[i]->Index)(1));
}

void BayesianNetwork::PrintProbabilities()
{
    int i;
    for (i = 0; i < (int)this->Nodes.size(); i++)
        cout << "P(" << this->Nodes[i]->Name << ") = " << Number2String(Probabilities[this->Nodes[i]->Index]) << endl;
}

void BayesianNetwork::RemoveEvidence(Node & Node1)
{
    int i;
    for (i = 0; i < (int)this->Evidences.size(); i++)
        if (&Node1 == this->Evidences[i])
        {
            NodeList::iterator Evidence(this->Evidences.begin() + i);
            this->Evidences.erase(Evidence);
            set_node_as_nonevidence(this->Graph, Node1.Index);
        }    
}

void BayesianNetwork::RemoveEvidence(Node & Node1, Node & Node2)
{
    RemoveEvidence(Node1);
    RemoveEvidence(Node2);
}

void BayesianNetwork::RemoveEvidence(Node & Node1, Node & Node2, Node & Node3)
{
    RemoveEvidence(Node1, Node2);
    RemoveEvidence(Node3);
}

void BayesianNetwork::RemoveEvidence(Node & Node1, Node & Node2, Node & Node3, Node & Node4)
{
    RemoveEvidence(Node1, Node2, Node3);
    RemoveEvidence(Node4);
}

void BayesianNetwork::RemoveEvidence(Node & Node1, Node & Node2, Node & Node3, Node & Node4, Node & Node5)
{
    RemoveEvidence(Node1, Node2, Node3, Node4);
    RemoveEvidence(Node5);
}

void BayesianNetwork::RemoveEvidence(Node & Node1, Node & Node2, Node & Node3, Node & Node4, Node & Node5, Node & Node6)
{
    RemoveEvidence(Node1, Node2, Node3, Node4, Node5);
    RemoveEvidence(Node6);
}



