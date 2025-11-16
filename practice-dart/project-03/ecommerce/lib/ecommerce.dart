import 'dart:io';

// Represents a product in the store
class Product {
  const Product({required this.id, required this.name, required this.price});
  final int id;          // Unique identifier for the product
  final String name;     // Name of the product
  final double price;    // Price of the product

  // Display name in the format: (a)pples: $0.50
  String get displayName => '($initial)${name.substring(1)}: \$$price';

  // Get the first character of the product name (used for selection)
  String get initial => name.substring(0,1);
}

// Represents an item in the shopping cart (product + quantity)
class Item {
  const Item({required this.product, this.quantity = 1});
  final Product product;  // The product being purchased
  final int quantity;     // Quantity of this product in the cart

  // Calculate the total price for this item (price * quantity)
  double get price => product.price * quantity;

  @override
  String toString() => '${product.name} x $quantity: \$$price';
}

// Shopping cart that holds items
class Cart {
  // Internal storage using a map for quick lookup by product ID
  final Map<int, Item> _items = {};

  // Add a product to the cart or increment quantity if already present
  void addItem(Product product) {
    final item = _items[product.id];
    if (item == null) {
      _items[product.id] = Item(product: product, quantity: 1);
    } else {
      _items[product.id] = Item(
        product: product, 
        quantity: item.quantity + 1
      );
    }
  }

  // Calculate the total cost of all items in the cart
  double total() => _items.values
    .map((item) => item.price)
    .reduce((a, b) => a + b);

  @override
  String toString() {
    if (_items.isEmpty) {
      return 'Cart is empty';
    }
    // Create a formatted list of items
    final itemizedList = _items.values
      .map((item) => item.toString())
      .join('\n');
    return '------Cart:------\n$itemizedList\nTotal: \$${total()}';
  }

  // Check if the cart is empty
  bool get isEmpty => _items.isEmpty;
}

// List of available products in the store
const allProducts = [
  Product(id: 1, name: 'apples', price: 0.5),
  Product(id: 2, name: 'bananas', price: 0.3),
  Product(id: 3, name: 'oranges', price: 0.4),
  Product(id: 4, name: 'grapes', price: 0.6),
  Product(id: 5, name: 'mangoes', price: 0.7),
  Product(id: 6, name: 'pineapples', price: 0.8),
];

// Display available products and let user choose one
Product? chooseProduct() {
  // Create a formatted list of products with their initials
  final productsList = allProducts
      .map((product) => product.displayName)
      .join('\n');

  // Show available products and get user input
  stdout.write('Available products:\n$productsList\nYour choice:');
  final line = stdin.readLineSync();

  // Find the selected product by initial
  for (var product in allProducts) {
    if (product.initial == line) {
      return product;
    }
  }
  print('Invalid choice');
  return null;
}

// Process the checkout and payment
bool checkout(Cart cart) {
  // Check if cart is empty
  if (cart.isEmpty) {
    print('Cart is empty');
    return false;
  }

  // Calculate and display total
  final total = cart.total();
  print('Total: \$$total');

  // Get payment amount from user
  stdout.write('Payment in cash: ');
  final line = stdin.readLineSync();
  if (line == null || line.isEmpty) {
    return false;
  }

  // Validate payment amount
  final paid = double.tryParse(line);
  if (paid == null) {
    print('Invalid payment amount');
    return false;
  }
  if (paid < total) {
    print('Payment amount is less than total');
    return false;
  }
  if (paid > total) {
    // Calculate and return change
    final change = paid - total;
    print('Payment amount is more than total');
    print('Change: \$${change.toStringAsFixed(2)}'); 
    return true;
  }
  
  // Clear cart if payment is exact
  cart._items.clear();
  return true;
}