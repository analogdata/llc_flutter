// A simple Car class with two methods
class Car {
  // Method to start the car
  void start() => print("Car started");
  
  // Method to stop the car
  void stop() => print("Car stopped");
}

void main() {
  // Create a Car instance
  final car = Car();
  
  // Using the cascade operator (..) to call multiple methods on the same object
  // The cascade operator returns the original object, not the result of the method
  car
    ..start()  // Prints "Car started"
    ..stop();  // Prints "Car stopped"
  
  // Without cascade operator, you'd need to write:
  // car.start();
  // car.stop();
}