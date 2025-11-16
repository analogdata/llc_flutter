// Enumerations
// Enumerations are used to define a set of named constants
enum Color {
  red,
  green,
  blue
}

void main() {
  Color color = Color.red;
  print(color);
  print(color.index);
  print(Color.values);
  print(Color.red.index);
  print(Color.green.index);
  print(Color.blue.index);

  int i = 9;
  print(i.runtimeType); // if you want to check the type of a variable

  print(color.runtimeType);

  switch (color) {
    case Color.red:
      print("Red");
      break;
    case Color.green:
      print("Green");
      break;
    case Color.blue:
      print("Blue");
      break;
  }
}