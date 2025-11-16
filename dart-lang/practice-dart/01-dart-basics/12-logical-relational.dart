void main () {

  // Relational Operators
  print(10 > 20);
  print(10 < 20);
  print(10 >= 20);
  print(10 <= 20);
  print(10 == 20);
  print(10 != 20);

  // Logical Operators

  // AND Operator
  print(true && true);
  print(true && false);

  // OR Operator
  print(false || true);
  print(false || false);

  // NOT Operator
  print(!true);
  print(!false);

  // Exercise
  print((10 > 20) && (10 < 20));
  print((10 > 20) || (10 < 20));
  print(!(10 > 20));


  // Simple Email Validator
  String email = "rajathkumarks@gmail.com";
  print(email.isNotEmpty && email.contains("@"));
}