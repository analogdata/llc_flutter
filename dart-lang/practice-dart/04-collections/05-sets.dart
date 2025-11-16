void main() {

  var countries = {"India", "USA", "Canada", "UK", "Australia"};
  print(countries);

  // Adding items to Set
  countries.add("New Zealand");
  print(countries);

  // Removing items from Set
  countries.remove("UK");
  print(countries);

  // Checking if item exists in Set
  print(countries.contains("India"));

  // first item in Set
  print(countries.first);

  // last item in Set
  print(countries.last);

  // length of Set
  print(countries.length);

  // Clearing Set
  countries.clear();
  print(countries);

  var asianCountries = {"India", "China", "Japan", "South Korea", "Indonesia"};
  var africanCountries = {"Nigeria", "Ethiopia", "South Africa", "Algeria", "Egypt"};

  // Union of Sets
  print(asianCountries.union(africanCountries));

  // Intersection of Sets
  print(asianCountries.intersection(africanCountries));

  // Difference of Sets
  print(asianCountries.difference(africanCountries));

  // loop through Set
  for(var country in asianCountries){
    print(country);
  }

  const a = {1, 2, 3, 4, 5};
  const b = {4, 5, 6, 7, 8};

  // Union of Sets
  print(a.union(b));

  // Intersection of Sets
  print(a.intersection(b));

  // Difference of Sets
  print(a.difference(b));

  // Symmetric Difference of Sets (Elements in either a or b but not in both)
  final c = a.union(b).difference(a.intersection(b));
  print(c);

  // Sum of all elements in Set c
  int sum = 0;
  for(var i in c){
    sum += i;
  }
  print(sum);

}