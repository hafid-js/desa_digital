import 'package:desa_digital/features/pengaduan/domain/entities/wilayah.dart';

/// Kumpulan wilayah beserta indeks induk-anaknya.
///
/// Dipakai untuk mencari wilayah dan menyusun path lengkap tanpa perlu
/// memuat ulang data.
class WilayahCatalog {
  WilayahCatalog(List<Wilayah> regions)
    : regions = List.unmodifiable(regions),
      _byCode = {for (final region in regions) region.code: region};

  final List<Wilayah> regions;
  final Map<String, Wilayah> _byCode;

  /// Cari wilayah pada [keyword]; hanya wilayah kabupaten ke bawah yang ikut
  /// dicari. Kata kunci lebih pendek dari [minChars] menghasilkan daftar kosong.
  ///
  /// Hasil diurutkan berdasarkan level, lalu nama.
  List<Wilayah> search(String keyword, {int minChars = 3}) {
    final keywordLower = keyword.trim().toLowerCase();
    if (keywordLower.length < minChars) return const <Wilayah>[];

    final matches =
        regions
            .where(
              (region) =>
                  region.level >= 2 &&
                  region.name.toLowerCase().contains(keywordLower),
            )
            .toList()
          ..sort((a, b) {
            if (a.level != b.level) return a.level.compareTo(b.level);
            return a.name.toLowerCase().compareTo(b.name.toLowerCase());
          });

    return matches;
  }

  /// Path lengkap wilayah dari kabupaten hingga desa, dipisah koma dan
  /// ditulis kapital, misalnya `KABUPATEN BRUNO, KECAMATAN BRUNO, DESA
  /// CEPEDAK`.
  String pathOf(Wilayah region) {
    final names = <String>[];
    Wilayah? current = region;

    while (current != null) {
      if (current.level >= 2) names.add(current.name);
      current = current.parentCode.isEmpty ? null : _byCode[current.parentCode];
    }

    return names.reversed.map((name) => name.toUpperCase()).join(', ');
  }
}
