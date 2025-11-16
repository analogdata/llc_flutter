// A class representing user credentials with username and password
class Credential {
  // Constructor with default empty values for both fields
  // Using const constructor for better performance (compile-time constants)
  const Credential({this.username = " ", this.password = " "});

  // Final fields make the class immutable
  final String username;  // Stores the username
  final String password;  // Stores the password

  // The copyWith method creates a new Credential instance with updated fields
  // It uses named parameters with null safety
  Credential copyWith({
    String? username,  // Optional: new username (null means keep current)
    String? password,  // Optional: new password (null means keep current)
  }) {
    // Returns a new Credential instance:
    // - Uses the new value if provided (left of ??)
    // - Falls back to current value if null (right of ??)
    return Credential(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}

void main() {
  // Create initial credential with default values
  final credential = Credential();
  print(credential.username);  // Output: " " (space)
  print(credential.password);  // Output: " " (space)

  // Create a new credential with updated username
  // Keeps the original password
  final credential2 = credential.copyWith(username: "Rajath");
  print(credential2.username);  // Output: "Rajath"
  print(credential2.password);  // Output: " " (original password)

  // Create another credential with updated password
  // Keeps the username from credential2
  final credential3 = credential2.copyWith(password: "123456");
  print(credential3.username);  // Output: "Rajath" (from credential2)
  print(credential3.password);  // Output: "123456"
}


// Key Concepts Explained:

// 1. Immutability:

// - The class uses final fields, making instances immutable after creation
// - This is a core principle in functional programming and state management

// 2. copyWith Pattern:
// - Creates a new instance with the same values as the original
// - Only updates the fields you specify
// - Returns a new instance rather than modifying the existing one

// 3. Null-Aware Operators:
// - ?? is the null-coalescing operator
// - a ?? b means "use a if it's not null, otherwise use b"
// - This allows partial updates while keeping other fields the same

// 4. Default Values:
// - The constructor provides default empty strings for both fields
// - This makes the class more convenient to use

// 5. Benefits:
// - Immutability: Prevents accidental state changes
// - Predictability: Easier to reason about the code
// - Thread Safety: Safe to use in concurrent environments
// - Change Tracking: Makes it easy to track what changed between states

// 6. Common Use Cases:
// - State management in Flutter (especially with packages like provider or bloc)
// - Data classes that need to be updated immutably
// - Functional programming patterns