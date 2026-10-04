import 'package:desa_digital/features/cuaca/domain/entities/weather_forecast.dart';

abstract interface class WeatherRepository {
  /// Wilayah beserta prakiraan cuacanya.
  List<WeatherLocation> getLocations();
}
