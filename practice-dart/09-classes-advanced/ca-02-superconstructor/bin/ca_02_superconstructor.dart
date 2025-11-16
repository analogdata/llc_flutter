// This example demonstrates constructor inheritance and the use of super parameters in Dart

// Base class Animal with required properties
class Animal {
  // Constructor with named parameters marked as required
  Animal({required this.age, required this.name});

  // Final properties that can only be set once during object initialization
  final int age;
  final String name;
  
  // Method common to all animals
  void sleep() => print("$name is sleeping");
}

// Dog class that extends Animal
class Dog extends Animal {
  // Constructor for Dog that takes age and name
  // Uses traditional super() call to pass parameters to the parent class
  // ignore: use_super_parameters
  Dog({required int age, required String name}) : super(age: age, name: name);
  
  // Method specific to Dog
  void bark() => print("$name says: Woof!");
}

// Cow class that extends Animal
class Cow extends Animal {
  // Constructor using Dart's super parameter syntax (Dart 2.17+)
  // The 'super.' syntax directly forwards parameters to the parent class
  Cow({required super.age, required super.name});
  
  // Method specific to Cow
  void moo() => print("$name says: Moo!");
}

void main() {
  // Create a Dog instance using named parameters
  final dog = Dog(age: 10, name: "Buddy");
  
  // Create a Cow instance using named parameters with super parameter syntax
  final cow = Cow(age: 20, name: "Daisy");
  
  // Demonstrate accessing properties and methods
  print("Dog's age: ${dog.age} years");
  dog.sleep();    // Inherited from Animal
  dog.bark();     // Specific to Dog
  
  print("\nCow's age: ${cow.age} years");
  cow.sleep();    // Inherited from Animal
  cow.moo();      // Specific to Cow
}