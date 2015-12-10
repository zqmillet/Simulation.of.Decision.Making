#ifndef _NODE_H_
#define _NODE_H_

#include <iostream>
#include <vector>
#include <set>
#include "Common.h"

using namespace std;

typedef std::vector<double> ProbabilityList;

class Node
{
public:
    string Name;
    NodeType Type;
    int Index;
    double Probability;
    std::vector<Node *> Parents;
    ProbabilityList Probabilities;

public:
    Node(string Name);
    Node(string Name, NodeType Type);
    ~Node();
    void AddParent(Node & Node1);
    void AddParent(Node & Node1, Node & Node2);
    void AddParent(Node & Node1, Node & Node2, Node & Node3);
    void AddParent(Node & Node1, Node & Node2, Node & Node3, Node & Node4);
    void AddParent(Node & Node1, Node & Node2, Node & Node3, Node & Node4, Node & Node5);
    void AddParent(Node & Node1, Node & Node2, Node & Node3, Node & Node4, Node & Node5, Node & Node6);
    
    double Compare(Node Node, Order Order = OrderByIndex);

    string PrintProbability(int Index);
    string PrintProbabilities();
};

typedef std::set<Node *> NodeList;
typedef std::vector<Node *> ParentList;

#endif
