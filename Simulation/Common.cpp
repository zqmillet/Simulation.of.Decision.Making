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

string RepeatString(string String, int Time)
{
    if (Time <= 0)
        return "";
    
    string Result = "";
    int i;
    for (i = 0; i < Time; i++)
        Result += String;

    return Result;
}