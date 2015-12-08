#include "Main.h"


using namespace dlib;
using namespace std;



int main()
{
    
    Attack A("A");
    Attack B("B");
    Attack C("C");
    Attack D("D");

    BayesianNetwork BayesianNetwork;

    D.Add(A);
    A.Add(B);
    A.Add(C);

    A.Probabilities = {
    /*
    C   F       F       T       T
    B   F       T       F       T
    */
        0.01,   0.9,    0.5,    0.99
    };

    B.Probabilities = {
        0.01
    };

    C.Probabilities = {
        0.001
    };

    D.Probabilities = {
    /*
    A   F       T
    */
        0.2,    0.5
    };

    BayesianNetwork.Add(A);
    BayesianNetwork.Add(B);
    BayesianNetwork.Add(C);
    BayesianNetwork.Add(D);
    system("pause");
    return 0;
}