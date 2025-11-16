// Null Safety
// Null Safety is a feature in Dart that helps prevent null pointer exceptions by ensuring that variables are initialized before use.

// ? is used to make a variable nullable
// ?? is used to provide a default value if the variable is null

// Before Null Safety Error Occurs Only When We Run The Code at Runtime
// After Null Safety Error Occurs At Compile Time

// This feature is helpful in preventing null pointer exceptions by ensuring that variables are initialized before use.

// Flow Analysis
// Flow Analysis is a feature in Dart that helps prevent null pointer exceptions by ensuring that variables are initialized before use.

// Definite Assignment
// Definite Assignment is a feature in Dart that helps prevent null pointer exceptions by ensuring that variables are initialized before use.

// Safe way 1: Provide a default value if a is null
// Safe way 2: Check if a is not null before using
// Safe way 3: Using ?. and ?? operators together

void main() {
  int? a;  // This can be null
  int b = 10;  // This can't be null
  
  // Safe way 1: Provide a default value if a is null - using flow analysis
  print((a ?? 0) + b);
  
  // Safe way 2: Check if a is not null before using - using flow analysis
  if (a != null) {
    print(a + b);
  } else {
    print('a is null! Using 0 instead: ${0 + b}');
  }
  
  // Safe way 3: Using ?. and ?? operators together - using flow analysis
  print((a?.toDouble() ?? 0.0) + b);

  // Safe way 4: Using ??= operator - using defintive assignment
  a ??= 0;
  print(a + b);
}