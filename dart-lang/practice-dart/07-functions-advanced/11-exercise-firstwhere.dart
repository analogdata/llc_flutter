void main() {
  // Define a constant list of integers
  const list = [1, 2, 3, 4, 5];
  
  // Use our custom firstWhere function to find the first even number
  // The function returns the first element that satisfies the condition (x % 2 == 0)
  final firstEven = ourFirstWhere<int>(list, (x) => x % 2 == 0);
  print(firstEven);  // Output: 2 (the first even number in the list)
}

/// A generic function that finds and returns the first element in a list
/// that satisfies a given condition.
///
/// [T] - The type of elements in the list
///
/// Parameters:
///   - list: The list to search through
///   - func: A function that takes an element of type T and returns a boolean
///           Returns true if the element matches the condition
///
/// Returns: The first element that satisfies the condition
///
/// Throws:
///   - Exception with message 'Element not found' if no element satisfies the condition
T ourFirstWhere<T>(List<T> list, bool Function(T) func) {
  // Iterate through each element in the list
  for (var value in list) {
    // Check if the current element satisfies the condition
    if (func(value)) {
      // If condition is met, return the element immediately
      return value;
    }
  }
  
  // If we've gone through the entire list and found no matches, throw an exception
  // This is similar to how Dart's built-in firstWhere behaves with orElse not provided
  throw Exception('Element not found');
}