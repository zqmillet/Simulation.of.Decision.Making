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
    if (this->Nodes.find(&Node1) != this->Nodes.end())
        return;

    // If this node does not exist in the Bayesian network,
    // set the index of this node, and add it into the Bayesian network.
    Node1.Index = this->Nodes.size();
    this->Nodes.insert(&Node1);
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
    NodeList::iterator Node;
    for (Node = this->Nodes.begin(); Node != this->Nodes.end(); Node++)
        for (j = 0; j < (int)(*Node)->Parents.size(); j++)
            this->Graph.add_edge((*Node)->Parents[j]->Index, (*Node)->Index); 

    // Inform all the nodes in the network that they are binary nodes.
    for (Node = this->Nodes.begin(); Node != this->Nodes.end(); Node++)
        set_node_num_values(this->Graph, (*Node)->Index, 2);

    // Set the conditional probabilities for all nodes.
    assignment parent_state;

    for (Node = this->Nodes.begin(); Node != this->Nodes.end(); Node++)
    {
        // For ith node, set its parent nodes. 
        parent_state.clear();
        for (j = 0; j < (int)(*Node)->Parents.size(); j++)
            parent_state.add((*Node)->Parents[j]->Index);

        // If 2 ^ (the number of parent nodes) != the number of probabilities, throw the error.
        if (1 << (int)(*Node)->Parents.size() != (*Node)->Probabilities.size())
        {
            cout << "There is an error in Node \"" << \
                (*Node)->Name << "\"." << endl << \
                "The number of its parent nodes is " << \
                (int)(*Node)->Parents.size() << \
                ", but the number of its conditional probabilities is " << \
                (int)(*Node)->Probabilities.size() << endl;
            return false;
        }

        // Set the conditional probabilities.        
        for (i = 0; i < 1 << (int)(*Node)->Parents.size(); i++) // i = 0, 1, 2, ... , (2^n - 1)
        {
            for (j = 0; j < (int)(*Node)->Parents.size(); j++) // j = 0, 1, 2, ... , n
                parent_state[(*Node)->Parents[j]->Index] = (i >> j) & 0x1;

            if ((*Node)->Probabilities[i] < 0 || (*Node)->Probabilities[i] > 1)
            {
                cout << "There is an error in Node \"" << (*Node)->Name << "\"." << endl << \
                    (*Node)->PrintProbability(i) << endl;
                return false;
            }
      
            set_node_probability(this->Graph, (*Node)->Index, 1, parent_state, (*Node)->Probabilities[i]);
            set_node_probability(this->Graph, (*Node)->Index, 0, parent_state, 1 - (*Node)->Probabilities[i]);
        }      
    }

    create_moral_graph(this->Graph, this->JoinTree);
    create_join_tree(this->JoinTree, this->JoinTree);
    
    return true;
}

void BayesianNetwork::AddEvidence(Node & Node1, EvidenceState EvidenceState)
{
    if (this->Evidences.find(&Node1) != this->Evidences.end())
        return;

    this->Evidences.insert(&Node1);
    Node1.Probability = EvidenceState;
    set_node_value(this->Graph, Node1.Index, EvidenceState);
    set_node_as_evidence(this->Graph, Node1.Index);
}

void BayesianNetwork::AddEvidence(Node & Node1, Node & Node2, EvidenceState EvidenceState)
{
    AddEvidence(Node1, EvidenceState);
    AddEvidence(Node2, EvidenceState);
}

void BayesianNetwork::AddEvidence(Node & Node1, Node & Node2, Node & Node3, EvidenceState EvidenceState)
{
    AddEvidence(Node1, Node2, EvidenceState);
    AddEvidence(Node3, EvidenceState);
}

void BayesianNetwork::AddEvidence(Node & Node1, Node & Node2, Node & Node3, Node & Node4, EvidenceState EvidenceState)
{
    AddEvidence(Node1, Node2, Node3, EvidenceState);
    AddEvidence(Node4, EvidenceState);
}

void BayesianNetwork::AddEvidence(Node & Node1, Node & Node2, Node & Node3, Node & Node4, Node & Node5, EvidenceState EvidenceState)
{
    AddEvidence(Node1, Node2, Node3, Node4, EvidenceState);
    AddEvidence(Node5, EvidenceState);
}

void BayesianNetwork::AddEvidence(Node & Node1, Node & Node2, Node & Node3, Node & Node4, Node & Node5, Node & Node6, EvidenceState EvidenceState)
{
    AddEvidence(Node1, Node2, Node3, Node4, Node5, EvidenceState);
    AddEvidence(Node6, EvidenceState);
}

void BayesianNetwork::Inference()
{
    bayesian_network_join_tree solution(this->Graph, JoinTree);
    
    NodeList::iterator Node;
    for (Node = this->Nodes.begin(); Node != this->Nodes.end(); Node++)
        (*Node)->Probability = solution.probability((*Node)->Index)(1);
}

void BayesianNetwork::PrintProbabilities(Order Order, Direction Direction)
{
    NodeList CopiedNodes = this->Nodes;
    NodeList::iterator Node, ExtremeNode;

    int MaxNameLength = 0;
    for (Node = CopiedNodes.begin(); Node != CopiedNodes.end(); Node++)
        if ((int)(*Node)->Name.length() > MaxNameLength)
            MaxNameLength = (int)(*Node)->Name.length();
    
    Node = CopiedNodes.begin();
    while (CopiedNodes.size() != 0)
    {
        ExtremeNode = CopiedNodes.begin();
        for (Node = ExtremeNode; Node != CopiedNodes.end(); Node++)
            if (Direction*(*Node)->Compare(*(*ExtremeNode), Order) > 0)
                ExtremeNode = Node;
  
        cout << "P(" << (*ExtremeNode)->Name << RepeatString(" ", MaxNameLength - (int)(*ExtremeNode)->Name.length()) << this->Evidence2String() << ") = " << Number2String((*ExtremeNode)->Probability) << endl;
        CopiedNodes.erase(ExtremeNode);
    }
}

void BayesianNetwork::RemoveEvidence(Node & Node1)
{
    if (this->Evidences.find(&Node1) != this->Evidences.end())
    {
        this->Evidences.erase(&Node1);
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

string BayesianNetwork::Evidence2String()
{
    if (this->Evidences.size() == 0)
        return "";

    string String = "|";
    NodeList::reverse_iterator Evidence;
    for (Evidence = this->Evidences.rbegin(); Evidence != this->Evidences.rend(); Evidence++)
        String += string(((*Evidence)->Probability == 1) ? "" : "!") + (*Evidence)->Name + ", ";
    
    String.pop_back();
    String.pop_back();
    return String;
}



