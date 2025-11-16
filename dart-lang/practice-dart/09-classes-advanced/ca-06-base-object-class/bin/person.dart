/// A class representing a Person with name and age properties.
/// 
/// This class demonstrates the use of Object class methods in Dart,
/// specifically the [toString()](cci:1://file:///Users/rajathkumar/llc-flutter/dart-lang/practice-dart/09-classes-advanced/ca-06-base-object-class/bin/point.dart:7:2-7:56) method that's inherited from the Object class.
class Person {
  /// Creates a new Person instance with the given [name] and [age].
  ///
  /// The constructor is marked as `const` for compile-time constants.
  const Person(this.name, this.age);

  /// The name of the person.
  final String name;

  /// The age of the person.
  final int age;

  /// Returns a string representation of the Person object.
  ///
  /// This overrides the default [toString()](cci:1://file:///Users/rajathkumar/llc-flutter/dart-lang/practice-dart/09-classes-advanced/ca-06-base-object-class/bin/point.dart:7:2-7:56) method from the Object class.
  /// Without this override, `print(person)` would output: Instance of 'Person'
  ///
  /// Returns a string in the format: 'Person(name: [name], age: [age])'
  @override
  String toString() => 'Person(name: $name, age: $age)';
}

/// The main function that demonstrates the Person class usage.
void main() {
  // Create a constant Person instance
  const person = Person("Rajath", 22);
  
  // This will print the custom string representation defined in toString()
  // Without the toString() override, it would print: Instance of 'Person'
  print(person);
}