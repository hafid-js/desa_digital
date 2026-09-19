import 'package:desa_digital/core/utils/constants/app_colors.dart';
import 'package:desa_digital/features/aduan/screens/detail_aduan_screen.dart';
import 'package:desa_digital/features/artikel/screens/detail_artikel_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class BeritaScreen extends StatelessWidget {
  const BeritaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "Warta Desa",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
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
                      padding: EdgeInsets.all(16),
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
                                "Publik",
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
                                "Rilis",
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
                                "Berita Daerah",
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
                                "Berita OPD",
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
                      ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              right: 16,
                              left: 16,
                              top: 6,
                           bottom: 6
                            ),
                            child: GestureDetector(
                              onTap: () => Get.to(() => DetailArtikelScreen()),
                              child: Container(
                                padding: EdgeInsets.only(
                                  right: 12,
                                  left: 8,
                                 top: 6, bottom: 6
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border(
                                    left: BorderSide(
                                      width: 0.2,
                                      color: AppColors.primary,
                                    ),
                                    right: BorderSide(
                                      width: 0.2,
                                      color: AppColors.primary,
                                    ),
                                    bottom: BorderSide(
                                      width: 0.2,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        "assets/images/aduan/aduan.png",
                                        height: 70,
                                        width: 70,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Kala Gelaran Final MTQ 2026 di Jateng Pukau Ribuan Orang",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            "Judul : Gapura PRPP | Lokasi : Gapura PRPP Puri Anjasmoro | Deskripsi Laporan : Gapura PRPP yg lampu merah, mohon di perhatikan",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall!
                                                .copyWith(color: Colors.black),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "17 Sept 2026",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall!
                                                    .copyWith(
                                                      fontSize: 11,
                                                      color: Colors.black54,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Icon(
                                                Icons.bookmark_rounded,
                                                color: AppColors.grey,
                                                size: 30,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              right: 16,
                              left: 16,
                              top: 6,
                           bottom: 6
                            ),
                            child: GestureDetector(
                              onTap: () => Get.to(() => DetailArtikelScreen()),
                              child: Container(
                                padding: EdgeInsets.only(
                                  right: 12,
                                  left: 8,
                                 top: 6, bottom: 6
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border(
                                    left: BorderSide(
                                      width: 0.2,
                                      color: AppColors.primary,
                                    ),
                                    right: BorderSide(
                                      width: 0.2,
                                      color: AppColors.primary,
                                    ),
                                    bottom: BorderSide(
                                      width: 0.2,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        "assets/images/aduan/aduan.png",
                                        height: 70,
                                        width: 70,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Timsel Calon Anggota Komisi Informasi Jamin Kerahasiaan Soal Seleksi",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  color: AppColors.primary,
                                                ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            "Judul : Gapura PRPP | Lokasi : Gapura PRPP Puri Anjasmoro | Deskripsi Laporan : Gapura PRPP yg lampu merah, mohon di perhatikan",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall!
                                                .copyWith(color: Colors.black),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "17 Sept 2026",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall!
                                                    .copyWith(
                                                      fontSize: 11,
                                                      color: Colors.black54,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Icon(
                                                Icons.bookmark_rounded,
                                                color: AppColors.grey,
                                                size: 30,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              right: 16,
                              left: 16,
                              top: 6,
                           bottom: 6
                            ),
                            child: GestureDetector(
                              onTap: () => Get.to(() => DetailArtikelScreen()),
                              child: Container(
                                padding: EdgeInsets.only(
                                  right: 12,
                                  left: 8,
                                 top: 6, bottom: 6
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border(
                                    left: BorderSide(
                                      width: 0.2,
                                      color: AppColors.primary,
                                    ),
                                    right: BorderSide(
                                      width: 0.2,
                                      color: AppColors.primary,
                                    ),
                                    bottom: BorderSide(
                                      width: 0.2,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        "assets/images/aduan/aduan.png",
                                        height: 70,
                                        width: 70,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Timsel Calon Anggota Komisi Informasi Jamin Kerahasiaan Soal Seleksi",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  color: AppColors.primary,
                                                ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            "Judul : Gapura PRPP | Lokasi : Gapura PRPP Puri Anjasmoro | Deskripsi Laporan : Gapura PRPP yg lampu merah, mohon di perhatikan",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall!
                                                .copyWith(color: Colors.black),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "17 Sept 2026",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall!
                                                    .copyWith(
                                                      fontSize: 11,
                                                      color: Colors.black54,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Icon(
                                                Icons.bookmark_rounded,
                                                color: AppColors.grey,
                                                size: 30,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              right: 16,
                              left: 16,
                              top: 6,
                           bottom: 6
                            ),
                            child: GestureDetector(
                              onTap: () => Get.to(() => DetailArtikelScreen()),
                              child: Container(
                                padding: EdgeInsets.only(
                                  right: 12,
                                  left: 8,
                                 top: 6, bottom: 6
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border(
                                    left: BorderSide(
                                      width: 0.2,
                                      color: AppColors.primary,
                                    ),
                                    right: BorderSide(
                                      width: 0.2,
                                      color: AppColors.primary,
                                    ),
                                    bottom: BorderSide(
                                      width: 0.2,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        "assets/images/aduan/aduan.png",
                                        height: 70,
                                        width: 70,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Timsel Calon Anggota Komisi Informasi Jamin Kerahasiaan Soal Seleksi",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  color: AppColors.primary,
                                                ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            "Judul : Gapura PRPP | Lokasi : Gapura PRPP Puri Anjasmoro | Deskripsi Laporan : Gapura PRPP yg lampu merah, mohon di perhatikan",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall!
                                                .copyWith(color: Colors.black),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "17 Sept 2026",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall!
                                                    .copyWith(
                                                      fontSize: 11,
                                                      color: Colors.black54,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Icon(
                                                Icons.bookmark_rounded,
                                                color: AppColors.grey,
                                                size: 30,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
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
