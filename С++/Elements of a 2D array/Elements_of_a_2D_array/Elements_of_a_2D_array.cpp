#include <iostream>
#include <ctime>
#include <cstdlib>

using namespace std;

int main()
{
    const int m = 11, n = 8;
    int a[m][n], Min[n], i;
    srand(time(0));
    for (int i = 0; i < m; ++i)
        for (int j = 0; j < n; ++j)
            a[i][j] = rand() % 201 - 100;
    cout << "Source array" << endl;
    for (int i = 0; i < m; ++i)

    {
        for (int j = 0; j < n; ++j)

            cout << a[i][j] << " ";

        cout << endl;
    }
    cout << "Smallest element" << endl;
    for (int j = 0; j < n; ++j)

    {
        Min[j] = a[0][j];
        for (int i = 0; i < n; ++i)
            if (a[i][j] < Min[j])
                Min[j] = a[i][j];

        cout << Min[j] << endl;
    }

    for (int j = 0; j < n; j++)
        a[0][j] = Min[j] + a[0][j];

    cout << "New array" << endl;
    for (int i = 0; i < m; ++i)

    {
        for (int j = 0; j < n; ++j)

            cout << a[i][j] << " ";

        cout << endl;
    }

    return 0;
}
