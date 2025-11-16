void main() {
  const list = [1, 2, 3, 4, 5];

  // Using for loop
  print("Using for loop");
  for( var value in list){
    print(value);
  }

  // Using forEach
  // forEach is a method that takes a function as an argument
  
  print("Using forEach");
  list.forEach((value) => print(value));
}