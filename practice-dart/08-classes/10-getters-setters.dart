// A class to demonstrate getters and setters in Dart
class Temperature {
  // Constructor that takes temperature in Celsius
  Temperature.celsius(this.celsius);
  
  // Constructor that takes temperature in Fahrenheit and converts to Celsius
  Temperature.fahrenheit(double fahrenheit) : celsius = (fahrenheit - 32) * 5 / 9;
  
  // Private field to store temperature in Celsius
  // This is our single source of truth
  double celsius;
  
  // Getter for Fahrenheit temperature (read-only property)
  // Converts the stored Celsius value to Fahrenheit when accessed
  // Formula: (C × 9/5) + 32
  double get fahrenheit => (celsius * 9 / 5) + 32;
  
  // Setter for Fahrenheit temperature
  // Converts the provided Fahrenheit value to Celsius and updates the internal state
  // Formula: (F - 32) × 5/9
  set fahrenheit(double fahrenheit) {
    celsius = (fahrenheit - 32) * 5 / 9;
  }

  // Method to print temperature details in both scales
  void printDetails() {
    print('Celsius: ${celsius.toStringAsFixed(1)}°C | ' +
          'Fahrenheit: ${fahrenheit.toStringAsFixed(1)}°F');
  }
}

void main() {
  print('Creating temperatures:');
  // Create temperature in Celsius
  final roomTemp = Temperature.celsius(25);
  print('Room temperature:');
  roomTemp.printDetails();
  
  // Create temperature in Fahrenheit (will be converted to Celsius)
  final bodyTemp = Temperature.fahrenheit(98.6);
  print('\nBody temperature:');
  bodyTemp.printDetails();

  // Demonstrate setting temperature using both Celsius and Fahrenheit
  print('\nUpdating temperatures:');
  
  // Update using Celsius setter (direct field access)
  roomTemp.celsius = 30;
  print('Updated room temperature:');
  roomTemp.printDetails();
  
  // Update using Fahrenheit setter (uses the setter we defined)
  bodyTemp.fahrenheit = 100;
  print('Updated body temperature:');
  bodyTemp.printDetails();
  
  // Show that both temperatures are stored in Celsius internally
  print('\nInternal state (always in Celsius):');
  print('Room temp: ${roomTemp.celsius.toStringAsFixed(1)}°C');
  print('Body temp: ${bodyTemp.celsius.toStringAsFixed(1)}°C');
}
