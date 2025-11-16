// ITERABLES IN DART
// Iterable is a collection of objects
// Iterable is an interface that is implemented by all collections in Dart
// Iterable is a lazy collection
// Lazy collection means it is not evaluated until it is needed

void main() {
  const list = [1, 2, 3, 4, 5];
  final List<int> squares = list.map((x) => x * x).toList(); 
  print(squares);
}