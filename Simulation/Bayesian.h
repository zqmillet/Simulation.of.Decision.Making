#ifndef _BAYESIAN_H_
#define _BAYESIAN_H_

#include <map>
#include "Attack.h"

using namespace std;

typedef std::map<void *, int> NodeList;

class BayesianNetwork
{
public:
    NodeList Nodes;


public:
    BayesianNetwork();
    ~BayesianNetwork();
    
    void Add(Attack & Attack);
};

#endif

