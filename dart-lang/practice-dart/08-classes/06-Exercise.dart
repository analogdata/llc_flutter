// A class representing a Person with name, age, and height
class Person {
  // Constructor with named parameters
  // 'required' means all parameters must be provided when creating a Person
  // 'this.name' directly assigns the parameter to the instance variable
  Person({required this.name, required this.age, required this.height});

  // Immutable properties (can't be changed after initialization)
  final String name;    // Stores the person's name
  final int age;        // Stores the person's age in years
  final double height;  // Stores the person's height in meters

  // Method to print basic details
  void printDetails() {
    // Prints name, age, and height in a simple format
    print('Name: $name, Age: $age, Height: ${height}m');
  }

  // Method to print a more descriptive sentence
  void printDescriptive() {
    // Prints a complete sentence describing the person
    print('This person is $name, $age years old, and $height meters tall.');
  }
}

void main() {
  // Create a new Person instance
  final person = Person(
    name: 'Rajath',  // Sets the name
    age: 32,         // Sets the age
    height: 1.75     // Sets the height in meters (fixed from 5.9 to 1.75m for accuracy)
  );
  
  // Call the methods to print information
  person.printDetails();      // Output: Name: Rajath, Age: 32, Height: 1.75
  person.printDescriptive();  // Output: This person is Rajath, 32 years old, and 1.75 meters tall.
}