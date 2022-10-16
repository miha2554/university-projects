using System;

using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ex13
{
    class Program
    {
        static int NOD(int a, int b, out int x, out int y)
        {

            if (a == 0)
            {
                x = 0;
                y = 1;
                return b;
            }

            int nod = NOD(b % a, a, out x, out y);

            int newY = x;
            int newX = y - (b / a) * x;

            x = newX;
            y = newY;

            return nod;
        }

        static void Main(string[] args)
        {
        met:
            Console.Write("Решение ЛДУ ax + by = с \nВведите a: ");
            int a = int.Parse(Console.ReadLine());
            Console.Write("Введите b: ");
            int b = int.Parse(Console.ReadLine());
            Console.Write("Введите с: ");
            int c = int.Parse(Console.ReadLine());

            int x, y, tmax, tmin;

            int a1 = a; int b1 = b; int c1 = c;

            int d = NOD(a, b, out x, out y);

            if (c % d == 0)
            {
                a1 /= d;
                b1 /= d;
                c1 /= d;
                int d1 = NOD(a1, b1, out x, out y);
                int x0 = x * c1;
                int y0 = y * c1;


                Console.WriteLine();
                Console.WriteLine("Общее решение ЛДУ {0}x + {1}y = {2}: ", a, b, c);
                Console.WriteLine();
                Console.WriteLine("(x0, y0) = ({0} + {1}t, {2} - {3}t)\n", x0, b, y0, a);

                double t1 = (double)x0 / (double)b;
                double t2 = -(double)y0 / (double)a;



                if ((int)Math.Floor(t2) == (int)Math.Floor(t1))
                {
                    Console.WriteLine("");
                }
                else
                {
                    if (t1 < t2)
                    {
                        tmax = (int)Math.Floor(t2);
                        tmin = (int)Math.Floor(t1) + 1;
                    }
                    else
                    {
                        tmax = (int)Math.Floor(t1);
                        tmin = (int)Math.Floor(t2) + 1;
                    }



                    int k = 0;

                    int q = tmin;
                    while (q <= tmax)
                    {
                        q++;
                        k++;
                    }


                    int[] xi = new int[k];
                    int[] yi = new int[k];

                    for (int i = 0; i < k; i++)
                    {
                        xi[i] = x0 - b * (tmin + i);
                        yi[i] = y0 + a * (tmin + i);
                    }




                }
            }



            Console.ReadKey();
        }
    }
}