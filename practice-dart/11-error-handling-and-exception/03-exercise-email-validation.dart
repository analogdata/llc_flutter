/// Custom exception for invalid email format
class InvalidEmailException implements Exception {
  final String message;
  InvalidEmailException(this.message);

  @override
  String toString() => 'InvalidEmailException: $message';
}

class EmailAddress {
  final String email;

  /// Creates an EmailAddress with validation
  ///
  /// Throws [InvalidEmailException] if email format is invalid
  EmailAddress(this.email) {
    if (!_isValidEmail(email)) {
      throw InvalidEmailException('Invalid email format: $email');
    }
  }

  /// Validates email format using a simple regex
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
      caseSensitive: false,
    );
    return emailRegex.hasMatch(email);
  }

  @override
  String toString() => email;
}

void main() {
  // Example 1: Valid email
  try {
    final email = EmailAddress('user@example.com');
    print('Valid email created: $email');
  } catch (e) {
    print('Error: $e');
  }

  // Example 2: Invalid email
  try {
    final email = EmailAddress('invalid-email');
    print('Valid email created: $email');
  } on InvalidEmailException catch (e) {
    print('Invalid email error: $e');
  } catch (e) {
    print('Unexpected error: $e');
  }

  // Example 3: Email validation function
  validateAndPrintEmail('test@domain.com'); // Valid
  validateAndPrintEmail('missing-at.com'); // Invalid
  validateAndPrintEmail('user@.com'); // Invalid
  validateAndPrintEmail('@domain.com'); // Invalid
}

/// Helper function to validate and print email status
void validateAndPrintEmail(String email) {
  try {
    final emailAddress = EmailAddress(email);
    print(emailAddress);
    print('✅ "$email" is a valid email address');
  } on InvalidEmailException {
    print('❌ "$email" is NOT a valid email address');
  } catch (e) {
    print('⚠️ Unexpected error with "$email": $e');
  }
}
