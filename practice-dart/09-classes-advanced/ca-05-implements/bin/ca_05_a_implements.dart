// This example demonstrates the concept of multiple interface implementation in Dart
// using the 'implements' keyword to achieve multiple inheritance of types

/// Swim interface defines the ability to swim
/// Any class implementing Swim must provide a swim() method
abstract class Swim {
  void swim();
}

/// Walk interface defines the ability to walk
/// Any class implementing Walk must provide a walk() method
abstract class Walk {
  void walk();
}

/// Fly interface defines the ability to fly
/// Any class implementing Fly must provide a fly() method
abstract class Fly {
  void fly();
}

/// Duck class demonstrates multiple interface implementation
/// A duck can swim, walk, and fly, so it implements all three interfaces
/// 
/// Key Points:
/// 1. Can implement multiple interfaces (unlike single inheritance with 'extends')
/// 2. Must provide concrete implementations for ALL methods from ALL interfaces
/// 3. Can add additional methods and properties specific to Duck
class Duck implements Swim, Walk, Fly {
  @override
  void fly() {
    print("Duck can fly");
  }

  @override
  void swim() {
    print("Duck can swim");
  }

  @override
  void walk() {
    print("Duck can walk");
  }
  
  // Additional method specific to Duck
  void quack() {
    print("Quack! Quack!");
  }
}

/// Tortoise class implements both Walk and Swim interfaces
/// Demonstrates that not all animals need to implement all possible interfaces
class Tortoise implements Walk, Swim {
  @override
  void swim() {
    print("Tortoise can swim");
  }

  @override
  void walk() {
    print("Tortoise can walk");
  }
  
  // Additional method specific to Tortoise
  void hideInShell() {
    print("Tortoise hides in its shell");
  }
}

/// Fish class implements only the Swim interface
/// Demonstrates implementing a single interface
class Fish implements Swim {
  @override
  void swim() {
    print("Fish can swim");
  }
  
  // Additional method specific to Fish
  void blowBubbles() {
    print("Fish is blowing bubbles");
  }
}

void main() {
  // Create instances of each animal
  final duck = Duck();
  final tortoise = Tortoise();
  final fish = Fish();

  // Demonstrate Duck's capabilities
  print('=== Duck ===');
  duck.fly();
  duck.swim();
  duck.walk();
  duck.quack();

  // Demonstrate Tortoise's capabilities
  print('\n=== Tortoise ===');
  tortoise.swim();
  tortoise.walk();
  tortoise.hideInShell();

  // Demonstrate Fish's capabilities
  print('\n=== Fish ===');
  fish.swim();
  fish.blowBubbles();
  
  // Polymorphism in action - treating different types as their common interface
  print('\n=== Treating all as Swimmers ===');
  final swimmers = <Swim>[duck, tortoise, fish];
  for (var swimmer in swimmers) {
    swimmer.swim();
    // swimmer.walk();  // This would cause a compile-time error
  }
  
  // Real-world benefits:
  // 1. Defines clear contracts (what an object can do)
  // 2. Enables polymorphism
  // 3. Allows for flexible and maintainable code
  // 4. Makes it easy to add new behaviors by creating new interfaces
}
