// This example demonstrates method overriding in Dart
// Method overriding allows a subclass to provide a specific implementation of a method
// that is already defined in its parent class

// Base class Animal with common animal behaviors
class Animal {
  // Constructor with a required age parameter
  Animal({required this.age});

  // Final property that can only be set during initialization
  final int age;

  // Basic sleep behavior for all animals
  void sleep() => print("Sleep");
  
  // Basic eat behavior for all animals
  void eat() => print("Eat");
}

// Dog class that extends Animal and overrides some behaviors
class Dog extends Animal {
  // Constructor using super parameter syntax to forward age to parent class
  Dog({required super.age});

  // Override the sleep() method completely
  // This replaces the parent class implementation
  @override
  void sleep() => print("Dog Sleep");

  // Override the eat() method but also call the parent's implementation
  // using super.eat() to extend the behavior rather than replace it
  @override
  void eat() {
    super.eat();  // First call the parent's eat() method
    print("Dog Eat's Bone");  // Then add dog-specific behavior
  }
}

void main() {
  // Create a Dog instance
  final dog = Dog(age: 10);
  
  // Call the overridden sleep() method
  // This will print "Dog Sleep" instead of "Sleep"
  dog.sleep();
  
  // Call the overridden eat() method
  // This will print both "Eat" (from Animal) and "Dog Eat's Bone" (from Dog)
  dog.eat();
}