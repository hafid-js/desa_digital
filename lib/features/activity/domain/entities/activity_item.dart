/// Satu baris aktivitas yang tampil di layar Aktivitas.
class ActivityItem {
  const ActivityItem({
    required this.title,
    required this.meta,
    this.isReportCode = false,
  });

  final String title;
  final String meta;

  /// `true` bila baris ini menampilkan kode laporan, bukan judul berita.
  final bool isReportCode;
}

/// Kelompok aktivitas yang tersedia di layar Aktivitas.
enum ActivityFeed {
  laporanProses,
  laporanSelesai,
  keluhanTersimpan,
  beritaTersimpan,
}
