// Assertion Operator
// ! is used to assert that the value is not null 

// If the value is null, it will throw an error
// It is used to tell the compiler that the value is not null

// Here in Below Example y is nullable but we are sure that y is not null
// So we use ! to assert that the value is not null
void main() {
  int x = 10;
  int? y;

  // Here we are sure that y is not null
  if (x > 0){
    y = x;
  }

  // ! is used to assert that the value is not null
  // But it is not a safe way to use it, Because if x is -1 then y will be null
  // And it will throw an error in this case

  // Use it only when you are sure that the value is not null
  int value = y!; 
  print(value);
}