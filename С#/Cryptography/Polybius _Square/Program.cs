using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace polibii
{
    class Program
    {
        static void Main(string[] args)
        {
            char[,] alp = { {'А', 'Б', 'В', 'Г', 'Д','Е'}, // квадрат Полибия
                            {'Ж', 'З', 'И', 'К','Л','М'},
                            {'Н', 'О', 'П', 'Р','С','Т'},
                            {'У', 'Ф', 'Х', 'Ц','Ч','Ш'},
                            {'Щ', 'Ы', 'Ь', 'Э', 'Ю', 'Я'},

                           };
            // Выводим таблицу
            Console.WriteLine(" 0 1 2 3 4 5 ");
            for (int j = 0; j < alp.GetLength(0); j++)
            {
                Console.Write(j);
                for (int k = 0; k < alp.GetLength(1); k++)
                {
                    Console.Write("{0,2}", alp[j, k]);
                }
                Console.WriteLine();
            }
            Console.WriteLine();
            Console.WriteLine("Введите сообщение русcкими буквами для шифровки: ");
            string message = Console.ReadLine();
            string new_message = "";

            for (int i = 0; i < message.Length; i++) // количество символов в сообщении
            {
                for (int j = 0; j < alp.GetLength(0); j++) // по строкам
                    for (int k = 0; k < alp.GetLength(1); k++) // по столбцам 
                        if (Char.ToLower(alp[j, k]) == message[i] || Char.ToUpper(alp[j, k]) == message[i])
                        {
                            new_message += (Convert.ToString(j) + Convert.ToString(k) + " "); // номер строки + номер столбца
                            break;
                        }
            }
            Console.WriteLine(new_message); // выводим результат
            Console.ReadLine();
        }

    }
}