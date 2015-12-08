#include "Attack.h"

Attack::Attack(string Name)
{
	this->Name = Name;
	this->Type = t_Attack;
	this->Parents.clear();
}


Attack::~Attack()
{
}

void Attack::Add(Attack & Attack)
{
	this->Parents.insert(pair<void *, int>(&Attack, Attack.Type));
}