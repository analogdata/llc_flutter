// A generic Stack class that can work with any data type T
// The <T> syntax makes this a generic class where T is a type parameter
class Stack<T> {
  // Private list to store stack items
  // The underscore makes it private to the library
  final List<T> _items = [];

  // Method to add an item to the top of the stack
  // Takes a parameter of type T (the generic type)
  void push(T item) {
    _items.add(item);
  }

  // Method to remove and return the top item from the stack
  // Returns an item of type T
  // Throws an exception if the stack is empty
  T pop() {
    if (_items.isEmpty) {
      throw StateError('Stack is empty');
    }
    return _items.removeLast(); // LIFO (Last In, First Out) behavior
  }
}

void main() {
  // Create a stack that holds integers
  // The type parameter <int> specifies that this stack will only hold integers
  final stack = Stack<int>();
  
  // Push integers onto the stack
  stack.push(1);
  stack.push(2);
  stack.push(3);
  
  // Pop and print items (in reverse order of pushing)
  print(stack.pop()); // Output: 3 (last in, first out)
  print(stack.pop()); // Output: 2
  print(stack.pop()); // Output: 1

  // Create a stack that holds strings
  // The type parameter <String> specifies that this stack will only hold strings
  final names = Stack<String>();
  
  // Push strings onto the stack
  names.push("Rajath");
  names.push("Kumar");
  names.push("Analog Data");
  
  // Pop and print items (in reverse order of pushing)
  print(names.pop()); // Output: "Analog Data" (last in, first out)
  print(names.pop()); // Output: "Kumar"
  print(names.pop()); // Output: "Rajath"
}