// Import the math library for the square root function
import 'dart:math';

// A class representing a complex number
class Complex {
  // Constant constructor - creates compile-time constant objects
  // All instance variables must be 'final' to use const constructor
  const Complex(this.real, this.imaginary);

  // Immutable properties
  final double real;      // Real part of the complex number
  final double imaginary; // Imaginary part of the complex number

  // Getter for the magnitude (length) of the complex number
  // Calculated as sqrt(real² + imaginary²)
  double get magnitude => sqrt(real * real + imaginary * imaginary);

  // Method to print the complex number
  void printDetails() {
    print('Real: $real, Imaginary: $imaginary');
  }
}

void main() {
  // Create a compile-time constant complex number
  // Both the variable and the object are compile-time constants
  const complex = Complex(1.0, 2.0);
  
  // These would be identical if created with the same values
  const anotherComplex = Complex(1.0, 2.0);
  print(identical(complex, anotherComplex));  // Output: true (same instance)
  
  // Using the object
  complex.printDetails();  // Output: Real: 1.0, Imaginary: 2.0
  print('Magnitude: ${complex.magnitude}');  // Output: Magnitude: 2.236...
}