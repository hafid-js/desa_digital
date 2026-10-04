import 'package:desa_digital/features/activity/presentation/bindings/activity_binding.dart';
import 'package:desa_digital/features/notifikasi/presentation/bindings/notification_binding.dart';
import 'package:get/get.dart';

/// Dependensi untuk seluruh tab di dalam MainShell.
///
/// Tab Aktivitas memakai [ActivityBinding] dan tab Notifikasi memakai
/// [NotificationBinding]; tab yang belum punya repository sendiri belum
/// memerlukan registrasi apa pun.
class MainShellBinding extends Bindings {
  @override
  void dependencies() {
    ActivityBinding().dependencies();
    NotificationBinding().dependencies();
  }
}
