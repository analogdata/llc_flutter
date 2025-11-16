/// This is a documentation comment (starts with ///)
/// It's used to document libraries, classes, and their members.
/// These comments support markdown formatting.

/*
  This is a multi-line comment.
  It can span multiple lines and is useful for longer explanations
  or for commenting out blocks of code.
*/

void main() {
  // This is a single-line comment
  print("Hello World");
  
  // TODO: Add user authentication logic here
  // This is a TODO comment that marks code that needs to be implemented
  // It's a good practice to include context about what needs to be done
  
  /*
    print('This is a commented out code block');
    print('It won\'t be executed');
    - This is a multi-line comment
    - It can span multiple lines and is useful for longer explanations
    or for commenting out blocks of code.
    - [] is used to document parameters
    - [return] is used to document return values
    - [TODO] is used to mark code that needs to be implemented
  */
  
  // Documentation comment for a function
  /// Calculates the sum of two numbers
  /// [a] - first number
  /// [b] - second number
  /// Returns the sum of a and b
  int add(int a, int b) {
    return a + b;
  }
  
  // Using the add function
  print('Sum of 5 and 3 is: ${add(5, 3)}');
}