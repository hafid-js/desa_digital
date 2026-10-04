import 'package:desa_digital/features/activity/presentation/bindings/activity_binding.dart';
import 'package:desa_digital/features/home/presentation/bindings/home_binding.dart';
import 'package:desa_digital/features/notifikasi/presentation/bindings/notification_binding.dart';
import 'package:desa_digital/features/profil/presentation/bindings/profile_binding.dart';
import 'package:get/get.dart';

/// Dependensi untuk seluruh tab di dalam MainShell.
///
/// Tab Aktivitas memakai [ActivityBinding], tab Home memakai [HomeBinding], tab
/// Notifikasi memakai [NotificationBinding], dan tab Profil memakai
/// [ProfileBinding]; tab yang belum punya repository sendiri belum memerlukan
/// registrasi apa pun.
class MainShellBinding extends Bindings {
  @override
  void dependencies() {
    ActivityBinding().dependencies();
    HomeBinding().dependencies();
    NotificationBinding().dependencies();
    ProfileBinding().dependencies();
  }
}
