void main () {
  var person = <String, dynamic>{
    "name": "Rajath",
    "age": 32,
    "city": "Bangalore"
  };

  // Printing keys
  print(person.keys);

  // Printing values
  print(person.values);

  // Printing entries
  print(person.entries);

  // Iterating over keys
  for(var key in person.keys){
    print(key);
  }

  // Iterating over values
  for(var value in person.values){
    print(value);
  }

  // Iterating over entries
  for(var entry in person.entries){
    print(entry.key);
    print(entry.value);
  }
}