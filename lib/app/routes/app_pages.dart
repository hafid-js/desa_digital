import 'package:desa_digital/app/main_shell.dart';
import 'package:desa_digital/app/routes/app_routes.dart';
import 'package:desa_digital/features/activity/screens/activity_screen.dart';
import 'package:desa_digital/features/agenda/screens/agenda_screen.dart';
import 'package:desa_digital/features/agenda/screens/detail_agenda_screen.dart';
import 'package:desa_digital/features/artikel/screens/daftar_artikel_screen.dart';
import 'package:desa_digital/features/artikel/screens/detail_artikel_screen.dart';
import 'package:desa_digital/features/autentikasi/screens/login_screen.dart';
import 'package:desa_digital/features/autentikasi/screens/register/register_step_1_screen.dart';
import 'package:desa_digital/features/autentikasi/screens/register/register_step_2_screen.dart';
import 'package:desa_digital/features/autentikasi/screens/register/register_step_3_screen.dart';
import 'package:desa_digital/features/autentikasi/screens/register/register_step_4_screen.dart';
import 'package:desa_digital/features/cuaca/screens/cuaca_screen.dart';
import 'package:desa_digital/features/lapak_warga/screens/lapak_warga_screen.dart';
import 'package:desa_digital/features/pengaduan/screens/daftar_pengaduan_screen.dart';
import 'package:desa_digital/features/pengaduan/screens/detail_lampiran_screen.dart';
import 'package:desa_digital/features/pengaduan/screens/detail_pengaduan_screen.dart';
import 'package:desa_digital/features/pengaduan/screens/formulir_pengaduan_screen.dart';
import 'package:desa_digital/features/pengaduan/screens/pemilih_lokasi_screen.dart';
import 'package:desa_digital/features/pengaduan/screens/pengaduan_screen.dart';
import 'package:desa_digital/features/peraturan_desa/screens/peraturan_desa_screen.dart';
import 'package:desa_digital/features/profil/screens/detail_profil_screen.dart';
import 'package:desa_digital/features/profil/screens/hapus_akun_screen.dart';
import 'package:desa_digital/features/profil/screens/kata_sandi_baru_screen.dart';
import 'package:desa_digital/features/profil/screens/lupa_password_screen.dart';
import 'package:desa_digital/features/profil/screens/pengaturan_akun_screen.dart';
import 'package:desa_digital/features/profil/screens/ubah_email_screen.dart';
import 'package:desa_digital/features/profil/screens/ubah_kata_sandi_screen.dart';
import 'package:desa_digital/features/profil/screens/ubah_profil_screen.dart';
import 'package:desa_digital/features/profil/screens/ubah_telepon_screen.dart';
import 'package:desa_digital/features/profil/screens/verifikasi_otp_screen.dart';
import 'package:desa_digital/features/surat/screens/daftar_surat_screen.dart';
import 'package:desa_digital/features/surat/screens/keterangan_kelahiran_screen.dart';
import 'package:desa_digital/features/surat/screens/keterangan_kematian_screen.dart';
import 'package:desa_digital/features/surat/screens/permohonan_surat_screen.dart';
import 'package:get/get.dart';

/// Registry halaman aplikasi (composition root).
///
/// Daftar ini adalah satu-satunya tempat yang tahu seluruh screen, sehingga
/// feature tidak perlu mengimpor screen milik feature lain. Binding tiap
/// halaman ditambahkan saat feature-nya dimigrasikan ke layered architecture.
abstract final class AppPages {
  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage<dynamic>(name: Routes.mainShell, page: () => const MainShell()),

    // Autentikasi
    GetPage<dynamic>(name: Routes.login, page: () => const LoginScreen()),
    GetPage<dynamic>(
      name: Routes.registerStep1,
      page: () => const RegisterStep1Screen(),
    ),
    GetPage<dynamic>(
      name: Routes.registerStep2,
      page: () => const RegisterStep2Screen(),
    ),
    GetPage<dynamic>(
      name: Routes.registerStep3,
      page: () => const RegisterStep3Screen(),
    ),
    GetPage<dynamic>(
      name: Routes.registerStep4,
      page: () => const RegisterStep4Screen(),
    ),

