#ifndef _BAYESIANNETWORK_H_
#define _BAYESIANNETWORK_H_

#include "dlib/bayes_utils.h"
#include "dlib/graph_utils.h"
#include "dlib/graph.h"
#include "dlib/directed_graph.h"
#include "Common.h"
#include "Node.h"

using namespace dlib;

typedef dlib::set<unsigned long>::compare_1b_c set_type;
typedef graph<set_type, set_type>::kernel_1a_c JoinTree;

class BayesianNetwork
{
public:
    NodeList Nodes;
    NodeList Evidences;

    directed_graph<bayes_node>::kernel_1a_c Graph;
    JoinTree JoinTree;

public:
    BayesianNetwork();
    ~BayesianNetwork();

    void AddNodes(Node & Node1);
    void AddNodes(Node & Node1, Node & Node2);
    void AddNodes(Node & Node1, Node & Node2, Node & Node3);
    void AddNodes(Node & Node1, Node & Node2, Node & Node3, Node & Node4);
    void AddNodes(Node & Node1, Node & Node2, Node & Node3, Node & Node4, Node & Node5);
    void AddNodes(Node & Node1, Node & Node2, Node & Node3, Node & Node4, Node & Node5, Node & Node6);

    bool Initialize();

    void AddEvidences(Node & Node1, EvidenceState EvidenceState = Happened);
    void AddEvidences(Node & Node1, Node & Node2, EvidenceState EvidenceState = Happened);
    void AddEvidences(Node & Node1, Node & Node2, Node & Node3, EvidenceState EvidenceState = Happened);
    void AddEvidences(Node & Node1, Node & Node2, Node & Node3, Node & Node4, EvidenceState EvidenceState = Happened);
    void AddEvidences(Node & Node1, Node & Node2, Node & Node3, Node & Node4, Node & Node5, EvidenceState EvidenceState = Happened);
    void AddEvidences(Node & Node1, Node & Node2, Node & Node3, Node & Node4, Node & Node5, Node & Node6, EvidenceState EvidenceState = Happened);

    void RemoveEvidences();
    void RemoveEvidences(Node & Node1);
    void RemoveEvidences(Node & Node1, Node & Node2);
    void RemoveEvidences(Node & Node1, Node & Node2, Node & Node3);
    void RemoveEvidences(Node & Node1, Node & Node2, Node & Node3, Node & Node4);
    void RemoveEvidences(Node & Node1, Node & Node2, Node & Node3, Node & Node4, Node & Node5);
    void RemoveEvidences(Node & Node1, Node & Node2, Node & Node3, Node & Node4, Node & Node5, Node & Node6);

    void InferenceJoinTree();
    void InferenceGibbsSampler(int Round);

    void PrintProbabilities(Order Order = OrderByIndex, Direction Direction = Descend);

    string Evidence2String();
};

#endif
