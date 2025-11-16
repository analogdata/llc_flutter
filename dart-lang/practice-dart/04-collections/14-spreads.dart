void main () {
  const colors = ["red", "green", "blue"];
  const extraColors = ["yellow", "orange", "purple"];

  var newColors = [...colors, ...extraColors];
  print(newColors);


  var ratings =  [4, 5, 3, 4, 5];
  final restuarant= {
    "name": "Pizza Hut",
    "cuisine": "Italian",
    if (ratings.length > 4) ...{
      "ratings": ratings,
      'isPopular': true
    }
  };

  print(restuarant);


  // Shopping List Example
  const bananas = 5;
  const apples = 3;

  const grains = {
    "rice": '2kg',
    "wheat": '1kg',
  };

  final shoppingList = {};

  shoppingList.addAll({
    if (bananas > 0) "bananas": bananas,
    if (apples > 0) "apples": apples,
    if (grains.isNotEmpty) ...grains,
  });

  print(shoppingList);
}