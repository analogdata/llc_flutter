import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_info.dart';

/// SERVICE / REPOSITORY layer in MVVM.
///
/// This class is responsible only for talking to the remote
/// weather API and converting the JSON response into
/// a WeatherInfo model. It does NOT know anything about
/// Flutter widgets or UI state.
///
/// We use the public wttr.in API:
///   https://wttr.in/<city>?format=j1
class WeatherApiService {
  static const String _baseUrl = 'https://wttr.in';

  Future<WeatherInfo> fetchWeather(String city) async {
    final uri = Uri.parse('$_baseUrl/$city?format=j1');
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to load weather (code: ${response.statusCode})');
    }

    // Decode the JSON body into a Map.
    final Map<String, dynamic> json =
        jsonDecode(response.body) as Map<String, dynamic>;

    // wttr.in JSON structure (simplified):
    // {
    //   "current_condition": [
    //     {
    //       "temp_C": "13",
    //       "weatherDesc": [{ "value": "Partly cloudy" }],
    //       ...
    //     }
    //   ],
    //   ...
    // }
    final currentList = json['current_condition'] as List<dynamic>?;
    if (currentList == null || currentList.isEmpty) {
      throw Exception('Weather data not available');
    }

    // Take the first element from current_condition as
    // "current" weather.
    final current = currentList.first as Map<String, dynamic>;

    // Temperature in Celsius, as a string.
    final tempC = current['temp_C']?.toString() ?? 'N/A';

    // weatherDesc is a list like: [{ "value": "Partly cloudy" }]
    final descList = current['weatherDesc'] as List<dynamic>?;
    final desc = (descList != null && descList.isNotEmpty)
        ? (descList.first as Map<String, dynamic>)['value']?.toString() ??
              'No description'
        : 'No description';

    // Convert raw JSON fields into our WeatherInfo model.
    return WeatherInfo(city: city, description: desc, temperature: '$tempC °C');
  }
}