    // Aktivitas & Lapak warga
    GetPage<dynamic>(
      name: Routes.aktivitas,
      page: () => const ActivityScreen(),
    ),
    GetPage<dynamic>(
      name: Routes.lapakWarga,
      page: () => const LapakWargaScreen(),
    ),

    // Home
    GetPage<dynamic>(name: Routes.cuaca, page: () => const CuacaScreen()),
    GetPage<dynamic>(
      name: Routes.artikel,
      page: () => const DaftarArtikelScreen(),
    ),

    // Artikel
    GetPage<dynamic>(
      name: Routes.detailArtikel,
      page: () => const DetailArtikelScreen(),
    ),

    // Agenda
    GetPage<dynamic>(name: Routes.agenda, page: () => const AgendaScreen()),
    GetPage<dynamic>(
      name: Routes.detailAgenda,
      page: () => const DetailEventScreen(),
    ),

    // Pengaduan
    GetPage<dynamic>(
      name: Routes.pengaduan,
      page: () => const PengaduanScreen(),
    ),
    GetPage<dynamic>(
      name: Routes.daftarPengaduan,
      page: () => const DaftarPengaduanScreen(),
    ),
    GetPage<dynamic>(
      name: Routes.detailPengaduan,
      page: () => const DetailPengaduanScreen(),
    ),
    GetPage<dynamic>(
      name: Routes.formulirPengaduan,
      page: () => const FormulirPengaduanScreen(),
    ),
    GetPage<dynamic>(
      name: Routes.pilihLokasi,
      page: () => const PemilihLokasiScreen(),
    ),
    GetPage<dynamic>(
      name: Routes.detailLampiran,
      page: () => const DetailLampiranScreen(),
    ),

    // Surat
    GetPage<dynamic>(
      name: Routes.permohonanSurat,
      page: () => const PermohonanSuratScreen(),
    ),
    GetPage<dynamic>(
      name: Routes.daftarSuratMandiri,
      page: () => const DaftarSuratScreen.mandiri(),
    ),
    GetPage<dynamic>(
      name: Routes.daftarSuratPerluProses,
      page: () => const DaftarSuratScreen.perluProses(),
    ),
    GetPage<dynamic>(
      name: Routes.keteranganKelahiran,
      page: () => const KeteranganKelahiranScreen(),
    ),
    GetPage<dynamic>(
      name: Routes.keteranganKematian,
      page: () => const KeteranganKematianScreen(),
    ),

    // Peraturan desa
    GetPage<dynamic>(
      name: Routes.peraturanDesa,
      page: () => const PeraturanDesaScreen(),
    ),

    // Profil
    GetPage<dynamic>(
      name: Routes.detailProfil,
      page: () => const DetailProfilScreen(),
    ),
    GetPage<dynamic>(
      name: Routes.ubahProfil,
      page: () => const UbahProfilScreen(),
    ),
    GetPage<dynamic>(name: Routes.ubahEmail, page: () => UbahEmailScreen()),
    GetPage<dynamic>(
      name: Routes.ubahTelepon,
      page: () => const UbahTeleponScreen(),
    ),
    GetPage<dynamic>(
      name: Routes.ubahKataSandi,
      page: () => const UbahKataSandiScreen(),
    ),
    GetPage<dynamic>(
      name: Routes.kataSandiBaru,
      page: () => const KataSandiBaruScreen(),
    ),
    GetPage<dynamic>(
      name: Routes.pengaturanAkun,
      page: () => const PengaturanAkunScreen(),
    ),
    GetPage<dynamic>(
      name: Routes.hapusAkun,
      page: () => const HapusAkunScreen(),
    ),
    GetPage<dynamic>(
      name: Routes.lupaPassword,
      page: () => LupaPasswordScreen(),
    ),
    GetPage<dynamic>(
      name: Routes.verifikasiOtp,
      page: () => const VerifikasiOtpScreen(),
    ),
  ];
}
