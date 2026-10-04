import 'package:desa_digital/core/result/result.dart';

/// Unit kerja sinkron di lapisan domain, dipakai untuk data yang sudah ada
/// di memori (data lokal/contoh).
///
/// Sinkron dipilih agar presentation bisa memuat data pada frame pertama,
/// tanpa perlu state loading dan tanpa risiko kedipan pada layar.
abstract interface class UseCase<T, P> {
  Result<T> call(P params);
}

/// Basis implementasi use case sinkron.
///
/// [call] dipakai pemanggil, logika bisnisnya di [execute] agar mudah diuji.
abstract class BaseUseCase<T, P> implements UseCase<T, P> {
  const BaseUseCase();

  @override
  Result<T> call(P params) => execute(params);

  Result<T> execute(P params);
}

/// Unit kerja asinkron, dipakai saat sumber datanya jaringan/API.
abstract interface class AsyncUseCase<T, P> {
  Future<Result<T>> call(P params);
}

/// Basis implementasi use case asinkron.
abstract class BaseAsyncUseCase<T, P> implements AsyncUseCase<T, P> {
  const BaseAsyncUseCase();

  @override
  Future<Result<T>> call(P params) => execute(params);

  Future<Result<T>> execute(P params);
}

/// Placeholder untuk use case tanpa parameter.
final class NoParams {
  const NoParams();
}
