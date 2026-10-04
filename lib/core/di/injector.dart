import 'package:get/get.dart';

typedef DependencyBuilder<T extends Object> = T Function();

/// Fasad tipis di atas container GetX.
///
/// Dipakai hanya di composition root (`app/bindings`) dan presentation
/// controller, sehingga tipe GetX tidak bocor ke domain maupun data layer.
abstract final class Injector {
  /// Mendaftarkan dependency.
  ///
  /// [lazy] menunda pembuatan instance sampai pertama kali diminta, sedangkan
  /// [permanent] membuat instance bertahan selama aplikasi hidup. Keduanya
  /// tidak digabung: GetX hanya mendukung `permanent` pada registrasi langsung.
  static void register<T extends Object>(
    DependencyBuilder<T> builder, {
    bool lazy = false,
    String? tag,
    bool permanent = false,
  }) {
    if (lazy && !permanent) {
      Get.lazyPut<T>(builder, tag: tag);
    } else {
      Get.put<T>(builder(), tag: tag, permanent: permanent);
    }
  }

  static T resolve<T extends Object>({String? tag}) => Get.find<T>(tag: tag);

  static T? maybeResolve<T extends Object>({String? tag}) =>
      Get.isRegistered<T>(tag: tag) ? Get.find<T>(tag: tag) : null;

  static bool isRegistered<T extends Object>({String? tag}) =>
      Get.isRegistered<T>(tag: tag);

  static void unregister<T extends Object>({String? tag}) =>
      Get.delete<T>(tag: tag);
}
