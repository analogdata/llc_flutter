/// MODEL layer in MVVM.
/// Holds the data we want to show on the screen.
/// In this example, one WeatherInfo object represents
/// the current weather for a single city.
class WeatherInfo {
  /// Name of the city the user searched for.
  final String city;

  /// Short text describing the weather (e.g. "Partly cloudy").
  final String description;

  /// Temperature as a formatted string (e.g. "13 °C").
  final String temperature;

  WeatherInfo({
    required this.city,
    required this.description,
    required this.temperature,
  });
}
