#ifndef _COMMON_H_
#define _COMMON_H_

#include <sstream>
#include <iostream>

#define ErrorString "ErrorString"

enum _NodeType
{
    Unknown,
    Attack,
    Function,
    Incident,
    Asset
};

typedef enum _NodeType NodeType;

enum _Order
{
    OrderByIndex,
    OrderByName,
    OrderByType,
    OrderByProbability
};

typedef enum _Order Order;

enum _Direction
{
    Descend = 1,
    Ascend = -1
};

typedef enum _Direction Direction;

enum _EvidenceState
{
    Happened = 1,
    Unhappened = 0
};

typedef enum _EvidenceState EvidenceState;

using namespace std;

string Number2String(double Number);
string Number2String(int Number);
string RepeatString(string String, int Time);

#endif