void main() {

  // final: The value of the variable cannot be changed but the elements of the list can be modified
  final cities = ["New York", "Los Angeles", "Chicago", "Houston", "Phoenix"];
  // cities = ["bangalore", "mumbai", "delhi", "chennai", "kolkata"]; // Error: The final variable 'cities' can only be set once.
  cities[1] = "San Francisco";
  print(cities);

  // const: The value of the variable cannot be changed and cannot be modified
  const numbers = [1, 2, 3, 4, 5];
  // numbers = [1, 2, 3, 4, 5]; // Error: Constant variables can't be assigned a value after initialization.
  // numbers[1] = 6; // Error: Constant variables can't be assigned a value after initialization.
  print(numbers);
}