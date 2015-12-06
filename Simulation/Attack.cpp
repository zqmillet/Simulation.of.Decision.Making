#include "Attack.h"

Attack::Attack(string Name)
{
	this->Name = Name;
	this->Type = t_Attack;
	this->Parents.clear();

	CMD5 iMD5;
	iMD5.GenerateMD5((unsigned char *)(&Name), Name.length);
	this->MD5 = iMD5.ToString();
}


Attack::~Attack()
{
}

void Attack::Add(Attack & Attack)
{
	this->Parents.insert(pair<void *, int>(&Attack, Attack.Type));
}
