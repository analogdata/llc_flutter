// The typedef creates an alias for this function type, making it easier to read and reuse:

// Syntax
// typedef Greet = String Function(String);
// typedef String Greet(String name);

// Here typedef is used to define a type
// Greet is the name of the type

typedef Greet = String Function(String);

// String Function(String)
// │       │         │
// │       │         └── Takes a String parameter
// │       └── Returns a String
// └── This is the return type of the function

String sayHi(String name) => 'Hi $name';

// Function Implementation (The "actual function")
// String sayHi(String name) => 'Hi $name';
// │      │     │        │       └── Function body (implicit return)
// │      │     │        └── Parameter name
// │      │     └── Parameter type (String)
// │      └── Function name
// └── Return type (String)

String SayBonjour(String name) => 'Bonjour $name';

String SayHola(String name) => 'Hola $name';

String SayNamaste(String name) => 'Namaste $name';

void main() {
  welcome(SayNamaste, 'Rajath');
}

void welcome(Greet greet, String name){
  print(greet(name));
}


