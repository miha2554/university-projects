﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace vigenera
{
    class Program
    {
        static void Main(string[] args)
        {
            char[,] alp = { {'0','А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я'},
                            {'А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я','А'},
                            {'Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я','А','Б'},
                            {'В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я','А','Б','В'},
                            {'Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я','А','Б','В','Г'},
                            {'Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я','А','Б','В','Г','Д'},
                            {'Е','Ё','Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я','А','Б','В','Г','Д','Е'},
                            {'Ё','Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я','А','Б','В','Г','Д','Е','Ё'},
                            {'Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я','А','Б','В','Г','Д','Е','Ё','Ж'},
                            {'З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я','А','Б','В','Г','Д','Е','Ё','Ж','З'},
                            {'И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я','А','Б','В','Г','Д','Е','Ё','Ж','З','И'},
                            {'Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я','А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й'},
                            {'К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я','А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К'},
                            {'Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я','А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л'},
                            {'М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я','А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М'},
                            {'Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я','А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н'},
                            {'О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я','А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н','О'},
                            {'П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я','А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н','О','П'},
                            {'Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я','А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н','О','П','Р'},
                            {'С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я','А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н','О','П','Р','С'},
                            {'Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я','А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т'},
                            {'У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я','А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У'},
                            {'Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я','А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф'},
                            {'Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я','А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х'},
                            {'Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я','А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц'},
                            {'Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я','А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч'},
                            {'Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я','А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш'},
                            {'Щ','Ъ','Ы','Ь','Э','Ю','Я','А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ'},
                            {'Ъ','Ы','Ь','Э','Ю','Я','А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ'},
                            {'Ы','Ь','Э','Ю','Я','А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы'},
                            {'Ь','Э','Ю','Я','А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь'},
                            {'Э','Ю','Я','А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э'},
                            {'Ю','Я','А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю'},
                            {'Я','А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я'},
                           };


            Console.WriteLine("Введите лозунг: ");
            string lozung = Console.ReadLine();
            Console.WriteLine("Введите фразу:  ");
            string message = Console.ReadLine();
            Console.WriteLine();
            string new_message = "";

            int c = 0;

            for (int i = 0; i < message.Length; i++) // количество символов в сообщении
            {
                for (int j = 0; j < alp.GetLength(0); j++) // по строкам
                {
                    for (int k = 0; k < alp.GetLength(1); k++) // по столбцам 
                    {
                        if (lozung[c] == Convert.ToChar(" ")) // если встречается пробел в лозунге переходим к следующему символу
                        {
                            c = c + 1;
                        }
                        if (message[i] == Convert.ToChar(" ")) // если встречается пробел в сообщении переходим к следующему символу 
                        {
                            i = i + 1;
                        }
                        if ((Char.ToLower(alp[j, 0]) == message[i] || Char.ToUpper(alp[j, 0]) == message[i]) && (Char.ToLower(alp[0, k]) == lozung[c] || Char.ToUpper(alp[0, k]) == lozung[c]))
                        {
                            new_message += alp[j, k];
                        }
                    }
                }
                c = c + 1;
                // если количество букв в лозунге оказалось больше чем в сообщении
                if (c > lozung.Length - 1)
                {
                    c = 0;
                }
            }
            Console.WriteLine("Шифрованная фраза: ");
            Console.WriteLine(new_message);
            Console.ReadLine();
        }
    }
}
