void main() {
  // Type Annotation: Storing a single type of data in the List
  // Using List<String> instead of <String>
  List<String> cities = ["New York", "Los Angeles", "Chicago", "Houston", "Phoenix"];
  print(cities);

  // Type Annotation: Storing a single type of data in the List
  // Using <int> instead of List<int>
  List<int> numbers = [1, 2, 3, 4, 5];
  print(numbers);

  // Type Annotation: Storing a single type of data in the List
  // Using <String> instead of List<String>
  // var is used to let Dart infer the type
  var companies = <String>['Google', 'Apple', 'Microsoft', 'Analog Data'];
  print(companies);
}