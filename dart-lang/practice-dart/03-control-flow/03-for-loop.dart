void main() {
  // Looping over a range
  // For Loop Consists of 3 Parts,
  // 1. Initialization
  // 2. Condition
  // 3. Increment/Decrement
  for (int i = 0; i <= 5; i++) {
    print(i);
  }
  print("Done");

  // Looping over a range
  for (int j = 0; j <= 5; j++) {
    print('🚀' * j);
  }

  // Looping over a list or Collection
  for ( var i in [1, 2, 3, 4, 5]){
    print(i);
  }

  // Looping over a collection of mixed types
  for ( var j in ['a', 9, true, null, '🔥']){
    print(j);
  }

  // Exercise: Fizz Buzz
  // Write a program that prints that implements the FizzBuzz logic
  // For multiples of 3 print "Fizz"
  // For multiples of 5 print "Buzz"
  // For multiples of both 3 and 5 print "FizzBuzz"
  // For all other numbers print the number itself

  for (int i = 1; i <= 15; i++) {
    if (i % 3 == 0 && i % 5 == 0) {
      print("FizzBuzz");
    } else if (i % 3 == 0) {
      print("Fizz");
    } else if (i % 5 == 0) {
      print("Buzz");
    } else {
      print(i);
    }
  }
}