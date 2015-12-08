#include "Bayesian.h"

BayesianNetwork::BayesianNetwork()
{
    this->Nodes.clear();
}


BayesianNetwork::~BayesianNetwork()
{
    this->Nodes.clear();
}

void BayesianNetwork::Add(Attack & Attack)
{
    // If this node has been added into the Bayesian network, return.
    /*
    ParentList::iterator Parent = a5.Parents.end();
    for (Parent--; Parent != a5.Parents.begin(); Parent--)
    {
    cout<<((Attack *)(Parent->first))->Name<<endl;
    }
    */

    NodeList::iterator Node = Nodes.begin();
    for (; Node != Nodes.end(); Node++)
        if (Node->first == &Attack)
            return;


    // If this node does not exist in the Bayesian network, add it into the Bayesian network.
    this->Nodes.insert(pair<void *, int>(&Attack, Attack.Type));
}
