void main() {
  // Create a constant list of integers
  const list = [1, 2, 3, 4, 5];
  
  // Use our custom where function to filter even numbers
  // The function takes a list and a condition, returns elements that satisfy it
  final even = ourWhere<int>(list, (x) => x % 2 == 0);
  print(even);  // Output: [2, 4]
}

/// A generic implementation of the where function that filters elements in a list
/// based on a given condition.
///
/// [T] - The type of elements in the list
/// 
/// Parameters:
///   - list: The input list of type T to be filtered
///   - func: A function that takes an element of type T and returns a boolean
///           Returns true if the element should be included in the result
///
/// Returns: A new list containing only the elements that satisfy the condition
List<T> ourWhere<T>(List<T> list, bool Function(T) func) {
  // Create an empty list to store the filtered results
  var result = <T>[];
  
  // Iterate through each element in the input list
  for (var value in list) {
    // Check if the current element satisfies the condition
    if (func(value)) {
      // If condition is true, add the element to the result list
      result.add(value);
    } 
  }
  // Return the filtered list
  return result;
}