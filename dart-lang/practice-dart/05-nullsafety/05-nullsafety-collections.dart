void main () {
  // Here we are using nullable type
  // ? is used to make a variable nullable
  const cities = <String?>['New York', 'Los Angeles', 'Chicago', null];

  for (var city in cities) {
    // Here we are using null check operator
    if (city != null) {
      print(city.toUpperCase());
    }
  }

  // Safe Way is Conditional Access Operator
  // ?. is used to access a property or method of an object if it is not null
  for (var city in cities) {
    print(city?.toUpperCase());
  }
}