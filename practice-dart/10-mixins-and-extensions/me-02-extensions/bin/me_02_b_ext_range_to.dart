/// Extension on the built-in [int] type to add range functionality.
/// 
/// This extension adds a [rangeTo] method that generates a list of integers
/// from the current integer (inclusive) to the specified end value (inclusive).
extension RangeTo on int {
  /// Generates a list of integers from [this] to [end] (inclusive).
  /// 
  /// If [end] is less than the current number, returns an empty list.
  /// 
  /// Example:
  /// ```dart
  /// 1.rangeTo(3)  // Returns [1, 2, 3]
  /// 5.rangeTo(7)  // Returns [5, 6, 7]
  /// 10.rangeTo(5) // Returns [] (empty list)
  /// ```
  List<int> rangeTo(int end) {
    // Handle case where end is less than the starting number
    if (end < this) {
      return [];
    }

    // Initialize the list with the starting number
    var list = [this];
    
    // Add subsequent numbers up to and including 'end'
    for (var i = this + 1; i <= end; i++) {
      list.add(i);
    }
    return list;
  }

  /// Alternative implementation using List.generate for more concise code
  /// 
  /// This version is more concise but slightly less readable for beginners.
  /// It's included here for educational purposes.
  List<int> rangeToAlternative(int end) {
    if (end < this) return [];
    return List.generate(end - this + 1, (i) => this + i);
  }
}

void main() {
  print('Basic range example:');
  // Using the rangeTo method to generate numbers from 1 to 10
  for (int i in 1.rangeTo(10)) {
    print(i);  // Prints numbers 1 through 10
  }
  
  print('\nEdge cases:');
  // Edge case: end < start
  print(5.rangeTo(2));  // Prints: []
  
  // Single number range
  print(7.rangeTo(7));  // Prints: [7]
  
  // Negative numbers work too
  print((-2).rangeTo(2));  // Prints: [-2, -1, 0, 1, 2]
  
  // Example of the alternative implementation
  print('\nUsing alternative implementation:');
  print(3.rangeToAlternative(6));  // Prints: [3, 4, 5, 6]
  
  // Real-world use case: Iterating over a range of indices
  print('\nProcessing items in a range:');
  final items = ['a', 'b', 'c', 'd', 'e'];
  for (var i in 1.rangeTo(3)) {
    print('Item at index $i: ${items[i]}');
  }
}

/* 
Output of this program:

Basic range example:
1
2
3
4
5
6
7
8
9
10

Edge cases:
[]
[7]
[-2, -1, 0, 1, 2]

Using alternative implementation:
[3, 4, 5, 6]

Processing items in a range:
Item at index 1: b
Item at index 2: c
Item at index 3: d
*/

// Note: This is similar to Kotlin's range operator (1..10) but implemented
// as an extension method. In Dart, you can also use the built-in
// List.generate() or the collection package's range() function for similar
// functionality, but this extension provides a more fluent API.

// For more advanced range operations, consider using the `collection` package:
// import 'package:collection/collection.dart';
// range(1, 10).toList();  // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
