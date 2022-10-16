#include <iostream>
#include <fstream>
#include <string>
using namespace std;
int main()
{
    setlocale(LC_ALL, "Russian");
    fstream F, H;
    ofstream f, h;
    string a, s1, s2;
    int n;
    s1 = "абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ,.;:!?-";
    s2 = "фпсцнжщлычдъзвтэшбрйуьмкигоюеяхаё¶ФПСЦНЖЩЛЫЧДЪЗВТЭШБРЙУЬМКИГОЮЕЯХА,.;:!?-";
    cout << "Введите: 1 для шифровки текста, 2 для расшифровки текста" << endl;
    cin >> n;
    if (n == 1)
    {
        F.open("C:\\Users\\User\\Desktop\\lab1\\text.txt.txt");
        f.open("C:\\Users\\User\\Desktop\\lab1\\text1.txt.txt", ios::out);
        if (F)
        {
            while (!F.eof())
            {
                F >> a;
                for (int i = 0; i < a.length(); i++)
                {
                    a[i] = s2[s1.find(a[i])];
                }

                f << a << " ";
                cout << a << " ";
            }
        }
        f.close();
        F.close();
    }

    else
    {
        H.open("C:\\Users\\User\\Desktop\\lab1\\text1.txt.txt");
        h.open("C:\\Users\\User\\Desktop\\lab1\\text2.txt.txt", ios::out);
        if (H)
        {
            while (!H.eof())
            {
                H >> a;
                for (int i = 0; i < a.length(); i++)
                {
                    a[i] = s1[s2.find(a[i])];
                }

                h << a << " ";
                cout << a << " ";
            }
        }
        h.close();
        H.close();
    }

    return 0;
}
