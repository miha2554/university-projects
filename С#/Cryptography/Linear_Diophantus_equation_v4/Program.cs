using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _17
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Введите a: ");
            int a = Convert.ToInt32(Console.ReadLine());
            Console.Write("Введите b: ");
            int b = Convert.ToInt32(Console.ReadLine());


            List<int> r = new List<int>();
            List<int> q = new List<int>();
            List<int> x = new List<int>();
            List<int> y = new List<int>();

            if (b > a)
            {
                r.Add(b);
                r.Add(a);
            }
            else
            {
                r.Add(a);
                r.Add(b);
            }
            x.Add(1);
            x.Add(0);
            y.Add(0);
            y.Add(1);
            int t = 0;
            q.Add(r[t] / r[t + 1]);
            while (r[t] - r[t + 1] * q[t] != 0)
            {
                r.Add(r[t] - r[t + 1] * q[t]);
                q.Add(r[t + 1] / r[t + 2]);
                t = t + 1;
            }

            for (int i = 0; i < r.Count - 2; i++)
            {
                x.Add(x[i] - q[i] * x[i + 1]);
                y.Add(y[i] - q[i] * y[i + 1]);
            }
            Console.WriteLine();
            Console.Write("|{0,3} ", "r_i");
            Console.Write("|{0,3} ", "q_i");
            Console.Write("|{0,3} ", "x_i");
            Console.Write("|{0,3} ", "y_i");

            Console.WriteLine();

            for (int i = 0; i < r.Count; i++)
            {
                Console.WriteLine(new string('-', (4 * r.Count + (r.Count + 2))));
                Console.Write("|{0,3} ", r[i]);
                if (i == 0)
                {
                    Console.Write("|{0,3} ", " ");
                }
                else
                {
                    Console.Write("|{0,3} ", q[i - 1]);
                }
                Console.Write("|{0,3} ", x[i]);
                Console.Write("|{0,3} ", y[i]);
                Console.WriteLine();
            }
            Console.WriteLine();
            if (a * x[x.Count - 1] + b * y[y.Count - 1] == 1) 
                Console.WriteLine("Ответ: (" + x[x.Count - 1] + "; " + y[y.Count - 1] + ")");
            else if (a * (-x[x.Count - 1]) + b * y[y.Count - 1] == 1) 
                Console.WriteLine("Ответ: (" + (-x[x.Count - 1]).ToString() + "; " + y[y.Count - 1] + ")");
            else if (a * (-x[x.Count - 1]) + b * (-y[y.Count - 1]) == 1) 
                Console.WriteLine("Ответ: (" + (-x[x.Count - 1]).ToString() + "; " + (-y[y.Count - 1]).ToString() + ")");
            else if (a * x[x.Count - 1] + b * (-y[y.Count - 1]) == 1) 
                Console.WriteLine("Ответ: (" + x[x.Count - 1] + "; " + (-y[y.Count - 1]).ToString() + ")");
            else if (a * y[y.Count - 1] + b * x[x.Count - 1] == 1) 
                Console.WriteLine("Ответ: (" + y[y.Count - 1] + "; " + x[x.Count - 1] + ")");
            else if (a * (-y[y.Count - 1]) + b * x[x.Count - 1] == 1) 
                Console.WriteLine("Ответ: (" + (-y[y.Count - 1]).ToString() + "; " + x[x.Count - 1] + ")");
            else if (a * (-y[y.Count - 1]) + b * (-x[x.Count - 1]) == 1) 
                Console.WriteLine("Ответ: (" + (-y[y.Count - 1]).ToString() + "; " + (-x[x.Count - 1]).ToString() + ")");
            else if (a * y[y.Count - 1] + b * (-x[x.Count - 1]) == 1) 
                Console.WriteLine("Ответ: (" + y[y.Count - 1] + "; " + (-x[x.Count - 1]).ToString() + ")");
            Console.WriteLine("Общее решение ЛДУ ax+by=d: (x0, y0) = ({0} - {1}t, {2} + {3}t)\n", x[x.Count - 1], b, y[y.Count - 1], a);
            Console.ReadKey();

        }
    }
}

