void main() {
  const list = [1, 2, 3, 4, 5];

  // where returns a new list containing only the elements that satisfy the condition
  final even = list.where((x) => x % 2 == 0);
  print(even);

  // firstWhere returns the first element that satisfies the condition
  final firstEven = list.firstWhere((x) => x % 2 == 0);
  print(firstEven);
}