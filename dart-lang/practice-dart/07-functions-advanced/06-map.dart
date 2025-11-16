// MAP IN DART
// Map is a method that takes a function as an argument
// Map returns a new list
// Map does not modify the original list

void main() {
  const list = [1, 2, 3, 4, 5];
  final newList = list.map((value) => value * 2);
  print(newList);
}