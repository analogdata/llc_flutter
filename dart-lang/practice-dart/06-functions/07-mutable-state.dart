// Mutable State
// Mutable State is a state that can be changed, If a global variable is changed in a function, it will be changed in all the functions
// Mutable State is not a good practice, It can lead to unexpected behavior

// To avoid this we can use final or const

var counter = 0;
const bitsInByte = 8;

void foo() {
  counter++;
  print('*' * counter);
}

void main() {
  const kilobit = 1024 * bitsInByte;
  const megabit = 1024 * kilobit;
  foo();
  foo();
  foo();

  print(kilobit);
  print(megabit);
}