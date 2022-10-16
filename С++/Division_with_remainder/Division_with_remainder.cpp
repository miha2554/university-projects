#include<iostream>
#include<iomanip>
#include <math.h> 
using namespace std;
int main() {
	setlocale(LC_ALL, "Rus");
	int  a, b, q, r;
	int n;
m1:
	// Ввод параметров
	cout << "Введите делимое, a = ";
	cin >> a;
	cout << "Введите делитель, b = ";
	cin >> b;
	if (b == 0) goto m1;
	q = 0;
	r = abs(a);

	if ((a > 0) && (b < 0))
	{
		while (r >= abs(b))
		{
			r = r - abs(b);
			q = q + 1;
		}
		cout << "Неполное частное q = " << -q << endl;
		cout << "Остаток r = " << r << endl;
		cout << a << " = " << b << " * (" << -q << ") + " << r << endl;
	}

	if ((a < 0) && (b > 0))
	{
		while (abs(r) >= b)
		{
			r = r - b;
			q = q + 1;
		}
		while (abs(r - b) < b)
		{
			r = r - b;
			q = q + 1;
		}
		cout << "Неполное частное q = " << -q << endl;
		cout << "Остаток r = " << -r << endl;
		cout << a << " = " << b << " * (" << -q << ") + " << -r << endl;
	}

	if ((a < 0) && (b < 0))
	{
		while (abs(r) >= abs(b))
		{
			r = r - abs(b);
			q = q + 1;
		}
		while (abs(r - abs(b)) < abs(b))
		{
			r = r - abs(b);
			q = q + 1;
		}
		cout << "Неполное частное q = " << q << endl;
		cout << "Остаток r = " << -r << endl;
		cout << a << " = " << b << " * " << q << " + " << -r << endl;
	}

	if ((a >= 0) && (b > 0))
	{
		while (r >= b)
		{
			r = r - b;
			q = q + 1;
		}

		cout << a << " = " << b << " * " << q << " + " << r << endl;
		cout << "Неполное частное q = " << q << endl;
		cout << "Остаток r = " << r << endl;
	}


	return 0;
}
