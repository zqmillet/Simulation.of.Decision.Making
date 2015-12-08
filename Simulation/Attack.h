#ifndef _ATTACK_H_
#define _ATTACK_H_

#include <cstdarg>
#include <string>
#include <vector>
#include <map>
#include "Const.h"

using namespace std;

typedef std::map<void *, int> ParentList;
typedef std::vector<double> ProbabilityList;

class Attack
{
public:
	string Name;
	int Type;
	ParentList Parents;
	ProbabilityList Probabilities;

public:
	Attack(string Name);
	~Attack();
	void Add(Attack & Parent);
};

#endif
