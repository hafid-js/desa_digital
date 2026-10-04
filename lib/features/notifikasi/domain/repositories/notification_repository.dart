import 'package:desa_digital/features/notifikasi/domain/entities/notification_item.dart';
import 'package:desa_digital/features/notifikasi/domain/entities/notification_preference.dart';

abstract interface class NotificationRepository {
  /// Seluruh notifikasi yang tersedia.
  List<NotificationItem> getItems();

  /// Pengaturan notifikasi milik pengguna.
  List<NotificationPreference> getPreferences();
}
