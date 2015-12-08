#include "Main.h"


using namespace dlib;
using namespace std;



int main()
{
    
    Attack a1("1");
    Attack a2("2");
    Attack a3("3");
    Attack a4("4");
    Attack a5("5");


    a5.Add(a1);
    a5.Add(a2);
    a5.Add(a3);
    a5.Add(a4);
    a5.Add(a5);
    
    // k = (a4 a3 a2 a1)2
    a5.Probabilities = {
    /*
    a4    F        F        F        F        F        F        F        F
    a3    F        F        F        F        T        T        T        T
    a2    F        F        T        T        F        F        T        T
    a1    F        T        F        T        F        T        F        T
    */
        0.1,    0.3,    0.1,    0.4,    0.2,    0.1,    0.7,    0.2,
    /*
    a4    T        T        T        T        T        T        T        T
    a3    F        F        F        F        T        T        T        T
    a2    F        F        T        T        F        F        T        T
    a1    F        T        F        T        F        T        F        T
    */
        0.3,    0.4,    0.1,    0.6,    0.4,    0.4,    0.5,    0.4
    };

    /*
    ParentList::iterator Parent = a5.Parents.end();
    for (Parent--; Parent != a5.Parents.begin(); Parent--)
    {
        cout<<((Attack *)(Parent->first))->Name<<endl;
    }
    */

    std::vector<int> vec;

    int i;
    for (i = 0; i < 10; i++)
        vec.push_back(i);

    vec = { 1,2,3,4 };
    system("pause");
    return 0;
}