public class Dog66 {
    int size;
    String breed;
    String name;

    void bark1() {
        System.out.println("Гав! Гав!");
    }
}

    class DogTestDrive1 {
        public static void main (String[] args) {
            Dog66 d = new Dog66() ;
            d.size = 40;
            d.bark1();
        }
}
