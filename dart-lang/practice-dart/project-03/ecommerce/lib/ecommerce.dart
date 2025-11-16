import 'dart:io';

class Product {
  const Product({required this.id, required this.name, required this.price});
  final int id;
  final String name;
  final double price;

  String get displayName => '($initial)${name.substring(1)}: \$$price';

  String get initial => name.substring(0,1);
}

class Item {
  const Item({required this.product, this.quantity = 1});
  final Product product;
  final int quantity;

  double get price => product.price * quantity;

  @override
  String toString() => '${product.name} x $quantity: \$$price';
}

class Cart {
  final Map<int, Item> _items = {};
  void addItem(Product product){
    final item = _items[product.id];
    if(item == null){
      _items[product.id] = Item(product: product, quantity: 1);
    }else{
      _items[product.id] = Item(product: product, quantity: item.quantity + 1);
    }
  }

  double total() => _items.values.map((item) => item.price).reduce((a, b) => a + b);

  @override
  String toString() {
    if (_items.isEmpty) {
      return 'Cart is empty';
    }
    final itemizedList = _items.values.map((item) => item.toString()).join('\n');
    return '------Cart:------\n$itemizedList\nTotal: \$${total()}';
  }

  bool get isEmpty => _items.isEmpty;
}

const allProducts = [
  Product(id: 1, name: 'apples', price: 0.5),
  Product(id: 2, name: 'bananas', price: 0.3),
  Product(id: 3, name: 'oranges', price: 0.4),
  Product(id: 4, name: 'grapes', price: 0.6),
  Product(id: 5, name: 'mangoes', price: 0.7),
  Product(id: 6, name: 'pineapples', price: 0.8),
];

Product? chooseProduct() {
  final productsList = allProducts
      .map((product) => product.displayName)
      .join('\n');

  stdout.write('Available products:\n$productsList\nYour choice:');
  final line = stdin.readLineSync();

  for (var product in allProducts) {
    if (product.initial == line) {
      return product;
    }
  }
  print('Invalid choice');
  return null;

}


bool checkout(Cart cart){
  if(cart.isEmpty){
    print('Cart is empty');
    return false;
  }
  final total = cart.total();
  print('Total: \$$total');

  stdout.write('Payment in cash: ');
  final line = stdin.readLineSync();
  if(line == null || line.isEmpty){
    return false;
  }

  final paid = double.tryParse(line);
  if (paid == null){
    print('Invalid payment amount');
    return false;
  }
  if(paid < total){
    print('Payment amount is less than total');
    return false;
  }
  if(paid > total){
    print('Payment amount is more than total');
    final change = paid - total;
    print('Change: \$$change'); 
    return true;
  }
  cart._items.clear();
  return true;
}
  