#ifndef _NODE_H_
#define _NODE_H_

#include <iostream>
#include <vector>
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
    void Add(Node & Node);
};

typedef std::vector<Node *> NodeList;

#endif

