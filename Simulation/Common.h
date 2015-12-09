#ifndef _COMMON_H_
#define _COMMON_H_

#include <sstream>
#include <iostream>

#define ErrorString "ErrorString"

enum
{
    Unknown,
    Attack,
    Function,
    Incident,
    Asset
};

using namespace std;

string Number2String(double Number);
string Number2String(int Number);


#endif