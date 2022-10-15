public class DogTestDrive {
    public static void main (String[] args) {
        DDog one = new DDog();
        one.size = 70;
        DDog two = new DDog();
        two.size = 8;
        DDog three = new DDog();
        three.size = 35;
        one.bark();
        two.bark();
        three.bark();
    }

}
class DDog {
    int size;
    String name;

    void bark() {
        if (size > 60) {
            System.out.println("Гав Гав!");
        } else if (size > 14) {
            System.out.println("Вуф Вуф!");
        } else {
            System.out.println("Тяф Тяф!");
        }
    }
}

