#include "Main.h"

using namespace dlib;
using namespace std;

int main()
{
	
	Attack a1("1");
	Attack a2("2");
	Attack a3("3");

	a3.Add(&a1);
	a3.Add(&a2);

	a2.Name = "23333";
	ParentList::iterator Parent;
	for (Parent = a3.Parents.begin(); Parent != a3.Parents.end(); Parent++)
	{
		cout<<((Attack *)(Parent->first))->Name<<endl;
	}
	return 0;
}