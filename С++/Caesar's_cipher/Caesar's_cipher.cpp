#include <iostream>
#include <locale>
#include <windows.h>
#include <cstring>
using namespace std;

int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
    setlocale(LC_ALL, "Russian");
    int step;
    char inptext[255];
    cout << "Input text - ";
    cin.getline(inptext, 255);
    cout << "Input shag - ";
    cin >> step;
    for (int i = 0; i < strlen(inptext); i++)
    {
        if (inptext[i] == 'я') {
            inptext[i] = 'а';
        }
        if (inptext[i] >= 'а' && inptext[i] < 'я') {
            inptext[i] += step;
        }
    }
    cout << "Output -  " << inptext << endl;

}
