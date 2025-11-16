/// A class representing a divider with a positive integer value.
/// Uses assertion to ensure the value is always greater than zero.
class Divider {
  /// Creates a Divider with the given [value].
  ///
  /// Throws an [AssertionError] if [value] is not greater than 0.
  /// This helps catch programming errors during development.
  const Divider(this.value) : assert(value > 0, 'Value must be greater than 0');

  /// The positive integer value of this divider.
  final int value;
}

/// Attempts to sign in a user with the provided email and password.
///
/// Uses assertions to validate that neither email nor password is empty.
/// In production, assertions are ignored, so this is only for development-time checks.
///
/// Parameters:
///   - [email]: User's email address
///   - [password]: User's password
void signIn(String email, String password) {
  assert(email.isNotEmpty && password.isNotEmpty,
      'Email and password must not be empty');
  // In a real application, you would add authentication logic here
}

void main() {
  // Create a Divider with value 2 (valid)
  const denominator = Divider(2);
  print('Divider value: ${denominator.value}');

  // Attempt to sign in with valid credentials
  signIn('email@example.com', '123456');

  // Note: The following would cause an assertion error in debug mode:
  // const invalidDivider = Divider(0);  // Assertion error: Value must be greater than 0
  // signIn('', '');  // Assertion error: Email and password must not be empty
}
