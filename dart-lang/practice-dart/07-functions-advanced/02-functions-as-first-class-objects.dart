void main() {
  var sayHi = (String name) => 'Hi $name';
  welcome(sayHi, 'Rajath');
}

// Function as First Class Object
// Function as First Class Object means we can pass a function as an argument to another function or method
// Function as First Class Object is also called as Higher Order Function
// Higher Order Function is a function that takes another function as an argument or returns a function

// Syntax
// void welcome(String Function(String) greet, String name){
//   print(greet(name));
// }

// Here String Function(String) greet is a higher order function
// greet is a function that takes a string as an argument and returns a string
// name is a string
// greet(name) is a function call
// greet(name) is passed as an argument to the welcome function

// welcome Function Definition
// void welcome(String Function(String) greet, String name)
// │    │      │               │              │     └── Parameter name (String)
// │    │      │               │              └── Parameter type (String)
// │    │      │               └── Parameter name for the function
// │    │      └── Type: A function that takes String and returns String
// │    └── Function name
// └── Return type (void - returns nothing)

void welcome(String Function(String) greet, String name){
  print(greet(name));
}