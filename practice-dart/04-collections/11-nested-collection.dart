void main() {
  var restuarants = [
    {
      "name": "Pizza Hut",
      "cuisine": "Italian",
      "ratings": [4, 5, 3, 4, 5]
    },
    {
      "name": "Burger King",
      "cuisine": "American",
      "ratings": [4, 5, 3, 4, 5]
    },
    {
      "name": "KFC",
      "cuisine": "British",
      "ratings": [4, 5, 3, 4, 5]
    }
  ];

  for (var restuarant in restuarants) {
    print(restuarant["name"]);
    print(restuarant["cuisine"]);
    print(restuarant["ratings"]);
    print("\n");
  }

  // Calculate the average rating
  for (var restuarant in restuarants) {
    final ratings = restuarant["ratings"] as List<int>;
    var totalRating = 0;
    for (var rating in ratings) {
      totalRating += rating;
    }
    print("Average of ${restuarant["name"]} rating: ${totalRating / ratings.length}");
  }
}