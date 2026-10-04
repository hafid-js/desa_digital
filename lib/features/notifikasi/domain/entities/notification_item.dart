/// Kategori notifikasi yang tersedia sebagai tab pada layar notifikasi.
enum NotificationCategory { semua, aduan, event, berita }

/// Satu baris notifikasi pada daftar.
class NotificationItem {
  const NotificationItem({
    required this.id,
    required this.category,
    required this.title,
    required this.body,
    required this.timeAgo,
  });

  final String id;
  final NotificationCategory category;
  final String title;
  final String body;

  /// Waktu relatif siap tampil, misalnya `13 jam yang lalu`.
  final String timeAgo;
}
