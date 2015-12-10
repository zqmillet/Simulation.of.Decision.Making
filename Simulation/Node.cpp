#include "Node.h"

Node::Node(string Name)
{
    this->Name = Name;
    this->Type = Unknown;
    this->Index = -1;
    this->Probability = -1;
    this->Parents.clear();
    this->Probabilities.clear();
}

Node::Node(string Name, NodeType Type)
{
    this->Name = Name;
    this->Type = Type;
    this->Index = -1;
    this->Probability = -1;
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
        if (&Node == this->Parents[i])
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

string Node::PrintProbability(int Index)
{
    if (1 << this->Parents.size() != this->Probabilities.size())
        return ErrorString;

    if (Index < 0 || Index >= (int)this->Probabilities.size())
        return ErrorString;

    if (0 == (int)this->Parents.size())
        return string("P(" + this->Name + ") = " + Number2String(this->Probabilities[0]));
        
    string String = string("") + "P(" + this->Name + "|";

    int i;
    for (i = 0; i < (int)this->Parents.size(); i++)
        String += string((((Index >> i) & 0x1) ? " " : "!") + this->Parents[i]->Name + ", ");

    String.erase(String.end() - 2);
    String += ") = " + Number2String(this->Probabilities[Index]);

    return String;
}

string Node::PrintProbabilities()
{
    if (1 << this->Parents.size() != this->Probabilities.size())
        return ErrorString;

    string String = "";
    int i;
    for (i = 0; i < (int)this->Probabilities.size(); i++)
        String += this->PrintProbability(i) + "\n";

    return String;
}

double Node::Compare(Node Node, Order Order)
{
    switch (Order)
    {
    case OrderByIndex:
        if (this->Index != Node.Index)
            return this->Index - Node.Index;
        else
            return this->Name.compare(Node.Name);
    case OrderByName:
        if (this->Name.compare(Node.Name) != 0)
            return this->Name.compare(Node.Name);
        else
            return this->Index - Node.Index;
    case OrderByType:
        if (this->Type != Node.Type)
            return this->Type - Node.Type;
        else if (this->Index != Node.Index)
            return this->Index - Node.Index;
        else
            return this->Name.compare(Node.Name);
    case OrderByProbability:
        if (this->Probability != Node.Probability)
            return this->Probability - Node.Probability;
        else if (this->Index != Node.Index)
            return this->Index - Node.Index;
        else
            return this->Name.compare(Node.Name);
    default:
        return 0;
    }
}

