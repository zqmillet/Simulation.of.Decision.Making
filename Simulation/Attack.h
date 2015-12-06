#ifndef _ATTACK_H_
#define _ATTACK_H_

#include <cstdarg>
#include <string>
#include <map>
#include "MD5.h"
#include "Const.h"

using namespace std;

typedef map<void *, int> ParentList;

class Attack
{
public:
	string Name;
	int Type;
	string MD5;
	ParentList Parents;

public:
	Attack(string Name);
	~Attack();
	void Add(Attack & Parent);
};

#endif
