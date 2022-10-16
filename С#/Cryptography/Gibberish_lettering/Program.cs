using System;

namespace tarabar
{
    class Program
    {
        static void Main(string[] args)
        {
            char[] alp1 = new char[] { 'Б', 'В', 'Г', 'Д', 'Ж', 'З', 'К', 'Л', 'М', 'Н' };
            char[] alp2 = new char[] { 'Щ', 'Ш', 'Ч', 'Ц', 'Х', 'Ф', 'Т', 'С', 'Р', 'П' };

            for (int k = 0; k < alp1.GetLength(0); k++)
            {
                Console.Write("{0,2}", alp1[k]);
            }
            Console.WriteLine();
            for (int k = 0; k < alp2.GetLength(0); k++)
            {
                Console.Write("{0,2}", alp2[k]);
            }
            Console.WriteLine();
            Console.WriteLine("Введите сообщение рускими буквами для шифровки: ");
            string message = Console.ReadLine();
            string new_message = "";



            for (int i = 0; i < message.Length; i++)
            {
                int q = 0;
                for (int j = 0; j < alp1.GetLength(0); j++)
                {

                    if (Char.ToLower(alp1[j]) == message[i] || Char.ToUpper(alp1[j]) == message[i])
                    {
                        new_message += alp2[j];
                        q = 1;
                        break;
                    }
                    if (Char.ToLower(alp2[j]) == message[i] || Char.ToUpper(alp2[j]) == message[i])
                    {
                        new_message += alp1[j];
                        q = 1;
                        break;
                    }

                }
                if (q == 0)
                    new_message += Char.ToUpper(message[i]);

            }
            Console.WriteLine("Зашифрованное сообщение: " + new_message);
            Console.WriteLine("Дешифрование:" + message);
            Console.ReadLine();




        }
    }
}