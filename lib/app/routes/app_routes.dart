/// Daftar nama route aplikasi.
///
/// Screen tidak saling mengimpor antar-feature; perpindahan halaman selalu
/// lewat nama route di sini agar dependensi antar-feature tidak tumbuh.
///
/// Layar yang membutuhkan parameter (misalnya `FormulirSuratMandiriScreen`
/// yang menerima objek surat) tetap dipanggil langsung lewat `Get.to` dengan
/// builder, agar tipe parameter tetap dijaga compiler.
abstract final class Routes {
  // Kerangka aplikasi
  static const String mainShell = '/';

  // Autentikasi
  static const String login = '/login';
  static const String registerStep1 = '/register/step-1';
  static const String registerStep2 = '/register/step-2';
  static const String registerStep3 = '/register/step-3';
  static const String registerStep4 = '/register/step-4';

  // Aktivitas
  static const String aktivitas = '/aktivitas';

  // Lapak warga
  static const String lapakWarga = '/lapak-warga';

  // Home
  static const String cuaca = '/home/cuaca';
  static const String artikel = '/home/artikel';

  // Artikel
  static const String detailArtikel = '/artikel/detail';

  // Agenda
  static const String agenda = '/agenda';
  static const String detailAgenda = '/agenda/detail';

  // Peraturan desa
  static const String peraturanDesa = '/peraturan-desa';

  // Pengaduan
  static const String pengaduan = '/pengaduan';
  static const String daftarPengaduan = '/pengaduan/daftar';
  static const String detailPengaduan = '/pengaduan/detail';
  static const String formulirPengaduan = '/pengaduan/formulir';
  static const String pilihLokasi = '/pengaduan/lokasi';
  static const String detailLampiran = '/pengaduan/lampiran';

  // Surat
  static const String permohonanSurat = '/surat/permohonan';
  static const String daftarSuratMandiri = '/surat/daftar-mandiri';
  static const String daftarSuratPerluProses = '/surat/daftar-perlu-proses';
  static const String keteranganKelahiran = '/surat/keterangan-kelahiran';
  static const String keteranganKematian = '/surat/keterangan-kematian';

  // Profil
  static const String detailProfil = '/profil/detail';
  static const String ubahProfil = '/profil/ubah';
  static const String ubahEmail = '/profil/ubah-email';
  static const String ubahTelepon = '/profil/ubah-telepon';
  static const String ubahKataSandi = '/profil/ubah-kata-sandi';
  static const String kataSandiBaru = '/profil/kata-sandi-baru';
  static const String pengaturanAkun = '/profil/pengaturan';
  static const String hapusAkun = '/profil/hapus-akun';
  static const String lupaPassword = '/profil/lupa-password';
  static const String verifikasiOtp = '/profil/verifikasi-otp';
}
