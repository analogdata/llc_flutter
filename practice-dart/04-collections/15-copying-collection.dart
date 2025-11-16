void main() {
  var numbers = [1, 2, 3, 4, 5];
  var copyNumbers = numbers;

  copyNumbers[0] = 10;

  print("Numbers: $numbers");
  print("Copy Numbers: $copyNumbers");

  final numbers2 = [...numbers];

  numbers2[0] = 100;

  print("Numbers: $numbers");
  print("Numbers2: $numbers2");
}