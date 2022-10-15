public class Dog {
    String name;
    int size;

    public static void main(String[] args) {
        //Создаем обьект Dog и получаем к нему доступ
        Dog dog1 = new Dog();
        dog1.bark();
        dog1.name = "Барт";
        //Теперь создадим массив типа Dog
        Dog[] myDogs = new Dog[3];
        //и поместим в него несколько элементов
        myDogs[0] = new Dog();
        myDogs[1] = new Dog();
        myDogs[2] = dog1;
        //теперь получаем доступ к обьектам Dog с помощью ссылок и массива
        myDogs[0].name = "Фред";
        myDogs[1].name = "Джорж";
        //хммм какое имя у MyDog[2]?
        System.out.print("Имя последней собаки - ");
        System.out.println(myDogs[2].name);
        //теперь переберем все элементы массива и вызовем для каждого метод bark()
        int x = 0;
        while (x < myDogs.length) {
            myDogs[x].bark();
            x = x + 1;
        }
    }

    public void bark() {
        System.out.println(name + " сказал Гав!");
    }

    public void eat() {
    }

    public void chaseCat() {
    }
}


