/// Custom exception for invalid fraction operations
class FractionException implements Exception {
  final String message;
  FractionException(this.message);

  @override
  String toString() => 'FractionException: $message';
}

/// A class representing a mathematical fraction with numerator and denominator
class Fraction {
  final int numerator;
  final int denominator;

  /// Creates a new Fraction with the given numerator and denominator
  ///
  /// Throws [FractionException] if denominator is zero
  Fraction(this.numerator, this.denominator) {
    if (denominator == 0) {
      throw FractionException('Denominator cannot be zero');
    }
  }

  /// Returns the decimal value of the fraction
  double toDouble() => numerator / denominator;

  /// Returns a new Fraction that is the result of dividing this fraction by another
  ///
  /// Throws [FractionException] if the divisor is zero
  Fraction divideBy(Fraction other) {
    if (other.numerator == 0) {
      throw FractionException('Cannot divide by zero fraction');
    }
    return Fraction(
      numerator * other.denominator,
      denominator * other.numerator,
    );
  }

  @override
  String toString() => '$numerator/$denominator';
}

void main() {
  // Example 1: Basic try-catch
  try {
    final fraction = Fraction(1, 0); // This will throw an exception
    print('Created fraction: $fraction');
  } catch (e) {
    print('Error creating fraction: $e');
  }

  // Example 2: Multiple catch blocks
  try {
    final a = Fraction(1, 2);
    final b = Fraction(0, 1);
    final result = a.divideBy(b); // This will throw an exception
    print('Division result: $result');
  } on FractionException catch (e) {
    print('Fraction error: ${e.message}');
  } on Exception catch (e) {
    print('General error: $e');
  } catch (e) {
    print('Unexpected error: $e');
  } finally {
    print('This will always run, regardless of exceptions');
  }

  // Example 3: Rethrowing exceptions
  try {
    processFraction('3/0');
  } catch (e) {
    print('Caught rethrown exception: $e');
  }

  // Example 4: Using finally for cleanup
  final file = 'temp.txt';
  try {
    // Simulate file operations
    print('Writing to $file');
    if (file.contains('temp')) {
      throw Exception('Simulated file write error');
    }
  } catch (e) {
    print('File operation failed: $e');
  } finally {
    // This will always run, making it good for cleanup
    print('Cleaning up resources for $file');
  }
}

/// Helper function demonstrating rethrow
///
/// What is Rethrow?
/// -----------------
/// Imagine you're a manager at a restaurant:
/// 1. A customer complains (an exception occurs)
/// 2. You (the function) try to handle it yourself (catch block)
/// 3. But sometimes, the issue is too big for you to handle alone
/// 4. So you tell your boss (the caller function) about it (rethrow)
///
/// Key Points:
/// - Rethrow lets you do some local handling (like logging)
/// - But still lets the caller know something went wrong
/// - It's like saying "I tried to handle this, but you should know about it too"
/// - The original error details are preserved
void processFraction(String fractionStr) {
  try {
    final parts = fractionStr.split('/');
    if (parts.length != 2) {
      throw FormatException('Invalid fraction format');
    }

    final numerator = int.parse(parts[0]);
    final denominator = int.parse(parts[1]);

    final fraction = Fraction(numerator, denominator);
    print('Processed fraction: $fraction');
  } on FormatException {
    print('Invalid format. Please use "numerator/denominator"');
    rethrow; // Rethrow to be handled by the caller
  } on FractionException catch (e) {
    print('Invalid fraction: ${e.message}');
    rethrow; // Rethrow to be handled by the caller
  }
}
