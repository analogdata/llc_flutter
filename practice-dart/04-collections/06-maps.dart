void main () {

  // Map: Map is a collection of key-value pairs, they are unordered and indexed
  var person = {
    "name": "Rajath",
    "age": 32,
    "city": "Bangalore"
  };

  print(person);

  // Accessing Map items
  print(person["name"]);

  // Adding items to Map
  person["country"] = "India";
  print(person);

  // Removing items from Map
  person.remove("age");
  print(person);

  // Checking if key exists in Map
  print(person.containsKey("name"));

  // Checking if value exists in Map
  print(person.containsValue("Bangalore"));

  // Creating Map with type annotation
  var newPerson = <String, dynamic>{
    "name": "Rajath",
    "age": 32,
    "city": "Bangalore"
  };

  print(newPerson);

  // There are other ways to create Map
  Map<String, dynamic> anotherPerson = {
    "name": "Rajath",
    "age": 32,
    "city": "Bangalore"
  };

  print(anotherPerson);

  // Clearing Map
  person.clear();
  print(person);
}