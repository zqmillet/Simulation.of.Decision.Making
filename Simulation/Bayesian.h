#ifndef _BAYESIAN_H_
#define _BAYESIAN_H_

#include "dlib/bayes_utils.h"
#include "dlib/graph_utils.h"
#include "dlib/graph.h"
#include "dlib/directed_graph.h"
#include <iostream>
#include <map>
#include "Attack.h"

using namespace std;
using namespace dlib;

typedef std::map<void *, int> NodeList;

class BayesianNetwork
{
public:
    NodeList Nodes;
    directed_graph<bayes_node>::kernel_1a_c bn;

public:
    BayesianNetwork();
    ~BayesianNetwork();
    
    void Add(Attack & Attack);
    bool Initialize();
};

#endif

