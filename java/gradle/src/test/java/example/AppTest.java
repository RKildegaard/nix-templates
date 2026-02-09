package example;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class AppTest {
    @Test
    void message() {
        assertEquals("Hello World!", App.message());
    }
}
