package example;

public class AppTest {
    public static void main(String[] args) {
        if (!"Hello World!".equals(App.message())) {
            throw new AssertionError("Expected 'Hello World!' but got: " + App.message());
        }
        System.out.println("OK");
    }
}
