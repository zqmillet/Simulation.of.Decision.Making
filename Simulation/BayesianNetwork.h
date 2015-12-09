#ifndef _BAYESIANNETWORK_H_
#define _BAYESIANNETWORK_H_

#include <assert.h>
#include "dlib/bayes_utils.h"
#include "dlib/graph_utils.h"
#include "dlib/graph.h"
#include "dlib/directed_graph.h"
#include "Node.h"

using namespace dlib;

class BayesianNetwork
{
public:
    NodeList Nodes;
    directed_graph<bayes_node>::kernel_1a_c Graph;

public:
    BayesianNetwork();
    ~BayesianNetwork();

    void Add(Node & Node);
    bool Initialize();
};

#endif

