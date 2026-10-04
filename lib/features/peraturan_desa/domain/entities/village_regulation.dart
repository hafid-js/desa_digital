/// Satu peraturan desa beserta Berkas yang dapat dibuka.
class VillageRegulation {
  const VillageRegulation({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.author,
    required this.category,
    required this.thumbnailAsset,
    required this.pdfAsset,
  });

  final String id;
  final String title;
  final String description;

  /// Tanggal terbit siap tampil, misalnya `03 Januari 2025`.
  final String date;
  final String author;
  final String category;

  /// Aset thumbnail dan berkas PDF peraturan.
  final String thumbnailAsset;
  final String pdfAsset;
}
