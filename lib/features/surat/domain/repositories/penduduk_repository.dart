import 'package:desa_digital/core/result/result.dart';
import 'package:desa_digital/features/surat/domain/entities/penduduk.dart';

abstract interface class PendudukRepository {
  /// Semua data penduduk.
  Future<Result<List<Penduduk>>> semua();

  /// Cari penduduk berdasarkan NIK atau nama.
  Future<Result<List<Penduduk>>> cari(String kataKunci);
}
