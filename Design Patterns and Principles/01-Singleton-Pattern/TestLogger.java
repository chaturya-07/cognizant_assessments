public class TestLogger {

    public static void main(String[] args) {

        Logger log1 = Logger.getInstance();
        Logger log2 = Logger.getInstance();

        if (log1 == log2) {
            System.out.println("Only one Logger instance exists.");
            System.out.println(log1);
            System.out.println(log2);
        } else {
            System.out.println("Multiple Logger instances exist.");
        }

    }

}
