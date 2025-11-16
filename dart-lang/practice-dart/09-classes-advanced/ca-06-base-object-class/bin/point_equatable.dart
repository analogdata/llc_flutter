// Import the equatable package which provides base classes for implementing equality
// This helps in reducing boilerplate code for value-based equality
import 'package:equatable/equatable.dart';
// Read more about Equatable at https://pub.dev/packages/equatable

// Point class that extends Equatable for simplified equality implementation
class Point extends Equatable {
  // Constructor that takes x and y coordinates
  const Point(this.x, this.y);

  // Immutable properties for x and y coordinates
  final int x;
  final int y;

  // Override the props getter required by Equatable
  // This list defines which properties are used for equality comparison
  @override
  List<Object?> get props => [x, y];

  // Override to automatically call toString() when the object is printed
  @override
  bool get stringify => true;

  // Operator overloading for addition of two points
  // Returns a new Point with summed coordinates
  Point operator +(Point other) => Point(x + other.x, y + other.y);

  // Operator overloading for subtraction of two points
  // Returns a new Point with subtracted coordinates
  Point operator -(Point other) => Point(x - other.x, y - other.y);

  // Operator overloading for multiplication of two points
  // Returns a new Point with multiplied coordinates
  Point operator *(Point other) => Point(x * other.x, y * other.y);
}

void main() {
  // Create two Point instances
  final point1 = Point(1, 2);
  final point2 = Point(3, 4);

  // Print the points (automatically uses toString() from Equatable)
  print(point1); // Output: Point(1, 2)
  print(point2); // Output: Point(3, 4)

  // Demonstrate equality check (provided by Equatable)
  print(point1 == point2); // Output: false
  
  // Get the hash code (automatically provided by Equatable based on props)
  print(point1.hashCode);

  // Demonstrate operator overloading
  print(point1 + point2); // Output: Point(4, 6) - Addition of coordinates
  print(point1 * point2); // Output: Point(3, 8) - Multiplication of coordinates
}