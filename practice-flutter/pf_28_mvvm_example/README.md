# pf_28_mvvm_example

Simple Flutter **MVVM Weather app** used for learning and teaching.

The app lets the user type a city name, calls a public weather API,
and shows the current temperature and description.

---

## MVVM structure in this project

This repo is intentionally small and focused on showing the
**Model–View–ViewModel (MVVM)** pattern.

### Model

- `lib/models/weather_info.dart`

Holds the data we want to display on the screen:

- `city`
- `description` (e.g. "Partly cloudy")
- `temperature` (formatted string, e.g. "13 °C")

The model has **no Flutter or networking code**, it is just data.

### Service / Repository

- `lib/services/weather_api_service.dart`

Responsible for talking to the external API and converting JSON
into the `WeatherInfo` model.

Uses the public wttr.in API:

- `https://wttr.in/<city>?format=j1`

This layer knows about **HTTP and JSON**, but not about widgets.

### ViewModel

- `lib/viewmodels/weather_view_model.dart`

Sits between the View and the Service.

Responsibilities:

- Validate user input (city not empty).
- Call `WeatherApiService.fetchWeather(city)`.
- Hold UI state:
  - `isLoading`
  - `errorMessage`
  - `weather` (a `WeatherInfo?`)
- Notify listeners (`notifyListeners()`) when state changes.

The ViewModel is **pure Dart logic + ChangeNotifier**.
It does not build widgets.

### View

- `lib/views/weather_page.dart`

Flutter UI that:

- Shows a `TextField` for the city.
- Has a **Get Weather** button.
- Listens to `WeatherViewModel` via `AnimatedBuilder`.
- Renders different UI based on ViewModel state:
  - Loading spinner.
  - Error message.
  - Weather card with city, temperature, description.

The View does not call the API directly – it only talks to the ViewModel.

### App entry

- `lib/main.dart`

Creates `MaterialApp` and shows `WeatherPage` as the home screen.
This file wires the app together but does not contain MVVM logic itself.

---

## Data flow summary

1. User types a city and taps **Get Weather** on `WeatherPage` (View).
2. View calls `viewModel.loadWeather(city)`.
3. `WeatherViewModel` validates input and calls
   `WeatherApiService.fetchWeather(city)`.
4. `WeatherApiService`:
   - Sends an HTTP GET to wttr.in.
   - Parses JSON into a `WeatherInfo` model.
5. ViewModel stores the `WeatherInfo`, updates `isLoading` / `errorMessage`,
   and calls `notifyListeners()`.
6. `WeatherPage` rebuilds via `AnimatedBuilder` and updates the UI.

This shows a clear separation of concerns:

- **View**: Flutter widgets only.
- **ViewModel**: screen logic + state.
- **Service**: network / data access.
- **Model**: plain data.

You can use this project as a starting point to teach or learn MVVM in Flutter.
