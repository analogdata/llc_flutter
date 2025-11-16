// CLOSURES IN DART
// A closure is a function that has access to its own scope, the outer function's variables, and global variables
// even after the outer function has finished executing.

void main() {
  // Example 1: Basic Closure
  // This variable is in the outer function's scope
  int number = 10;

  // This is a closure - it 'closes over' the 'number' variable
  void printNumber() {
    // Can access 'number' even though it's defined outside this function
    print('Closure accessing outer variable: $number');
  }

  // The closure still has access to 'number' even though we're calling it later
  printNumber();  // Outputs: Closure accessing outer variable: 10

  // Example 2: No Closure Here
  message(number);  // This is just a regular function call

  // Example 3: Closure with Collection Methods
  const multiplier = 2;  // This will be captured by the closure
  const newList = [1, 2, 3];
  
  // The anonymous function (x) => x * multiplier is a closure
  // It captures the 'multiplier' variable from the surrounding scope
  final result = newList.map((x) => x * multiplier);
  
  print('Result using closure with map: $result');  // Outputs: (2, 4, 6)
}

// This is a regular function, not a closure
// It only has access to its own parameters and global variables
void message(int number) {
  // 'number' here is a parameter, not the same as the one in main()
  print('Regular function called');
  print('Parameter value: $number');
}

/*
KEY POINTS ABOUT CLOSURES:
1. A closure gives you access to an outer function's scope from an inner function
2. The inner function maintains a reference to its outer scope
3. Closures are created every time a function is created, at function creation time
4. Common use cases:
   - Callback functions
   - Data privacy/encapsulation
   - Function factories
   - Event handlers
*/
