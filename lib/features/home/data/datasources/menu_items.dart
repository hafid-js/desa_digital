import 'package:desa_digital/features/acara/screens/event_screen.dart';
import 'package:desa_digital/features/aduan/screens/aduan_screen.dart';
import 'package:desa_digital/features/pengajuan_surat/screens/pengajuan_surat_screen.dart';
import 'package:desa_digital/features/peraturan_desa/screens/peraturan_desa_screen.dart';

final List<Map<String, dynamic>> menuItems = [
  {
    "title": "Aduan",
    "icon": "assets/icons/aduan-masyarakat.png",
    "page": () => const AduanScreen(),
  },
  // {
  //   "title": "Antrean Faskes",
  //   "icon": "assets/icons/antrean-faskes.png",
  //   "page": () => const AduanScreen(),
  // },
  {
    "title": "Acara",
    "icon": "assets/icons/event-jateng.png",
    "page": () => const EventScreen(),
  },
  {
    "title": "Peraturan Desa",
    "icon": "assets/icons/informasi-publik.png",
    "page": () => const PeraturanDesaScreen(),
  },
   {
    "title": "Pengajuan Surat",
    "icon": "assets/icons/perizinan-ptsp.png",
    "page": () => const PengajuanSuratScreen(),
  },
  //   {
  //   "title": "Bursa Kerja",
  //   "icon": "assets/icons/bursa-kerja.png",
  //   "page": () => const AduanScreen(),
  // },
  // {
  //   "title": "Trans Jateng",
  //   "icon": "assets/icons/trans-jateng.png",
  //   "page": () => const AduanScreen(),
  // },
  // {
  //   "title": "Zilenial Jateng",
  //   "icon": "assets/icons/zilenial-jateng.png",
  //   "page": () => const AduanScreen(),
  // },
  // {
  //   "title": "Semua",
  //   "icon": "assets/icons/semua.png",
  //   "page": () => const AduanScreen(),
  // },
];
