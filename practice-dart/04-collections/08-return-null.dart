void main () {
  var person = <String, dynamic>{
    "name": "Rajath",
    "age": 32,
    "city": "Bangalore"
  };

  print(person);

  var weight = person["weight"]; // if there is no key "weight" then it will return null
  print(weight); // null
}