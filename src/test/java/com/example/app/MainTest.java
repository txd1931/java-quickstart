package com.example.app;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import org.junit.jupiter.api.Test;

class MainTest {

  @Test
  void mainPrintsHelloWorld() {
    PrintStream originalOut = System.out;
    ByteArrayOutputStream output = new ByteArrayOutputStream();
    try {
      System.setOut(new PrintStream(output));
      Main.main(new String[0]);
      assertEquals("Hello, World!" + System.lineSeparator(), output.toString());
    } finally {
      System.setOut(originalOut);
    }
  }
}