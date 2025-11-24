import 'package:flutter/foundation.dart';

import '../models/weather_info.dart';
import '../services/weather_api_service.dart';

/// VIEWMODEL layer in MVVM.
///
/// This class sits between the View (Flutter widgets)
/// and the Service (WeatherApiService).
///
/// Responsibilities:
/// - Validate input from the UI (city name).
/// - Call WeatherApiService to fetch data.
/// - Hold UI state: loading, error message, weather data.
/// - Notify listeners (the View) when the state changes.
class WeatherViewModel extends ChangeNotifier {
  WeatherViewModel({required WeatherApiService api}) : _api = api;

  final WeatherApiService _api;

  // PRIVATE mutable fields
  bool _isLoading = false;
  String? _errorMessage;
  WeatherInfo? _weather;

  // PUBLIC read-only getters used by the UI.
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  WeatherInfo? get weather => _weather;

  /// Entry point called from the View.
  /// Given a [city], this method:
  /// 1. Validates the input.
  /// 2. Sets loading state.
  /// 3. Asks the service for data.
  /// 4. Updates error or weather fields.
  /// 5. Notifies listeners at each important step.
  Future<void> loadWeather(String city) async {
    // Basic validation: show a friendly error if city is empty.
    if (city.trim().isEmpty) {
      _errorMessage = 'Please enter a city name';
      _weather = null;
      notifyListeners();
      return;
    }

    // Start loading: clear previous error/data and notify UI.
    _isLoading = true;
    _errorMessage = null;
    _weather = null;
    notifyListeners();

    try {
      // Ask the service for weather data.
      _weather = await _api.fetchWeather(city.trim());
    } catch (e) {
      // In case of any error, show it to the user.
      _errorMessage = e.toString();
    } finally {
      // Loading finished in both success and failure cases.
      _isLoading = false;
      notifyListeners();
    }
  }
}
