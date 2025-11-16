void main() {

  // What is TypeCasting?
  // TypeCasting is the process of converting one data type to another data type

  // Conversion int to String
  int age = 32;
  String ageString = age.toString(); // toString() is a method that converts int to String

  print(ageString);

  // Conversion String to int
  String height = "5.9";
  double heightDouble = double.parse(height); // parse() is a method that converts String to double

  print(heightDouble);

  // Conversion int to double
  int ageInt = 32;
  double ageDouble = ageInt.toDouble(); // toDouble() is a method that converts int to double

  print(ageDouble);

  // Conversion double to int
  double heightInDouble = 5.9;
  int heightInt = heightInDouble.toInt(); // toInt() is a method that converts double to int

  print(heightInt);
}