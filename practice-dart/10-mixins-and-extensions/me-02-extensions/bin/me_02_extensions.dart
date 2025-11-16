// Importing the custom extension library that contains the String extension methods
// This allows us to use the toIntOrNull() method on String objects
import 'package:me_02_extensions/me_02_extensions.dart';

/// Main function demonstrating the usage of the String extension method toIntOrNull()
void main() {
  // Example 1: Converting a valid numeric string to an integer
  // This will print: 123
  print('123'.toIntOrNull());  // Returns: 123 (as int)
  
  // Example 2: Converting a non-numeric string to an integer
  // This will print: null
  print('abc'.toIntOrNull());  // Returns: null (not a valid integer)
  
  // The toIntOrNull() method is a custom extension on the String class
  // that safely parses a string to an integer, returning null if the
  // string cannot be converted to a valid integer.
  
  // Note: This is different from int.parse() which would throw an exception
  // for invalid input. The extension method provides a null-safe alternative.
}