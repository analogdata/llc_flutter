import 'dart:math' as math;

void main() {
  int a = 10;
  int b = 20;

  print(a + b); // Addition
  print(a - b); // Subtraction
  print(a * b); // Multiplication
  print(a / b); // Division
  print(a ~/ b); // Integer Division
  print(a % b); // Modulus


  // Increment & Decrement
  print(a++); // Post Increment
  print(b--); // Post Decrement

  print(++a); // Pre Increment
  print(--b); // Pre Decrement

  // Operator Precedence
  print((a + b) * (a - b));
  print(a + b * a - b);

  // Square Root
  print(math.sqrt(144));

  // Power
  print(math.pow(2, 3));


  // Exercise: Celsius to Fahrenheit Conversion
  double celsius = 37;
  double fahrenheit = (celsius * 9/5) + 32;
  print(fahrenheit);

  // Exercise: Fahrenheit to Celsius Conversion
  double fahrenheit2 = 98.6;
  double celsius2 = (fahrenheit2 - 32) * 5/9;
  print(celsius2);
}