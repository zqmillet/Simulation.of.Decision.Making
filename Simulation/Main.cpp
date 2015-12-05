#include "Main.h"

using namespace dlib;
using namespace std;


int main()
{
	
	Attack a1("1");
	Attack a2("2");
	Attack a3("3");

	a3.AddParents(&a1);
	a3.AddParents(&a2);

	a2.Name = "23333";
	return 0;

}