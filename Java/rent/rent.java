public class Main {
    public static String getGreeting() {
        return "Hello World!";
    }

    public static String calculateRent(double pl, int pl1, double bs, double k_inf, int term) {
        return String.format("%.2f", (pl + pl1) * bs * k_inf * (term / 12));
    }

    public static String calculateRent(double pl, int pl1, double bs, int term) {
        return calculateRent(pl, pl1, bs, 1, term);
    }

    public static String calculateRent(double pl, double bs, double k_inf, int term) {
        return calculateRent(pl, 0, bs, k_inf, term);
    }

    public static String calculateRent(double pl, double bs, int term) {
        return calculateRent(pl, 0, bs, 1, term);
    }

    public static void main(String[] args) {
        System.out.println(calculateRent(100, 200, 5, 0.4, 47));
    }
}
