/// A mixin that provides basic living being functionality
/// Mixins are a way of reusing code in multiple class hierarchies
mixin anyLivingBeing {
  /// Method that simulates breathing action
  void breathe() => print("Breath");
}

/// A regular class that provides swimming functionality
class Swimming {
  /// Method that simulates swimming action
  void swim() => print("Swim");
}

/// Base class for all animals
class Animal {
  /// Method that simulates walking action
  void walk() => print("Walk");
}

/// Human class that extends Animal and uses anyLivingBeing mixin
/// - Inherits walk() from Animal
/// - Gets breathe() from anyLivingBeing mixin
class Human extends Animal with anyLivingBeing {
  // No additional implementation needed as it inherits all required behavior
}

/// Fish class that extends Swimming and uses anyLivingBeing mixin
/// - Inherits swim() from Swimming
/// - Gets breathe() from anyLivingBeing mixin
class Fish extends Swimming with anyLivingBeing {
  // No additional implementation needed as it inherits all required behavior
}

void main() {
  // Create a Human instance and demonstrate its capabilities
  print('Human:');
  final human = Human();
  human.walk();    // From Animal class
  human.breathe(); // From anyLivingBeing mixin

  // Create a Fish instance and demonstrate its capabilities
  print('\nFish:');
  final fish = Fish();
  fish.swim();     // From Swimming class
  fish.breathe();  // From anyLivingBeing mixin
  
  /*
  Key Concepts Demonstrated:
  1. Mixins (with keyword): Allow code reuse across multiple class hierarchies
  2. Single Inheritance: A class can only extend one class (Animal or Swimming)
  3. Multiple Mixins: A class can use multiple mixins (comma-separated after 'with')
  4. Method Resolution: When methods conflict, the last mixin's method takes precedence
  */

  // final plant = anyLivingBeing(); // Mixins can't be instantiated
  final Duck = Swimming();
  Duck.swim();
}



