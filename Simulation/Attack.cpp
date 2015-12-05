#include "Attack.h"

Attack::Attack(string Name)
{
	this->Name = Name;
	this->Type = ATTACK;
	this->AttackParents.clear();
}


Attack::~Attack()
{
}

void Attack::AddParents(Attack * Attack)
{
	this->AttackParents.push_back((void *)Attack);
}
