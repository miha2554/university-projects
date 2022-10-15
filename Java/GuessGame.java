public class GuessGame { //GuessGame содержит три переменных экземпляра для трех объектов Player
    Player p1;
    Player p2;
    Player p3;
    public void startGame() {
        p1 = new Player(); //Создаем три обьекта Player и присваиваем их трем переменным экземпяра
        p2 = new Player();
        p3 = new Player();

        int guessp1 = 0; //Объявляем три переменные для хранения вариантов от каждого игрока
        int guessp2 = 0;
        int guessp3 = 0;

        boolean p1isRight = false; //Объявляем три переменные для хранения правильности или неправильности
        boolean p2isRight = false; //(true или false) ответов игроков
        boolean p3isRight = false;

        int targetNumber = (int)(Math.random() * 10);//Создаем число которое игроки должны угадать
        System.out.println("Я загадываю число от 0 до 9...");

        while (true)
        {
            System.out.println("Число которое нужно угадать, - " + targetNumber);

            p1.guess(); //Вызываем метод guess() из каждого объекта Player
            p2.guess();
            p3.guess();

            guessp1 = p1.number;                                           //Извлекаем варианты
            System.out.println("Первый игрок думает, что это " + guessp1); //каждого игрока
            //(результаты работы)
            guessp2 = p2.number;                                           //их методов guess()).
            System.out.println("Второй игрок думает, что это " + guessp2); //получая доступк их переменным number

            guessp3 = p3.number;
            System.out.println("Третий игрок думает, что это " + guessp3);

            if (guessp1 == targetNumber)       //Проверяем варианты каждого из игроков на соответствие
            {                                  //загаданному числу.  Если игрок угадал то присваиваем
                p1isRight = true;              //соответствующей переменной значение true
            }                                  //(помните, что по умолчанию она хранит значение false

            if (guessp2 == targetNumber)
            {
                p2isRight = true;
            }

            if (guessp3 == targetNumber)
            {
                p3isRight = true;
            }

            if (p1isRight || p2isRight || p3isRight)   //Если первых игрок ИЛИ второй ИЛИ третий угадал
            {                                          //оператор || означает или
                System.out.println("У нас есть победитель!");
                System.out.println("Первый игрок угадал? " + p1isRight);
                System.out.println("Второй игрок угадал? " + p2isRight);
                System.out.println("Третий игрок угадал? " + p3isRight);
                System.out.println("Конец игры.");
                break;  //Игра окончена, так что прерываем цикл   иначе остаемся в цикле и просим игроков сделать еще одну попытку
            }
            else
            {    //мы должны продолжать, так как никто не уадал
                System.out.println("Игроки должны попробовать еще раз.");
            }// конец if/else
        }//конец цикла
    }//конец метода
}//конец класса

 class Player {

    int number = 0; //Здесь хранится вариант числа
    public void guess() {
        number = (int)(Math.random() * 10);
        System.out.println("Думаю это число " + number);
    }
}
class GameLauncher {
    public static void main(String[] args) {
        GuessGame game = new GuessGame();
        game.startGame();
    }
}

