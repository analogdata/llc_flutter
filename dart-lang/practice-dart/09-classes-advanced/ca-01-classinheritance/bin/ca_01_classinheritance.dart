// Class Inheritance
// Class Inheritance is a feature of object-oriented programming that allows a new class 
// to inherit properties and methods from an existing class.

// Base class representing a generic Animal
class Animal {
  // Method that all animals can do
  void sleep() => print("Sleep");
}

// Dog class that inherits from Animal
// Inherits sleep() method and adds bark() functionality
class Dog extends Animal {
  // Unique method for Dog class
  void bark() => print("Bark");
} 

// Cow class that inherits from Animal
// Inherits sleep() method and adds moo() functionality
class Cow extends Animal {
  // Unique method for Cow class
  void moo() => print("Moo");
}

// CleverDog class that inherits from Dog
// Inherits sleep() from Animal, bark() from Dog, and adds catchBall()
class CleverDog extends Dog {
  // Unique method for CleverDog class
  void catchBall() => print("Clever Dog can catch ball");
}

void main(){
  // Create an instance of Animal - can only call sleep()
  final animal = Animal();
  animal.sleep();

  // Create an instance of Dog - can call sleep() (inherited) and bark()
  final dog = Dog();
  dog.sleep();
  dog.bark();

  // Create an instance of Cow - can call sleep() (inherited) and moo()
  final cow = Cow();
  cow.sleep();
  cow.moo();

  // Create an instance of CleverDog - can call sleep() (from Animal), 
  // bark() (from Dog), and catchBall() (its own method)
  final cleverDog = CleverDog();
  cleverDog.sleep();
  cleverDog.bark();
  cleverDog.catchBall();
}