// A class to represent temperature with Celsius and Fahrenheit support
class Temperature {
  // Named constructor that takes temperature in Celsius
  // Example: Temperature.celsius(25) creates a temperature of 25°C
  Temperature.celsius(this.celsius);
  
  // Named constructor that takes temperature in Fahrenheit and converts to Celsius
  // The conversion formula is: (F - 32) * 5/9
  // The initialization list (after :) is used to convert Fahrenheit to Celsius
  Temperature.fahrenheit(double fahrenheit) : celsius = (fahrenheit - 32) * 5 / 9;
  
  // Stores the temperature in Celsius internally
  // This is the single source of truth for the temperature value
  double celsius;

  // Method to print the temperature in Celsius
  void printDetails() {
    // Using string interpolation to include the celsius value in the output
    print('Temperature: ${celsius.toStringAsFixed(1)}°C');
    
    // Example of additional functionality that could be added:
    // print('Fahrenheit: ${(celsius * 9/5) + 32}°F');
  }
}

void main() {
  // Create a temperature using the celsius constructor
  final roomTemp = Temperature.celsius(25);
  print('Room temperature:');
  roomTemp.printDetails();
  
  // Create a temperature using the fahrenheit constructor
  final bodyTemp = Temperature.fahrenheit(98.6);
  print('\nNormal body temperature:');
  bodyTemp.printDetails();
  
  // Demonstrate that both temperatures are stored in Celsius internally
  print('\nTemperature values in Celsius:');
  print('Room temp: ${roomTemp.celsius.toStringAsFixed(1)}°C');
  print('Body temp: ${bodyTemp.celsius.toStringAsFixed(1)}°C');
}
