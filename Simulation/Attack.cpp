#include "Attack.h"

Attack::Attack(string Name)
{
    this->Name = Name;
    this->Type = t_Attack;
    this->Parents.clear();
    this->Probabilities.clear();
}

Attack::~Attack()
{
    this->Parents.clear();
    this->Probabilities.clear();
}

void Attack::Add(Attack & Attack)
{
    // A node can not be its parent
    if (this == &Attack)
        return;
    
    // Add this node into the Parents
    this->Parents.insert(pair<void *, int>(&Attack, Attack.Type));

    // Resize the Probabilites
    this->Probabilities = ProbabilityList(1<<this->Parents.size());
}