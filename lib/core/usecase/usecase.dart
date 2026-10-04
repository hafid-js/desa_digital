import 'package:desa_digital/core/result/result.dart';

/// Unit kerja tunggal di lapisan domain.
///
/// Implementasi berada di `domain/usecases` dan tidak boleh tahu-menahu
/// tentang widget, GetX, atau sumber data.
abstract interface class UseCase<T, P> {
  Future<Result<T>> call(P params);
}

/// Placeholder untuk use case yang tidak membutuhkan parameter.
final class NoParams {
  const NoParams();
}

/// Basis implementasi use case.
///
/// [call] cukup untuk pemanggilan langsung dari presentation, sementara logika
/// bisnisnya ditulis di [execute] agar mudah diuji dan di-override.
abstract class BaseUseCase<T, P> implements UseCase<T, P> {
  const BaseUseCase();

  @override
  Future<Result<T>> call(P params) => execute(params);

  Future<Result<T>> execute(P params);
}
