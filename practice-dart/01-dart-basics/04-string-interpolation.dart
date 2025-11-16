void main() {
  String name = "Rajath";
  int age = 32;
  double height = 5.9;

  // String Concatenation
  print("My Name is: " + name + " and I am " + age.toString() + " years old");
  print("My Height is: " + height.toString() + " feet");

  // String Interpolation
  print("My Name is: $name and I am $age years old");
  print("My Height is: $height feet");


  // String Interpolation with Expression
  // Expression is any valid Dart expression
  // {} is used to evaluate an expression after the $ sign
  print("My Name is: $name and I will be ${age + 1} years old by 2026");
  print("My Height is: ${height} feet");

  double temp = 36.6;
  print("${temp}C");


  int value = 4;
  print("The $value + $value is ${value + value}");

  String pizza = "Pepperoni";
  String pasta = "Spaghetti";

  print("I like $pizza and $pasta");
}