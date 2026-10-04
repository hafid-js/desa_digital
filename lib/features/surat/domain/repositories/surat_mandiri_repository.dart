import 'package:desa_digital/core/result/result.dart';
import 'package:desa_digital/features/surat/domain/entities/surat_mandiri.dart';

abstract interface class SuratMandiriRepository {
  /// Katalog seluruh surat mandiri.
  Result<List<SuratMandiri>> katalog();

  /// Surat mandiri yang sudah dapat diisi warga.
  Result<List<SuratMandiri>> katalogSiap();

  /// Surat yang tetap diverifikasi perangkat desa.
  Result<List<SuratMandiri>> katalogPerluProses();

  /// Mengirim data permohonan surat.
  Future<Result<void>> kirim(Map<String, dynamic> data);
}
