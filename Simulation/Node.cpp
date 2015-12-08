#include "Node.h"

Node::Node(string Name)
{
    this->Name = Name;
    this->Type = Unknown;
    this->Index = -1;
    this->Parents.clear();
    this->Probabilities.clear();
}

Node::Node(string Name, int Type)
{
    this->Name = Name;
    this->Type = Type;
    this->Index = -1;
    this->Parents.clear();
    this->Probabilities.clear();
}

Node::~Node()
{
    this->Parents.clear();
    this->Probabilities.clear();
}

void Node::Add(Node & Node)
{
    // A node can not be its parent.
    if (this == &Node)
        return;

    // Add this node into the Parents.
    this->Parents.push_back(&Node);

    // Resize the Probabilites.
    this->Probabilities = ProbabilityList(1 << this->Parents.size());
}