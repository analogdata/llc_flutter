/// Extension on String class to add number parsing capabilities
/// 
/// Extensions in Dart allow you to add functionality to existing libraries
/// without modifying the original class. This is particularly useful for:
/// - Adding utility methods to core classes like String, int, List, etc.
/// - Making APIs more fluent and readable
/// - Adding functionality to classes from external packages
/// - When you can't modify the original class
///
/// Note: Extensions are resolved statically (at compile-time), not dynamically
/// at runtime. The extension methods are just syntactic sugar for static functions.
extension NumberParsing on String {
  /// Attempts to parse this string as an integer
  /// 
  /// Returns the integer value if the string can be parsed as an integer,
  /// or null if the string is not a valid integer representation.
  /// 
  /// Example:
  /// ```dart
  /// '123'.toIntOrNull()  // returns 123 (int)
  /// 'abc'.toIntOrNull()  // returns null
  /// '45.6'.toIntOrNull() // returns null (not an integer)
  /// ```
  int? toIntOrNull() => int.tryParse(this);
}

