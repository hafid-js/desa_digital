/// Tahapan registrasi akun yang harus dilalui pengguna secara berurutan.
enum RegisterStep { email, namaLengkap, kataSandi, whatsapp }

extension RegisterStepX on RegisterStep {
  /// Nomor tahap untuk ditampilkan pada scaffold registrasi (dimulai dari 1).
  int get nomor => index + 1;

  /// Jumlah total tahap registrasi.
  static int get total => RegisterStep.values.length;
}
