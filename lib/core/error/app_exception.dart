/// Exception internal yang dilempar hanya di dalam data layer.
///
/// Peta ke [Failure] dilakukan oleh [mapExceptionToFailure] sebelum data
/// keluar dari repository, sehingga domain tidak perlu tahu detail teknis.
sealed class AppException implements Exception {
  const AppException(this.message);

  final String message;

  @override
  String toString() => '$runtimeType($message)';
}

/// Koneksi gagal atau timeout.
final class NetworkException extends AppException {
  const NetworkException([
    super.message = 'Tidak ada koneksi internet. Periksa jaringan kamu.',
  ]);
}

/// Serverside merespons dengan status error.
final class ServerException extends AppException {
  const ServerException(super.message, {this.statusCode});

  final int? statusCode;
}

/// Data lokal tidak tersedia.
final class CacheException extends AppException {
  const CacheException([
    super.message = 'Data belum tersedia. Coba muat ulang.',
  ]);
}

/// Data yang dicari tidak ada.
final class NotFoundException extends AppException {
  const NotFoundException([super.message = 'Data tidak ditemukan.']);
}

/// Sesi pengguna tidak valid.
final class AuthException extends AppException {
  const AuthException([
    super.message = 'Sesi kamu sudah berakhir. Silakan masuk kembali.',
  ]);
}

/// Exception di luar daftar yang diketahui.
final class UnknownException extends AppException {
  const UnknownException([
    super.message = 'Terjadi kesalahan. Silakan coba lagi.',
  ]);
}
