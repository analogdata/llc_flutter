import 'package:coffee_shop/coffee_shop.dart';

void main() {
  CoffeeShop branch1 = CoffeeShop();
  print(branch1.sellCappucino());
  print(branch1.sellLatte());

  CoffeeShop rajath = CoffeeShop.owner();
  rajath.priceCappucino = 40;

  print(branch1.sellCappucino());

  CoffeeShop branch2 = CoffeeShop();
  print(branch2.sellCappucino());
}
