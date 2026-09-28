import 'package:desa_digital/core/constants/app_assets.dart';
import 'package:desa_digital/features/agenda/screens/agenda_screen.dart';
import 'package:desa_digital/features/pengaduan/screens/pengaduan_screen.dart';
import 'package:desa_digital/features/home/data/models/home_menu_item.dart';
import 'package:desa_digital/features/surat/screens/permohonan_surat_screen.dart';
import 'package:desa_digital/features/peraturan_desa/screens/peraturan_desa_screen.dart';

final List<HomeMenuItem> homeMenuItems = [
  HomeMenuItem(
    title: 'Aduan',
    icon: AppAssets.menuComplaint,
    pageBuilder: () => const PengaduanScreen(),
  ),

  HomeMenuItem(
    title: 'Acara',
    icon: AppAssets.menuEvent,
    pageBuilder: () => const AgendaScreen(),
  ),
  HomeMenuItem(
    title: 'Peraturan Desa',
    icon: AppAssets.menuVillageRegulation,
    pageBuilder: () => const PeraturanDesaScreen(),
  ),
  HomeMenuItem(
    title: 'Layanan Mandiri',
    icon: AppAssets.menuLetterRequest,
    pageBuilder: () => const PermohonanSuratScreen(),
  ),
];
