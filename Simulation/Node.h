#ifndef _NODE_H_
#define _NODE_H_

#include <iostream>
#include <vector>
#include <set>
#include <stdarg.h>
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
    void AddParents(Node & Node1);
    void AddParents(Node & Node1, Node & Node2);
    void AddParents(Node & Node1, Node & Node2, Node & Node3);
    void AddParents(Node & Node1, Node & Node2, Node & Node3, Node & Node4);
    void AddParents(Node & Node1, Node & Node2, Node & Node3, Node & Node4, Node & Node5);
    void AddParents(Node & Node1, Node & Node2, Node & Node3, Node & Node4, Node & Node5, Node & Node6);

    void AddAllParents(double Probability);
    void AddAllParents(Node & Node1, double FirstProbability, ...);
    void AddAllParents(Node & Node1, Node & Node2, double FirstProbability, ...);
    void AddAllParents(Node & Node1, Node & Node2, Node & Node3, double FirstProbability, ...);
    void AddAllParents(Node & Node1, Node & Node2, Node & Node3, Node & Node4, double FirstProbability, ...);
    void AddAllParents(Node & Node1, Node & Node2, Node & Node3, Node & Node4, Node & Node5, double FirstProbability, ...);
    void AddAllParents(Node & Node1, Node & Node2, Node & Node3, Node & Node4, Node & Node5, Node & Node6, double FirstProbability, ...);

    double Compare(Node Node, Order Order = OrderByIndex);

    string PrintProbability(int Index);
    string PrintProbabilities();
};

typedef std::set<Node *> NodeList;
typedef std::vector<Node *> ParentList;

#endif