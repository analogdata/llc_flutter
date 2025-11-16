// Arrow Notation
// Arrow Notation is a feature in Dart that helps to write functions in a more concise way
// It is used to write functions in a single line. Works on both return and void functions

void main() {
  int result = add(1, 2);
  print(result);

  describePerson("Rajath", 21);
}

int add(int a, int b) => a + b;

void describePerson(String name, int age) => print("Name: $name, Age: $age");