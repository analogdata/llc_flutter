// A class representing a User with name and age
class User {
  // Constructor with required named parameters
  User({required this.name, required this.age});

  // Final fields (immutable after construction)
  final String name;  // Stores user's name
  final int age;      // Stores user's age

  // Factory constructor to create a User from JSON data
  // This is a common pattern for JSON deserialization
  factory User.fromJson(Map<String, Object> json) {
    // Extract values from JSON map
    final name = json['name'];  // Get name from JSON
    final age = json['age'];    // Get age from JSON

    // Type checking to ensure data integrity
    if (name is String && age is int) {
      // If types are correct, create and return a new User
      return User(
        name: name,
        age: age,
      );
    }
    // Throw error if JSON format is invalid
    throw StateError("Invalid JSON format");
  }

  // Method to convert User object back to JSON format
  // This is the inverse of fromJson
  Map<String, Object> toJson() {
    return {
      'name': name,  // Include name in JSON
      'age': age,    // Include age in JSON
    };
  }
}

void main() {
  // Example: Create a User from JSON data
  final person = User.fromJson({
    "name": "Rajath",  // JSON data for name
    "age": 32          // JSON data for age
  });
  
  // Print user details
  print(person.name);  // Output: Rajath
  print(person.age);   // Output: 32

  // Convert User object back to JSON
  final json = person.toJson();
  print(json);  // Output: {name: Rajath, age: 32}
}