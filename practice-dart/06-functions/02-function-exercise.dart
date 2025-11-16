// Function Exercise
// Create a function that takes a list of integers as a parameter and returns the sum of the numbers in the list
// Use for loop to iterate through the list


double sum(List<int> numbers){
  double total = 0;
  for (int number in numbers){
    total += number;
  }
  return total;
}

void main() {
  print(sum([1, 2, 3]));
}
