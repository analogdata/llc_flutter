// Lexical Scope
// Lexical Scope means the scope of a variable is determined by its position in the code

// Global Scope
// Global Scope can be accessed from anywhere in the program

// Local Scope
// Local Scope can be accessed only inside the block

// Inner Function
// Inner Function is a function that is defined inside another function or block

const globalScopeVariable = 30; // Global Scope

void main() {
  int a = 10;
  print(a);
  if (a > 0){
    int b = 20; // Local Scope
    print(globalScopeVariable);
    print(b);
  }

  print(globalScopeVariable);
  // print(b); // This will throw an error

  void bar() { // Local Scope function / inner function
    print(globalScopeVariable);
    print(a);
  }

  bar(); // Local Scope function call / inner function call
}
