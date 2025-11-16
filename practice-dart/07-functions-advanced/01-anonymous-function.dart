// Anonymous Function
// Anonymous Function in dart is a function without a name 
// Anonymous Function is also called as Lambda Function

// To create an anonymous function we can use the arrow function
// Arrow function is denoted by =>

// Anonymous Function can be called using the variable name
// Anonymous Function can be passed as an argument to another function or method as well
void main() {
  var sayHi = (String name) => 'Hi $name';
  String sayHello(String name) => 'Hello $name';

  print(sayHi('Rajath'));
  print(sayHello('Rajath'));
}