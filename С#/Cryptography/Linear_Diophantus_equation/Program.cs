using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _12
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Решение ЛДУ ax + by = 1");
            Console.WriteLine();
            Console.Write("Введите a: ");
            int a1 = Convert.ToInt32(Console.ReadLine());
            Console.Write("Введите b: ");
            int b = Convert.ToInt32(Console.ReadLine());
            int i = 0;
            int t = 0;
            int a5 = a1;
            int b5 = b;
            if (Math.Abs(b) > Math.Abs(a1))
            {
                a1 = b5;
                b = a5;
            }
            int a = a1;
            int r = a;
            List<int> A = new List<int>();
            List<int> B = new List<int>();
            List<int> R = new List<int>();
            List<int> Q = new List<int>();
            while (r != 0)
            {
                i = 0;
                int a2 = a;
                if ((a > 0 && b < 0) || (a < 0 && b > 0))
                {
                    while (a >= Math.Abs(b) || a < 0)
                    {
                        a += b;
                        i -= 1;
                    }
                }
                else
                {
                    while (a >= Math.Abs(b) || a < 0)
                    {
                        a -= b;
                        i += 1;
                    }
                }
                if (t == 0)
                {
                    Console.WriteLine(a1 + " = " + i + " * " + b + " + " + a);
                    t = 1;
                    if (a != 0)
                    {
                        A.Add(a2);
                        B.Add(b);
                        R.Add(a);
                        Q.Add(i);
                    }
                }
                else
                {
                    Console.WriteLine(a2 + " = " + i + " * " + b + " + " + a);
                    if (a != 0)
                    {
                        A.Add(a2);
                        B.Add(b);
                        R.Add(a);
                        Q.Add(i);
                    }
                }
                r = a;
                if (r != 0)
                {
                    a = b;
                    b = r;
                }
            }

            Console.WriteLine();
            int x1, x2, y1, y2;
            x1 = 1;
            y1 = -Q[Q.Count - 1];
            int x = A[A.Count - 1];
            int y = B[B.Count - 1];
            int r1 = R[R.Count - 1];
            int q1 = -Q[Q.Count - 1];
            Console.Write(r1 + " = " + x + " + " + y + " * " + q1);
            for (int j = A.Count - 2; j >= 0; j--)
            {
                if (R[j] == y)
                {
                    y = A[j];
                    x1 = x1 - y1 * Q[j];
                    Console.Write(" = " + x + " * " + x1 + " + " + y + " * " + y1);
                }
                else
                {
                    x = A[j];
                    y1 = y1 - x1 * Q[j];
                    Console.Write(" = " + x + " * " + x1 + " + " + y + " * " + y1);
                }
            }

            Console.WriteLine();
            Console.WriteLine("Частное решение ЛДУ:  " + "(" + x1 + "," + y1 + ")");

            if (a5 * x1 + b5 * y1 == 1)
                Console.WriteLine("Общее решение ЛДУ:  " + "(" + x1 + " + " + b5 + "t; " + y1 + " - " + a5 + "t" + ")");
            else Console.WriteLine("Общее решение ЛДУ: " + "(" + y1 + " + " + b5 + "t; " + x1 + " - " + a5 + "t" + ")");




            Console.ReadKey();
        }
    }
}