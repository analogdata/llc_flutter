import 'package:flutter/material.dart';

import '../viewmodels/weather_view_model.dart';
import '../services/weather_api_service.dart';

/// VIEW layer in MVVM.
///
/// This widget is responsible only for:
/// - Building the UI.
/// - Sending user actions (city text, button tap)
///   to the ViewModel.
/// - Listening to the ViewModel and redrawing
///   when its state changes.
class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // Our ViewModel instance. In a bigger app you would
  // usually get this from a dependency injection system
  // or a state management solution like Provider/Riverpod.
  late final WeatherViewModel _viewModel;

  // Controller for the TextField where the user
  // types the city name.
  final TextEditingController _controller = TextEditingController(
    text: 'London',
  );

  @override
  void initState() {
    super.initState();
    // Create the ViewModel and inject the API service.
    _viewModel = WeatherViewModel(api: WeatherApiService());
  }

  @override
  void dispose() {
    // Always dispose controllers and ChangeNotifiers
    // created by this widget.
    _controller.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather (MVVM Example)')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'City',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              // When the button is pressed we call into
              // the ViewModel, passing the current text
              // from the TextField as the city name.
              onPressed: () => _viewModel.loadWeather(_controller.text),
              child: const Text('Get Weather'),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: AnimatedBuilder(
                animation: _viewModel,
                builder: (context, _) {
                  // The UI reacts to the ViewModel state.
                  // Only one of the branches below will
                  // be shown at a time.
                  if (_viewModel.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (_viewModel.errorMessage != null) {
                    return Center(
                      child: Text(
                        _viewModel.errorMessage!,
                        style: const TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }

                  if (_viewModel.weather == null) {
                    return const Center(
                      child: Text(
                        'Enter a city name and tap "Get Weather"',
                        textAlign: TextAlign.center,
                      ),
                    );
                  }

                  final weather = _viewModel.weather!;
                  return Center(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              weather.city,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 8),
                            Text('Temperature: ${weather.temperature}'),
                            const SizedBox(height: 8),
                            Text('Description: ${weather.description}'),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
