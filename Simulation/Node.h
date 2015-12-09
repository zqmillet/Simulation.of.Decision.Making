#ifndef _NODE_H_
#define _NODE_H_

#include <iostream>
#include <vector>
#include <sstream>
#include "Const.h"

using namespace std;


typedef std::vector<double> ProbabilityList;

class Node
{
public:
    string Name;
    int Type;
    int Index;
    std::vector<Node *> Parents;
    ProbabilityList Probabilities;

public:
    Node(string Name);
    Node(string Name, int Type);
    ~Node();
    void Add(Node & Node1);
    void Add(Node & Node1, Node & Node2);
    void Add(Node & Node1, Node & Node2, Node & Node3);
    void Add(Node & Node1, Node & Node2, Node & Node3, Node & Node4);
    void Add(Node & Node1, Node & Node2, Node & Node3, Node & Node4, Node & Node5);
    void Add(Node & Node1, Node & Node2, Node & Node3, Node & Node4, Node & Node5, Node & Node6);

    string PrintProbability(int Index);
    string PrintProbabilities();
};

typedef std::vector<Node *> NodeList;

#endif

