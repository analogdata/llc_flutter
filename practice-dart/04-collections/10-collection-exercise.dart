// Collection Exercise

// Create a map of pizza prices
// Create a list of pizzas in the order
// Calculate the total price
// Print the total price
// If a pizza is not available, print a message and return

void main () {
  var pizzaPrices = {
    "Margherita": 10,
    "Pepperoni": 12,
    "Hawaiian": 15,
  };

  var order = ["Margherita", "Pepperoni"];

  var total = 0;

  for(var pizza in order){
    final price = pizzaPrices[pizza];
    if(price == null){
      print("$pizza is not available");
      return;
    }
    total += price;
  }

  print("Total: $total");
}