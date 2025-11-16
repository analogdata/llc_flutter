// Exercise: Sum of List of integers
void main () {
  var numbers = [1, 2, 3, 4, 5];

  var sum = 0;
  for(var number in numbers){
    sum += number;
  }
  print("Sum of List of Integers is $sum");
}