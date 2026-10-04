import 'package:desa_digital/app/routes/app_routes.dart';
import 'package:desa_digital/core/constants/app_assets.dart';
import 'package:desa_digital/features/home/data/models/home_menu_item.dart';

final List<HomeMenuItem> homeMenuItems = [
  HomeMenuItem(
    title: 'Aduan',
    icon: AppAssets.menuComplaint,
    route: Routes.pengaduan,
  ),

  HomeMenuItem(title: 'Acara', icon: AppAssets.menuEvent, route: Routes.agenda),
  // HomeMenuItem(
  //   title: 'Peraturan Desa',
  //   icon: AppAssets.menuVillageRegulation,
  //   route: Routes.peraturanDesa,
  // ),
  HomeMenuItem(
    title: 'Layanan Mandiri',
    icon: AppAssets.menuLetterRequest,
    route: Routes.permohonanSurat,
  ),
  HomeMenuItem(
    title: 'Lapak Warga',
    icon: AppAssets.menuBursaKerja,
    route: Routes.lapakWarga,
  ),
  //  HomeMenuItem(
  //   title: 'Register',
  //   icon: AppAssets.menuEvent,
  //   route: Routes.registerStep1,
  // ),
];
