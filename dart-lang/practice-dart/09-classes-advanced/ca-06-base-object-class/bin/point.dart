// Define a class named Point to represent a 2D point with x and y coordinates
class Point {
  // Constructor that takes x and y coordinates as parameters
  // The 'const' keyword allows for compile-time constants
  const Point(this.x, this.y);

  // Final instance variables to store the coordinates
  // These can only be set once during object creation
  final int x;
  final int y;

  // Override the default toString() method from Object class
  // Returns a string representation of the Point object
  @override
  String toString() => 'Point(x: $x, y: $y)';

  // Override the equality operator (==) to compare two Point objects
  // The 'covariant' keyword allows us to narrow down the parameter type from Object to Point
  @override
  bool operator == (covariant Point other) {
    // Two points are equal if both their x and y coordinates match
    return other.x == x && other.y == y;
  }

  // Override the hashCode getter to maintain the contract that
  // equal objects must have the same hash code
  @override
  int get hashCode => Object.hash(x , y);

  // Define the addition operator (+) for Point objects
  // Returns a new Point where x and y are the sums of the corresponding coordinates
  Point operator + (covariant Point other) {
    return Point(x + other.x, y + other.y);
  }

  // Define the multiplication operator (*) for Point objects
  // Returns a new Point where x and y are the products of the corresponding coordinates
  Point operator * (covariant Point other) {
    return Point(x * other.x, y * other.y);
  }
}

// Main function to demonstrate the Point class functionality
void main() {
  // Create two Point objects
  final point1 = Point(1, 2);
  final point2 = Point(3, 4);

  // Demonstrate equality check
  print(point1 == point2); // Output: false (different coordinates)
  // Print the hash code of point1
  print(point1.hashCode); // Output: hash code value based on x and y

  // Demonstrate addition of two points (1+3, 2+4)
  print(point1 + point2); // Output: Point(x: 4, y: 6)
  // Demonstrate multiplication of two points (1*3, 2*4)
  print(point1 * point2); // Output: Point(x: 3, y: 8)
}