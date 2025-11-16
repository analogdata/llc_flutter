// In Dart, every class implicitly defines an interface containing all its instance members
// Abstract classes can be used to define interfaces explicitly

/// InterfaceA defines a contract that requires implementation of method a()
/// Any class that implements InterfaceA must provide an implementation of a()
abstract class InterfaceA {
  void a();
}

/// InterfaceB defines a contract that requires implementation of method b()
/// Any class that implements InterfaceB must provide an implementation of b()
abstract class InterfaceB {
  void b();
}

/// Class AB implements both InterfaceA and InterfaceB
/// This means AB must provide concrete implementations for all methods
/// defined in both interfaces
/// 
/// Key points about 'implements':
/// 1. Must implement ALL methods and getters/setters from all interfaces
/// 2. Can implement multiple interfaces (unlike 'extends' which is single inheritance)
/// 3. Doesn't inherit any implementation (unlike 'extends')
/// 4. Used for defining what a class can do (interface) rather than what it is (inheritance)
class AB implements InterfaceA, InterfaceB {
  @override
  void a() {
    print("Method from InterfaceA");
  }

  @override
  void b() {
    print("Method from InterfaceB");
  }
  
  // Can also add additional methods specific to AB
  void abSpecificMethod() {
    print("This method is specific to AB class");
  }
}

/// Example showing the difference between 'implements' and 'extends'
class ExtendedAB extends InterfaceA {
  @override
  void a() {
    print("Extended implementation of a()");
  }
  
  // With 'extends', we can add new methods
  void newMethod() {
    print("This is a new method in ExtendedAB");
  }
}

void main() {
  // Using the AB class that implements both interfaces
  final ab = AB();
  ab.a();  // Calls implementation from InterfaceA
  ab.b();  // Calls implementation from InterfaceB
  ab.abSpecificMethod();  // Calls AB's own method
  
  // Demonstrating interface type usage
  InterfaceA interfaceA = AB();
  interfaceA.a();  // Can only call methods from InterfaceA
  // interfaceA.b();  // This would cause a compile-time error
  
  // Showing the difference with 'extends'
  final extended = ExtendedAB();
  extended.a();
  extended.newMethod();
  
  // Real-world analogy:
  // - InterfaceA could be 'Flyable' with method 'fly()'
  // - InterfaceB could be 'Swimmable' with method 'swim()'
  // - A 'Duck' class could implement both Flyable and Swimmable
  // - A 'Plane' class might only implement Flyable
  // - A 'Fish' class might only implement Swimmable
}
