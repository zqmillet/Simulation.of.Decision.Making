#include "Main.h"

using namespace dlib;
using namespace std;

int test(int i, ...)
{
	va_list arg_ptr;
	va_start(arg_ptr, i);

	int j = 0;

	while (j != -1) //�Զ����һ������������־
	{
		j = va_arg(arg_ptr, int); //��ȡ��һ������
		printf("%d ", j);
	}
	va_end(arg_ptr); //����
	return 0;
}

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

	a2.Name = "233333";

	ParentList::iterator Parent = a5.Parents.end();
	for (Parent--; Parent != a5.Parents.begin(); Parent--)
	{
		cout<<((Attack *)(Parent->first))->Name<<endl;
	}

	test(1);

	system("pause");
	return 0;
}