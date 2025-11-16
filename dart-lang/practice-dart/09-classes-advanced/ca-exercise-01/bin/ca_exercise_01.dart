import 'dart:math';

/// Abstract class defining the contract for all geometric shapes
/// Any class that extends Shape must implement both area and perimeter getters
abstract class Shape {
  /// Abstract getter for calculating the area of the shape
  /// Must be implemented by all subclasses
  double get area;
  
  /// Abstract getter for calculating the perimeter of the shape
  /// Must be implemented by all subclasses
  double get perimeter;

  void printValues() {
    print("Area: $area");
    print("Perimeter: $perimeter");
  }
}

/// A concrete implementation of Shape representing a square
/// Implements both area and perimeter calculations specific to squares
class Square extends Shape {
  /// The length of one side of the square
  final double sideLength;

  /// Creates a square with the given side length
  Square(this.sideLength);

  /// Calculates the area of the square (sideLength²)
  @override
  double get area => sideLength * sideLength;

  /// Calculates the perimeter of the square (4 × sideLength)
  @override
  double get perimeter => 4 * sideLength;
}

/// A concrete implementation of Shape representing a circle
/// Implements both area and perimeter (circumference) calculations specific to circles
class Circle extends Shape {
  /// The radius of the circle
  final double radius;

  /// Creates a circle with the given radius
  Circle(this.radius);

  /// Calculates the area of the circle (π × radius²)
  @override
  double get area => pi * radius * radius;

  /// Calculates the circumference of the circle (2 × π × radius)
  @override
  double get perimeter => 2 * pi * radius;
}

void main() {
  // Create instances of different shapes
  final square = Square(5);  // Square with side length 5
  final circle = Circle(3);  // Circle with radius 3

  // Demonstrate calculating and printing properties
  square.printValues();
  circle.printValues();
  
  // Example of adding a new shape would be easy:
  // 1. Create a new class that extends Shape
  // 2. Implement area and perimeter getters
  // 3. The existing print functions will work with the new shape
}