void main() {

  // List
  // List is a collection of items, They are ordered and indexed

  var cities = ["New York", "Los Angeles", "Chicago", "Houston", "Phoenix"];
  print(cities);

  // Accessing List items
  print(cities[0]);

  // Length of List
  print(cities.length);

  // Is List empty
  print(cities.isEmpty);

  // Is List not empty
  print(cities.isNotEmpty);

  // first item in List
  print(cities.first);

  // last item in List
  print(cities.last);

  // Adding items to List
  cities.add("San Francisco");
  print(cities);

  // Inserting item at specific index
  cities.insert(0, "Mumbai");
  print(cities);

  // Modifying items in List
  cities[0] = "Bangalore";
  print(cities);

  // Removing items from List
  cities.remove("New York");
  print(cities);

  // Removing item at specific index
  cities.removeAt(0);
  print(cities);

  // Checking if item exists in List
  print(cities.contains("Bangalore"));

  // Checking the item is not in List
  print(cities.contains("Beijing"));

  // Getting index of item in List
  print(cities.indexOf("Los Angeles"));

  // Getting sub list
  print(cities.sublist(0, 2));

  // Sorting List
  cities.sort();
  print(cities);

  //iterating over List
  for(int i = 0; i < cities.length; i++){
    print(cities[i]);
  }

  // iterating over List using for-each loop (Easy Method) (Recommended) 
  for(var city in cities){
    print(city);
  }

  // Clearing List
  cities.clear();
  print(cities);

}