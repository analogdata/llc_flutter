// Null Safety Type Inference
// Null Safety Type Inference is a feature in Dart that helps prevent null pointer exceptions by ensuring that variables are initialized before use.
// It is a feature that helps prevent null pointer exceptions by ensuring that variables are initialized before use.

void main () {
  const a = -1; // Here a will be int type because it is a const and it is initialized with an int value
  var b; // Here b will be dynamic type because it is not initialized with any value

  if (a > 0){
    b = a;
  }

  // If b is null, assign "Hello" to it
  b ??= "Hello";

  final value = b; // Here value will be dynamic type because b is dynamic
  print(value);
}