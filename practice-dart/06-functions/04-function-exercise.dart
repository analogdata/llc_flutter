import 'dart:io';

void main() {

  double total = calculateTotal(["Margherita", "Pepperoni"]);
  print("Total: $total");
}


double calculateTotal(List<String> order){
  const pizzaPrices = {
    "Margherita": 10,
    "Pepperoni": 12,
    "Hawaiian": 15,
    "Meat Lovers": 18,
    "Veggie": 14,
  };

  double total = 0;

  for (String item in order){
    if (pizzaPrices.containsKey(item)){
      total += pizzaPrices[item]!;
    }
    else {
      print("$item is not available");
      exit(1);
    }
  }

  return total;
}
  
