// Named Arguments
// Named arguments are arguments that are passed to a function by name
// It is used to make the code more readable

// Positional Arguments
// Positional arguments are arguments that are passed to a function by position
// In dart { } is used to define named arguments

// Here name is optional, age is required and city is optional with default value "Bangalore"
// required is used to make the argument required
// city = "Bangalore" is used to provide a default value

// ? is a nullable operator we can't define a function without nullable operator
// If we don't provide a value for the argument then it will be null

String describePerson({String? name, required int age, String city = "Bangalore"}) {
  return "Name: $name, Age: $age, City: $city";
}

void foo(int a, int b, {int? c, int? d}) {
  print("a: $a, b: $b, c: $c, d: $d");
}

void main() {
  print(describePerson(name: "Rajath", age: 32));
  foo(1, 2,);
}


