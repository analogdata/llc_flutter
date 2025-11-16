/// A class representing a restaurant with name, cuisine type, and customer ratings
class Restaurant {
  // Constructor with required named parameters
  // All parameters are marked as required and the instance is immutable (const)
  const Restaurant({
    required this.name,
    required this.cuisine,
    required this.ratings,
  });

  // Immutable properties (can't be changed after creation)
  final String name;          // Name of the restaurant
  final String cuisine;       // Type of cuisine served
  final List<double> ratings; // List of customer ratings (0.0 to 5.0)

  /// Calculates the average rating from all customer reviews
  /// Returns 0 if there are no ratings yet
  /// Uses the reduce method to sum all ratings and divides by the count
  double get averageRating => ratings.isEmpty 
      ? 0 
      : ratings.reduce((sum, rating) => sum + rating) / ratings.length;

  /// Returns the total number of ratings/reviews
  /// Simple getter that returns the length of the ratings list
  int get totalRatings => ratings.length;

  /// Returns a formatted string with rating information
  String get ratingInfo {
    if (ratings.isEmpty) return 'No ratings yet';
    return '${averageRating.toStringAsFixed(1)}/5.0 from $totalRatings reviews';
  }
}

void main() {
  // Create a restaurant instance with sample data
  final restaurant = Restaurant(
    name: 'The Gourmet',
    cuisine: 'Italian',
    ratings: [4.5, 4.2, 4.8, 4.0, 4.7],
  );

  // Display restaurant information
  print('''
  🍽️  Restaurant Details  🍽️
  ------------------------
  Name:    ${restaurant.name}
  Cuisine: ${restaurant.cuisine}
  Rating:  ${restaurant.ratingInfo}
  ''');

  // Demonstrate immutability (uncommenting the line below would cause an error)
  // restaurant.name = 'New Name'; // Error: Can't assign to final variable 'name'

  // Show what happens with no ratings
  final newRestaurant = Restaurant(
    name: 'New Place',
    cuisine: 'Fusion',
    ratings: [],
  );
  
  print('''
  🆕 New Restaurant Added!
  -----------------------
  Name:    ${newRestaurant.name}
  Cuisine: ${newRestaurant.cuisine}
  Rating:  ${newRestaurant.ratingInfo}
  ''');
}
