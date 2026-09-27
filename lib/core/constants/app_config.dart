/// Metadata & konfigurasi statis level aplikasi.
final class AppConfig {
  AppConfig._();

  static const String appName = 'Desa Digital';
  static const String appVersion = '1.0.0';

  /// Prefix untuk mendeteksi apakah sebuah path menunjuk ke bundle asset,
  /// bukan file di penyimpanan perangkat. Dipakai [PdfViewer].
  static const String assetPrefix = 'assets/';
}
