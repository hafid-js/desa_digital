import 'package:desa_digital/core/utils/constants/app_colors.dart';
import 'package:desa_digital/features/notifikasi/screens/widgets/notif_list_tile.dart';
import 'package:desa_digital/features/notifikasi/screens/widgets/notifikasi_kosong_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NotifikasiScreen extends StatefulWidget {
  const NotifikasiScreen({super.key});

  @override
  State<NotifikasiScreen> createState() => _NotifikasiScreenState();
}

bool tap = false;

class _NotifikasiScreenState extends State<NotifikasiScreen> {
  bool isBeritaTerkini = false;
  bool isPeringatanCuaca = false;
  bool isEventDesa = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "Notifikasi",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (context, modalSetState) {
                      return Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pengaturan Notifikasi",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Pilih notifikasi yang kamu ingin terima",
                              style: Theme.of(context).textTheme.labelSmall!
                                  .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                            NotifListTile(
                              icon: Iconsax.book,
                              title: "Berita Terkini",
                              subtitle: "Informasi terbaru seputar Desa",
                              value: isBeritaTerkini,
                              onChanged: (v) {
                                modalSetState(() {
                                  isBeritaTerkini = v;
                                });
                              },
                            ),
                            NotifListTile(
                              icon: Iconsax.cloud_drizzle,
                              title: "Peringatan Dini Cuaca",
                              subtitle:
                                  "Informasi potensi cuaca buruk di wilayah Desa",
                              value: isPeringatanCuaca,
                              onChanged: (v) {
                                modalSetState(() {
                                  isPeringatanCuaca = v;
                                });
                              },
                            ),
                            NotifListTile(
                              icon: Iconsax.calendar_1,
                              title: "Event Desa Hari Ini",
                              subtitle: "Informasi acara di Desa hari ini",
                              value: isEventDesa,
                              onChanged: (v) {
                                modalSetState(() {
                                  isEventDesa = v;
                                });
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(double.infinity, 48),
                                  backgroundColor: AppColors.primary,
                                  foregroundColor: AppColors.primary,
                                  elevation: 0,
                                  side: BorderSide.none,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: Text(
                                  "Simpan",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            },
            child: Icon(Iconsax.setting_2, color: AppColors.primary),
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 12),
      ),
      body: DefaultTabController(
        length: 4,
        child: Builder(
          builder: (context) {
            final controller = DefaultTabController.of(context);

            return Column(
              children: [
                AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    final selectedIndex = controller.index;

                    return Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => controller.animateTo(0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 14,
                              ),
                              decoration: BoxDecoration(
                                color: selectedIndex == 0
                                    ? AppColors.primary
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "Semua",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelSmall
                                    ?.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: selectedIndex == 0
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),

                          GestureDetector(
                            onTap: () => controller.animateTo(1),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 14,
                              ),
                              decoration: BoxDecoration(
                                color: selectedIndex == 1
                                    ? AppColors.primary
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "Aduan",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelSmall
                                    ?.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: selectedIndex == 1
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),

                          GestureDetector(
                            onTap: () => controller.animateTo(2),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 14,
                              ),
                              decoration: BoxDecoration(
                                color: selectedIndex == 2
                                    ? AppColors.primary
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "Event",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelSmall
                                    ?.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: selectedIndex == 2
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),

                          GestureDetector(
                            onTap: () => controller.animateTo(3),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 14,
                              ),
                              decoration: BoxDecoration(
                                color: selectedIndex == 3
                                    ? AppColors.primary
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "Berita",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelSmall
                                    ?.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: selectedIndex == 3
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                Expanded(
                  child: TabBarView(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  tap = true;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: tap ? AppColors.light : Colors.white,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: AppColors.secondary
                                          .withAlpha(40),
                                      child: Icon(
                                        Iconsax.menu_board,
                                        color: AppColors.secondary,
                                        size: 20,
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Event Desa Hari Ini",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  fontWeight: tap
                                                      ? FontWeight.w400
                                                      : FontWeight.bold,
                                                ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            "Husabaqah Tilawatil Qur'an (MTq) Tingkat Nasional XXI Tahun 2026 Berlangsung Di Kota Semarang",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall!
                                                .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            "13 jam yang lalu",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall!
                                                .copyWith(fontSize: 11),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Garis bawah yang dipendekkan (tidak full)
                            Divider(
                              color: AppColors.grey.withAlpha(180),
                              thickness: 0.5,
                              height: 1,
                              indent: 16, // Jarak dari batas kiri
                              endIndent: 16, // Jarak dari batas kanan
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  tap = true;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: tap ? AppColors.light : Colors.white,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: AppColors.secondary
                                          .withAlpha(40),
                                      child: Icon(
                                        Iconsax.menu_board,
                                        color: AppColors.secondary,
                                        size: 20,
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Event Desa Hari Ini",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  fontWeight: tap
                                                      ? FontWeight.w400
                                                      : FontWeight.bold,
                                                ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            "Husabaqah Tilawatil Qur'an (MTq) Tingkat Nasional XXI Tahun 2026 Berlangsung Di Kota Semarang",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall!
                                                .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            "13 jam yang lalu",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall!
                                                .copyWith(fontSize: 11),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      NotifikasiKosongScreen(),
                      NotifikasiKosongScreen(),
                      NotifikasiKosongScreen(),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
