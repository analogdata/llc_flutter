/// A generic extension on Iterable that adds a sum() method
/// to any iterable of numbers (int or double).
///
/// The generic type parameter T is constrained to num (which includes both int and double).
/// This means the extension will work with both List<int> and List<double>.
extension IterableX<T extends num> on Iterable<T> {
  /// Calculates the sum of all elements in the iterable.
  /// 
  /// Uses the reduce method to accumulate values, starting from the first element.
  /// The result is cast back to type T to maintain the original number type.
  T sum() => reduce((value, element) => (value + element) as T);
}

/// Note about Mixins:
/// While this example shows an extension, it's worth noting the difference between
/// extensions and mixins:
/// - Extensions (like this one) add functionality to existing classes without
///   modifying the original class or creating a new type.
/// - Mixins, on the other hand, are a way of reusing a class's code in multiple
///   class hierarchies, allowing for code reuse across different class trees.
///
/// Example of a similar functionality using a mixin (for comparison):
/// ```dart
/// mixin SumMixin<T extends num> {
///   T sum(Iterable<T> items) => items.reduce((a, b) => (a + b) as T);
/// }
/// 
/// class NumberUtils with SumMixin<int> {}
/// 
/// void example() {
///   final utils = NumberUtils();
///   print(utils.sum([1, 2, 3]));  // Uses mixin's sum method
/// }
/// ```

void main() {
  // Example with List<int>
  int sum = [1, 2, 3].sum();  // Returns 6 (int)
  
  // Example with List<double>
  double sum2 = [1.1, 2.2, 3.3].sum();  // Returns 6.6 (double)
  
  print('Sum of integers: $sum');
  print('Sum of doubles: $sum2');
  
  // The extension works with any Iterable<num>, including:
  // - List literal: [1, 2, 3]
  // - Set literal: {1, 2, 3}
  // - Iterable from methods: [1, 2, 3].where((x) => x > 1)
  
  // Type safety is maintained - this would cause a compile-time error:
  // var invalid = ['a', 'b', 'c'].sum(); // Error: 'String' doesn't extend 'num'
}

// Dart has a Package called dartx for many of the Readily usable Extensions
// https://pub.dev/packages/dartx