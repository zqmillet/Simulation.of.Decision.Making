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

    // If this node has been in the parent list, return.
    int i;
    for (i = 0; i < (int)this->Parents.size(); i++)
        if (this->Parents[i] == &Node)
            return;

    // Add this node into the Parents.
    this->Parents.push_back(&Node);

    // Resize the Probabilites.
    this->Probabilities = ProbabilityList(1 << this->Parents.size());
}

void Node::Add(Node & Node1, Node & Node2)
{
    this->Add(Node1);
    this->Add(Node2);
}

void Node::Add(Node & Node1, Node & Node2, Node & Node3)
{
    this->Add(Node1, Node2);
    this->Add(Node3);
}

void Node::Add(Node & Node1, Node & Node2, Node & Node3, Node & Node4)
{
    this->Add(Node1, Node2, Node3);
    this->Add(Node4);
}

void Node::Add(Node & Node1, Node & Node2, Node & Node3, Node & Node4, Node & Node5)
{
    this->Add(Node1, Node2, Node3, Node4);
    this->Add(Node5);
}

void Node::Add(Node & Node1, Node & Node2, Node & Node3, Node & Node4, Node & Node5, Node & Node6)
{
    this->Add(Node1, Node2, Node3, Node4, Node5);
    this->Add(Node6);
}