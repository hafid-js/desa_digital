/// Prakiraan cuaca satu hari pada sebuah wilayah.
class WeatherForecast {
  const WeatherForecast({
    required this.day,
    required this.condition,
    required this.temperature,
    required this.humidity,
  });

  /// Label hari siap tampil, misalnya `Min, 4 Okt`.
  final String day;

  /// Kondisi cuaca, misalnya `Berawan`.
  final String condition;

  /// Rentang suhu siap tampil, misalnya `24-29`.
  final String temperature;

  /// Rentang kelembapan siap tampil, misalnya `68-87%`.
  final String humidity;
}

/// Wilayah beserta prakiraan cuacanya.
class WeatherLocation {
  const WeatherLocation({
    required this.id,
    required this.name,
    required this.forecasts,
  });

  final String id;
  final String name;
  final List<WeatherForecast> forecasts;
}
