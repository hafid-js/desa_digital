import 'package:desa_digital/core/result/result.dart';
import 'package:desa_digital/features/pengaduan/domain/entities/wilayah.dart';

abstract interface class WilayahRepository {
  /// Seluruh wilayah dari data lokal (CSV pada bundle).
  Future<Result<List<Wilayah>>> loadRegions();
}
