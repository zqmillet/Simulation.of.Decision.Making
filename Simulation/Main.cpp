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

	vec = std::vector<int>(4);
	system("pause");
	return 0;
}