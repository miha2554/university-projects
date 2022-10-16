using System;

namespace ConsoleApp1
{
    class Program
    {
        static void ReturnArray<T>(T[,] A, int n)
        {
            Console.WriteLine(new string('-', (3 * n) + (n + 1)));

            for (int a = 0; a < n; ++a) // вывод
            {
                for (int c = 0; c < n; ++c)
                {

                    if (typeof(T) == typeof(String))
                    {
                        Console.Write("|{0,2}", A[a, c]);
                    }
                    else
                    {
                        Console.Write("|{0,2} ", A[a, c]);
                    }
                    if (c == n - 1)
                    {
                        Console.Write("|");
                    }
                }

                // Console.Write(A[a, c] + "  ");
                Console.WriteLine();
                Console.WriteLine(new string('-', (3 * n) + (n + 1)));
            }

        }

        static void Shifrivanie(int[,] A, string[,] S, int n, string s)
        {
            for (int i = 0; i < n; i++)
            {
                for (int j = 0; j < n; j++)
                {
                    if (A[i, j] != 0)
                        S[i, j] = " " + s.Substring(A[i, j] - 1, 1) + " ";

                }
            }
        }

        static void ObNull(int[,] A, int n)
        {
            for (int i = 0; i < n; i++)
                for (int j = 0; j < n; j++)
                    A[i, j] = 0;
        }

        static void Main(string[] args)
        {
            Console.WriteLine("Введите размеры решетки: ");
            int N = int.Parse(Console.ReadLine());

            Console.WriteLine("Введите фразу для шифрования: ");
            string s = Console.ReadLine();

            s = s.Replace(" ", ""); //Убираем все пробелы
            string[,] Shifr = new string[N, N]; //Матрица для вывода шифра            

            int n = N * N / 4;
            if (4 * n != N * N)
                Shifr[N / 2, N / 2] = " % ";
            //Добавляем вконце знаки, чтобы длина соотвествовала
            if (s.Length < 4 * n)
                s = s.PadRight(4 * n, '_');
            //Матрица для составления шифра
            int[,] Num = new int[N, N];
            int k = 1;
            int l = 1;
            for (int i = 0; i < N / 2; i++)
            {
                for (int j = l; j < N - l + 1; j++)
                {
                    if (k <= n)
                    {
                        Num[i, j] = k;
                        k++;
                    }
                }
                l++;
            }
            ReturnArray(Num, N);
            Console.WriteLine();
            Shifrivanie(Num, Shifr, N, s);
            s = s.Remove(0, k - 1);

            //поворот на 90
            k = 1;
            l = 1;
            ObNull(Num, N);
            for (int j = N - 1; j > N / 2 - 1; j--)
            {
                for (int i = l; i < N - l + 1; i++)
                {
                    if (k <= n)
                    {
                        Num[i, j] = k;
                        k++;
                    }
                }
                l++;
            }
            ReturnArray(Num, N);
            Console.WriteLine();
            Shifrivanie(Num, Shifr, N, s);
            s = s.Remove(0, k - 1);
            //поворот на 180
            k = 1;
            l = 1;
            ObNull(Num, N);
            for (int i = N - 1; i > N / 2 - 1; i--)
            {
                for (int j = N - l - 1; j >= l - 1; j--)
                {
                    if (k <= n)
                    {
                        Num[i, j] = k;
                        k++;
                    }
                }
                l++;
            }
            ReturnArray(Num, N);
            Console.WriteLine();
            Shifrivanie(Num, Shifr, N, s);
            s = s.Remove(0, k - 1);
            //поворот на 270
            k = 1;
            l = 1;
            ObNull(Num, N);
            for (int j = 0; j < N / 2; j++)
            {
                for (int i = N - l - 1; i >= l - 1; i--)
                {
                    if (k <= n)
                    {
                        Num[i, j] = k;
                        k++;
                    }
                }
                l++;
            }
            ReturnArray(Num, N);
            Console.WriteLine();
            Shifrivanie(Num, Shifr, N, s);
            ReturnArray(Shifr, N);
            Console.ReadKey();
        }
    }
}