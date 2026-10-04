/// Jenis notifikasi yang bisa diaktifkan pengguna pada pengaturan notifikasi.
enum NotificationPreferenceType { beritaTerkini, peringatanCuaca, eventDesa }

/// Pengaturan penerimaan satu jenis notifikasi.
class NotificationPreference {
  const NotificationPreference({
    required this.type,
    required this.title,
    required this.subtitle,
    this.aktif = false,
  });

  final NotificationPreferenceType type;
  final String title;
  final String subtitle;

  /// `true` bila pengguna ingin menerima notifikasi ini.
  final bool aktif;

  NotificationPreference copyWith({bool? aktif}) => NotificationPreference(
    type: type,
    title: title,
    subtitle: subtitle,
    aktif: aktif ?? this.aktif,
  );
}
