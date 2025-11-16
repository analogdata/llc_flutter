// Abstract class with one abstract method and one concrete method
abstract class Animal {
  // Abstract method - must be implemented by subclasses
  void makeSound();

  // Concrete method with default implementation
  void sleep() => print("Sleep");
}

// Dog uses 'extends' to inherit from Animal
// Key points about 'extends':
// 1. Inherits all methods and properties from Animal
// 2. Only needs to implement abstract methods (makeSound)
// 3. Gets the concrete sleep() method for free
class Dog extends Animal {
  @override
  void makeSound() => print("Bark");
  // sleep() is inherited from Animal
}

// Cow uses 'implements' to implement Animal interface
// Key points about 'implements':
// 1. Must implement ALL methods from Animal, including concrete ones
// 2. Doesn't inherit any implementation
// 3. Can implement multiple interfaces
class Cow implements Animal {
  @override
  void makeSound() => print("Moo");

  @override
  void sleep() => print("Cow Sleep");  // Must be implemented even though it had a default
}

void main() {
  // Dog example with 'extends'
  final dog = Dog();
  dog.makeSound();  // Uses Dog's implementation
  dog.sleep();      // Uses inherited implementation from Animal

  // Cow example with 'implements'
  final cow = Cow();
  cow.makeSound();  // Uses Cow's implementation
  cow.sleep();      // Uses Cow's own implementation
  
  /*
  Key Differences:
  1. 'extends' (Inheritance):
     - Single inheritance only
     - Gets all parent class implementations
     - Use for "is-a" relationships (Dog is an Animal)
     
  2. 'implements' (Interface Implementation):
     - Can implement multiple interfaces
     - Must provide all implementations
     - Use for "can-do" relationships (Cow can behave like an Animal)
  */
}

