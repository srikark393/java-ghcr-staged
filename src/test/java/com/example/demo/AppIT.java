package com.example.demo;

//package com.example.demo;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class AppIT {
    @Test
    void integrationSmoke() {
        assertTrue(System.getProperty("java.version").startsWith("17"));
    }
}
