import 'dart:io';

import 'package:ecommerce/ecommerce.dart';

void main() {
  final cart = Cart();
  while (true) {
    stdout.write(
      'What do you want to do? (v)iew items, (a)dd item, (c)heckout: ',
    );
    final line = stdin.readLineSync();
    if(line == 'v' || line == 'V'){
      print(cart);
    }else if(line == 'a' || line == 'A'){
      final product = chooseProduct();
      if(product != null){
      cart.addItem(product);
      print(cart);
      }
    }else if(line == 'c' || line == 'C'){
      checkout(cart);
      break;
    }else{  
      print('Invalid choice');
      break;
    }
  }
}
