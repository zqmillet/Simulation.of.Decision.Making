#ifndef _ATTACK_H_
#define _ATTACK_H_

#include <string>
#include <list>
#include "Main.h"

using namespace std;

class Attack
{
public:
	string Name;
	int Type;
	list<void *> AttackParents;

public:
	Attack(string Name);
	~Attack();
	void AddParents(Attack * Attack);
};

#endif
