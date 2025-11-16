import 'dart:io';

void main (List<String> args) {
  if (args.isEmpty) {
    print("Usage: dart total.dart <file_path>");
    exit(1);
  }

  final filePath = args.first;
  final lines = File(filePath).readAsLinesSync();
  final priceByItem = <String, double>{};

  lines.removeAt(0);

  int totalItems = 0;
  double total = 0.0;

  String maxItem = "";
  double maxPrice = 0.0;
  
  String minItem = "";
  double minPrice = double.infinity;

  var CategoryCount = <String,int>{};

  for (var line in lines) {
    final parts = line.split(",");
    final name = parts[1];
    final quantity = int.parse(parts[3]);
    final price = double.parse(parts[4]);
    totalItems += quantity;
    priceByItem[name] = price * quantity;
    total += price * quantity;
    if (price > maxPrice) {
      maxPrice = price;
      maxItem = name;
    }
    if (price < minPrice) {
      minPrice = price;
      minItem = name;
    }
    CategoryCount[parts[2]] = (CategoryCount[parts[2]] ?? 0) + 1;
  }

  // print(priceByItem);
  print("Total Items: $totalItems");
  print("Total Price: $total");
  print("Max Price: $maxPrice is of $maxItem");
  print("Min Price: $minPrice is of $minItem");
  print(CategoryCount);
}