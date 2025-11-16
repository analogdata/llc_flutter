void main () {
  var person = <String, dynamic>{
    "name": "Rajath",
    "age": 32,
    "city": "Bangalore"
  };

  print(person); 

  // Type Checking: Here when we use as operator we are telling Dart that the value is of type String
  // If the value is not of type String then it will throw an error
  var namedata = person["name"] as String;
  print(namedata.toUpperCase());
}
