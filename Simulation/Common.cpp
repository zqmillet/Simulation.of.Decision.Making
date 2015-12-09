#include "Common.h"

using namespace std;

string Number2String(double Number)
{
    stringstream StringStream;
    StringStream << Number;
    return StringStream.str();
}

string Number2String(int Number)
{
    return Number2String((double)Number);
}