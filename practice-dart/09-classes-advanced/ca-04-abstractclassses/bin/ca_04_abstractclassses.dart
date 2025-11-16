import 'dart:math';

// Why use Abstract Classes?
// 1. Defines a common interface for all shapes
// 2. Ensures all shapes implement required functionality (area calculation)
// 3. Prevents direct instantiation of the base class (can't create a generic 'Shape')
// 4. Enables polymorphic behavior through the base class type

// Abstract class defining the contract that all shapes must follow
// It declares what a Shape can do (calculate area) but not how to do it
abstract class Shape {
  // Abstract getter that must be implemented by all subclasses
  // This enforces that all shapes must provide an area calculation
  double get area;
  
  // Abstract classes can also provide concrete implementations
  // that subclasses can inherit or override
  void printDescription() {
    print('This is a $runtimeType with area: $area');
  }
}

// Concrete implementation of Shape for squares
class Square extends Shape {
  Square(this.sideLength);

  final double sideLength;

  @override
  double get area => sideLength * sideLength;
  
  @override
  void printDescription() {
    print('Square with side length $sideLength');
    super.printDescription();
  }
}

// Concrete implementation of Shape for circles
class Circle extends Shape {
  Circle(this.radius);

  final double radius;

  @override
  double get area => pi * radius * radius;
  
  @override
  void printDescription() {
    print('Circle with radius $radius');
    super.printDescription();
  }
}

// Why not just use regular classes without abstract?
// 1. No enforcement of required methods/properties
// 2. Could forget to implement area calculation in some shapes
// 3. Could accidentally instantiate the base Shape class which might not make sense

// Function that demonstrates polymorphism - it can work with any Shape
void printArea(Shape shape) {
  // This works because we know all Shapes must implement 'area'
  print("Area of ${shape.runtimeType}: ${shape.area.toStringAsFixed(2)}");
  shape.printDescription();
  print('---');
}

void main() {
  // Create specific shape instances
  final Square square = Square(5);
  final Circle circle = Circle(3);

  // Access area directly
  print("Square area: ${square.area}");
  print("Circle area: ${circle.area}\n");

  // Use the same function with different shape types (polymorphism)
  print("Printing areas using printArea function:");
  printArea(square);
  printArea(circle);

  // Store different shapes in a list and process them uniformly
  print("\nProcessing shapes in a list:");
  final shapes = <Shape>[
    Square(25),
    Circle(5),
    // Shape(), // This would be a compile-time error - can't instantiate abstract class
  ];

  for (var shape in shapes) {
    // The same code works for any Shape
    printArea(shape);
  }
  
  // Benefits demonstrated:
  // 1. Type safety - all shapes must implement the required interface
  // 2. Code reusability - common functionality in Shape class
  // 3. Extensibility - can add new shapes without changing existing code
  // 4. Polymorphism - can treat all shapes uniformly through the Shape interface
}
