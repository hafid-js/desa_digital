/// Kegagalan yang bisa ditangani lapisan atas (domain/presentation).
///
/// Domain tidak pernah melempar exception; data layer menangkap exception
/// lalu mengubahnya menjadi [Failure] sebelum naik ke domain.
sealed class Failure {
  const Failure(this.message);

  /// Pesan yang aman ditampilkan ke pengguna.
  final String message;

  @override
  String toString() => '$runtimeType($message)';
}

/// Gagal karena tidak ada koneksi atau koneksi terputus.
final class NetworkFailure extends Failure {
  const NetworkFailure([
    super.message = 'Tidak ada koneksi internet. Periksa jaringan kamu.',
  ]);
}

/// Gagal karena serverside mengembalikan status error.
final class ServerFailure extends Failure {
  const ServerFailure(super.message, {this.statusCode});

  final int? statusCode;
}

/// Gagal karena data lokal tidak tersedia.
final class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Data belum tersedia. Coba muat ulang.']);
}

/// Gagal karena input pengguna tidak valid.
final class ValidationFailure extends Failure {
  const ValidationFailure(super.message, {this.fieldErrors = const {}});

  /// Pesan per field, misalnya `{'nik': 'NIK harus 16 digit'}`.
  final Map<String, String> fieldErrors;
}

/// Gagal karena sesi pengguna tidak valid atau sudah berakhir.
final class AuthFailure extends Failure {
  const AuthFailure([
    super.message = 'Sesi kamu sudah berakhir. Silakan masuk kembali.',
  ]);
}

/// Gagal karena halaman yang dituju tidak ditemukan.
final class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = 'Halaman tidak ditemukan.']);
}

/// Kegagalan yang belum dipetakan ke failure tertentu.
final class UnknownFailure extends Failure {
  const UnknownFailure([
    super.message = 'Terjadi kesalahan. Silakan coba lagi.',
  ]);
}
