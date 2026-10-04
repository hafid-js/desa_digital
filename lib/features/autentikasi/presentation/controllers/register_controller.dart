import 'package:desa_digital/app/routes/app_routes.dart';
import 'package:desa_digital/features/autentikasi/domain/entities/register_step.dart';
import 'package:desa_digital/features/autentikasi/domain/usecases/next_register_step.dart';
import 'package:get/get.dart';

/// Mengatur alur registrasi: tahap yang sedang aktif dan navigasi ke tahap
/// berikutnya, serta status tampilnya password pada tahap pembuatan kata sandi.
class RegisterController extends GetxController {
  RegisterController(this._nextStep);

  final NextRegisterStep _nextStep;

  final Rx<RegisterStep> langkah = RegisterStep.email.obs;

  /// `true` berarti password masih tersembunyi.
  final RxBool sembunyikanPassword = true.obs;

  void togglePassword() =>
      sembunyikanPassword.value = !sembunyikanPassword.value;

  /// Pindah ke tahap registrasi berikutnya. Mengembalikan `false` bila tidak
  /// ada tahap berikutnya.
  bool lanjut() {
    final berikutnya = _nextStep(langkah.value).valueOrNull;
    if (berikutnya == null) return false;
    return goto(berikutnya);
  }

  bool goto(RegisterStep step) {
    langkah.value = step;
    Get.toNamed(_routeOf(step));
    return true;
  }

  /// Tombol terakhir registrasi mengirim kode verifikasi ke nomor Whatsapp.
  void gotoVerifikasiOtp() => Get.toNamed(Routes.verifikasiOtp);

  static String _routeOf(RegisterStep step) => switch (step) {
    RegisterStep.email => Routes.registerStep1,
    RegisterStep.namaLengkap => Routes.registerStep2,
    RegisterStep.kataSandi => Routes.registerStep3,
    RegisterStep.whatsapp => Routes.registerStep4,
  };
}
