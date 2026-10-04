import 'package:desa_digital/core/error/failure.dart';

/// Hasil operasi yang bisa berupa nilai atau [Failure].
///
/// Dipakai sebagai nilai balik repository dan use case agar kegagalan
/// ditangani sebagai data, bukan lewat exception.
sealed class Result<T> {
  const Result();

  const factory Result.success(T value) = Success<T>;

  const factory Result.failure(Failure failure) = FailureResult<T>;

  /// Nilai bila sukses, `null` bila gagal.
  T? get valueOrNull => switch (this) {
    Success<T>(:final value) => value,
    FailureResult<T>() => null,
  };

  /// Kegagalan bila gagal, `null` bila sukses.
  Failure? get failureOrNull => switch (this) {
    Success<T>() => null,
    FailureResult<T>(:final failure) => failure,
  };

  bool get isSuccess => this is Success<T>;

  bool get isFailure => this is FailureResult<T>;

  /// Menjalankan salah satu cabang sesuai hasil operasi.
  R fold<R>({
    required R Function(T value) onSuccess,
    required R Function(Failure failure) onFailure,
  }) => switch (this) {
    Success<T>(:final value) => onSuccess(value),
    FailureResult<T>(:final failure) => onFailure(failure),
  };

  /// Mengubah nilai sukses tanpa menyentuh kegagalan.
  Result<R> map<R>(R Function(T value) transform) => switch (this) {
    Success<T>(:final value) => Result<R>.success(transform(value)),
    FailureResult<T>(:final failure) => Result<R>.failure(failure),
  };
}

/// Hasil berhasil dengan nilai [value].
final class Success<T> extends Result<T> {
  const Success(this.value);

  final T value;

  @override
  String toString() => 'Success($value)';
}

/// Hasil gagal dengan [failure].
final class FailureResult<T> extends Result<T> {
  const FailureResult(this.failure);

  final Failure failure;

  @override
  String toString() => 'FailureResult($failure)';
}
