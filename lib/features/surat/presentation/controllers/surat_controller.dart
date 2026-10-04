import 'package:desa_digital/core/usecase/usecase.dart';
import 'package:desa_digital/features/surat/domain/entities/penduduk.dart';
import 'package:desa_digital/features/surat/domain/entities/surat_mandiri.dart';
import 'package:desa_digital/features/surat/domain/usecases/surat_usecases.dart';

/// Menyediakan akses data surat untuk layar-layar surat: katalog, profil
/// pemohon, dan pengiriman permohonan.
class SuratController {
  SuratController(
    this._getProfil,
    this._getKatalogMandiri,
    this._getKatalogPerluProses,
    this._kirim,
  );

  final GetProfilAktif _getProfil;
  final GetKatalogSuratMandiri _getKatalogMandiri;
  final GetKatalogSuratPerluProses _getKatalogPerluProses;
  final KirimSuratMandiri _kirim;

  List<SuratMandiri>? _mandiri;
  List<SuratMandiri>? _perluProses;

  /// Katalog surat mandiri yang sudah dapat diisi warga.
  List<SuratMandiri> get katalogMandiri =>
      _mandiri ??= _getKatalogMandiri(const NoParams()).valueOrNull ?? const [];

  /// Katalog surat yang perlu proses perangkat desa.
  List<SuratMandiri> get katalogPerluProses => _perluProses ??=
      _getKatalogPerluProses(const NoParams()).valueOrNull ?? const [];

  /// Profil penduduk yang sedang login, atau null bila belum tersedia.
  Future<Penduduk?> muatProfilAktif() async =>
      (await _getProfil(const NoParams())).valueOrNull;

  /// Mengirim data permohonan surat; true bila berhasil.
  Future<bool> kirim(Map<String, dynamic> data) async =>
      (await _kirim(data)).isSuccess;
}
