// Import necessary libraries
import 'dart:io';  // For handling input/output operations
import 'package:ecommerce/ecommerce.dart';  // Importing our e-commerce models and logic

void main() {
  // Create a new shopping cart instance
  final cart = Cart();
  
  // Main program loop - keeps running until user checks out or makes an invalid choice
  while (true) {
    // Display menu options to the user
    stdout.write(
      'What do you want to do? (v)iew items, (a)dd item, (c)heckout: ',
    );
    
    // Read user input
    final line = stdin.readLineSync();
    
    // Process user's choice
    if (line == 'v' || line == 'V') {
      // View cart contents
      print(cart);
    } else if (line == 'a' || line == 'A') {
      // Add item to cart
      final product = chooseProduct();  // Show product list and get selection
      if (product != null) {  // If a valid product was selected
        cart.addItem(product);  // Add to cart
        print(cart);  // Show updated cart
      }
    } else if (line == 'c' || line == 'C') {
      // Proceed to checkout
      checkout(cart);  // Process payment
      break;  // Exit the program after checkout
    } else {  
      // Handle invalid input
      print('Invalid choice');
      break;  // Exit on invalid choice
    }
  }
}