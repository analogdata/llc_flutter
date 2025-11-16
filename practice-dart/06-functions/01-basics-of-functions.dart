// Function is a block of code that performs a specific task
// Functions should be defined before they are called
// Functions are used to reduce code duplication

// Function Syntax
// void function_name() {
//   // Function body
// }

// Function without parameters
void sayHi(){
  print("Hi");
}

// Function with parameters
void describePerson(String name, int age){
  print("Name: $name, Age: $age");
}

// Function with Return Value
// int is the return type of the function
// return is used to return a value from the function
// If we use void then we don't need to return a value from the function
int add(int a, int b){
  return a + b;
}

void main() {
  // Function call
  sayHi();

  // Function call with arguments
  describePerson("Rajath", 21);

  // Function call with return value and storing it in a variable
  int result = add(1, 2);
  print(result);
}