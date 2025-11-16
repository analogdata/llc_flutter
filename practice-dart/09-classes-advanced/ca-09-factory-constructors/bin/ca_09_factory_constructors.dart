abstract class Vehicle {
  void drive();
}

// Car is a type of Vehicle
class Car implements Vehicle {
  @override
  void drive() => print("Car can be drive");
}

class Bike implements Vehicle {
  @override
  void drive() => print("Bike can be ride");
}

// Factory constructor to create instances of Vehicle
class VehicleFactory {
  Vehicle createVehicle(String type) {
    if (type == "car") {
      return Car();
    } else if (type == "bike") {
      return Bike();
    } else {
      throw ArgumentError("Invalid vehicle type");
    }
  }
}

void main() {
  final factory = VehicleFactory();
  
  // Using factory constructor to create instances
  final car = factory.createVehicle("car");
  final bike = factory.createVehicle("bike");

  print("car: ${car.runtimeType} Type");
  print("bike: ${bike.runtimeType} Type");
  
  car.drive();  // Output: Car can be drive
  bike.drive(); // Output: Bike can be ride
}