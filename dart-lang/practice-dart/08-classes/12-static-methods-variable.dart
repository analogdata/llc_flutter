/// A utility class demonstrating static variables and methods in Dart.
/// Static members belong to the class itself, not to instances of the class.
class Strings {
  // Static variables (class variables)
  // These are shared across all instances of the class
  // They can be accessed using the class name (e.g., Strings.welcome)
  static const String welcome = 'Welcome to our app!';
  static const String bye = 'Thank you for using our app!';
  
  // Static counter to demonstrate mutable static state
  static int callCount = 0;

  /// Static method that greets a user by name
  /// Can be called without creating an instance of the class
  static void greet(String name) {
    callCount++; // Increment call counter
    print('Hello $name!');
    print('(This greeting has been shown $callCount time${callCount == 1 ? '' : 's'})');
  }
  
  /// A non-static method (instance method)
  /// Requires an instance of the class to be called
  void showInfo() {
    print('This is a Strings utility class');
    // Can access both static and instance members
    print('$welcome - $bye');
  }
}

/// A class demonstrating a practical use case for static members
class MathUtils {
  // Static constant
  static const double pi = 3.14159;
  
  // Static method to calculate area of a circle
  static double calculateCircleArea(double radius) => pi * radius * radius;
  
  // Static method to calculate circumference
  static double calculateCircumference(double radius) => 2 * pi * radius;
}

void main() {
  print('=== Static Variables Demo ===');
  // Access static variables directly using the class name
  print(Strings.welcome); // No instance needed
  print(Strings.bye);
  
  print('\n=== Static Methods Demo ===');
  // Call static methods without creating an instance
  Strings.greet('Rajath');
  Strings.greet('Alice');
  
  print('\n=== Instance Methods Demo ===');
  // To use instance methods, we need to create an instance
  final strings = Strings();
  strings.showInfo();
  
  print('\n=== Math Utils Demo ===');
  // Using static methods from MathUtils
  const radius = 5.0;
  print('Area of circle with radius $radius: ${MathUtils.calculateCircleArea(radius).toStringAsFixed(2)}');
  print('Circumference: ${MathUtils.calculateCircumference(radius).toStringAsFixed(2)}');
  
  print('\n=== Key Points ===');
  print('1. Static members belong to the class, not instances');
  print('2. Can be accessed using ClassName.memberName');
  print('3. Useful for utility functions and constants');
  print('4. Static methods cannot access instance members directly');
}
