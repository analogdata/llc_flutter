// Main function where we demonstrate the usage of the generic transform function
void main() {
  // A list of integers
  const list = [1, 2, 3, 4, 5];
  // A list of doubles
  const newDoubleList = [1.0, 2.0, 3.0, 4.0, 5.0];
  
  // Using transform to double each number in the list (1,2,3,4,5 -> 2,4,6,8,10)
  final newList = transform<int, int>(list, (x) => x * 2);
  
  // Using transform to square each number in the list (1,2,3,4,5 -> 1,4,9,16,25)
  final squaresList = transform<int, int>(list, (x) => x * x);
  
  // Using transform with double values to double each number
  final newDoubleListSquares = transform<double, double>(newDoubleList, (x) => x * 2);
  
  print(newList);          // Prints: [2, 4, 6, 8, 10]
  print(squaresList);      // Prints: [1, 4, 9, 16, 25]
  print(newDoubleListSquares); // Prints: [2.0, 4.0, 6.0, 8.0, 10.0]
}

/// A generic function that transforms each element in a list using the provided function
/// 
/// [T] - The type of elements in the input list
/// [R] - The type of elements in the output list
/// 
/// Parameters:
///   - list: The input list of type T
///   - func: A function that takes a T and returns an R
/// 
/// Returns: A new list of type R with transformed elements
List<R> transform<T, R>(List<T> list, R Function(T) func) {
  var result = <R>[];  // Create an empty list to store results of type R
  for (var value in list) {
    // Apply the transformation function to each element and add to result
    result.add(func(value));
  }
  return result;
}

// A non-generic version that specifically squares integers
// This is less flexible than the generic version above
List<int> squares(List<int> list) {
  var result = <int>[];
  for (var value in list) {
    result.add(value * 2);  // Note: This actually doubles, not squares!
  }
  return result;
}