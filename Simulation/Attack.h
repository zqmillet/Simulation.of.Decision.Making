#ifndef _ATTACK_H_
#define _ATTACK_H_

#include <string>
#include <map>
#include "Main.h"

using namespace std;

typedef map<void *, int> ParentList;


class Attack
{
public:
	string Name;
	int Type;
	ParentList Parents;

public:
	Attack(string Name);
	~Attack();
	void Add(Attack * Parent);
};

#endif
