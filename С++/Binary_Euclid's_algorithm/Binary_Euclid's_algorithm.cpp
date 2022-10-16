#include <iostream>
#include <cmath>

using namespace std;

void fun1(int a)
{
    long long int n = 0;
    int k, m = 0;
    while (a)
    {
        k = a % 2;
        a = a / 2;
        n += k * pow(10, m);
        m++;
    }
    cout << n << endl;
}
void fun2(int b)
{
    long long int n = 0;
    int k, m = 0;
    while (b)
    {
        k = b % 2;
        b = b / 2;
        n += k * pow(10, m);
        m++;
    }
    cout << n << endl;
}
void funs(int d)
{
    long long int n = 0;
    int k, m = 0;
    while (d)
    {
        k = d % 2;
        d = d / 2;
        n += k * pow(10, m);
        m++;
    }
    cout << n << endl;
}
int NOD(int a, int b)
{
    int k = 1;
    while ((a != 0) && (b != 0))
    {
        while ((a % 2 == 0) && (b % 2 == 0))
        {
            a /= 2;
            b /= 2;
            k *= 2;
        }
        while (a % 2 == 0)
        {
            a /= 2;
        }
        while (b % 2 == 0)
        {
            b /= 2;
        }
        if (a >= b)
        {
            a -= b;
        }
        else
        {
            b -= a;
        }
    }
    return b * k;
}

int main()
{
    setlocale(LC_ALL, "Rus");
    int a, b, d;
    cout << "Введите число a: ";
    cin >> a;
    fun1(a);

    cout << "Введите число b: ";
    cin >> b;
    fun2(b);

    cout << "d=(" << a << "," << b << ")=" << NOD(a, b) << endl;
    funs(NOD(a, b));

    return 0;
}