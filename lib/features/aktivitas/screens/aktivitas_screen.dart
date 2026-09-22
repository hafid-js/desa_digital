import 'package:desa_digital/core/utils/constants/app_colors.dart';
import 'package:desa_digital/features/aduan/screens/detail_aduan_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AktivitasScreen extends StatelessWidget {
  const AktivitasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Aktivitas",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            overlayColor: WidgetStateProperty.all(
              AppColors.secondary.withAlpha(40),
            ),
            indicatorColor: AppColors.secondary,
            indicatorSize: TabBarIndicatorSize.label,
            dividerColor: Colors.transparent,
            unselectedLabelColor: Colors.grey,
            labelColor: AppColors.secondary,
            labelStyle: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w700),
            indicator: UnderlineTabIndicator(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              borderSide: BorderSide(color: AppColors.secondary, width: 3),
            ),

            tabs: [
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Iconsax.note_1),
                    SizedBox(width: 6),
                    Text('Laporan Saya'),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.bookmark_outline),
                    SizedBox(width: 6),
                    Text('Disimpan'),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [_buildLaporanSaya(context), _buildDisimpan()],
        ),
      ),
    );
  }

  Widget _buildLaporanSaya(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
                              "Proses",
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
                              "Selesai",
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
                            right: 12,
                            left: 12,
                            top: 6,
                            bottom: 0,
                          ),
                          child: GestureDetector(
                            onTap: () => Get.to(() => DetailAduanScreen()),
                            child: Container(
                              padding: EdgeInsets.only(
                                right: 8,
                                left: 8,
                                top: 8,
                                bottom: 14,
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
                                          "LGWS67947799",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                color: AppColors.primary,
                                                fontSize: 12,
                                              ),
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
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "• ",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge!
                                                    .copyWith(fontSize: 12),
                                              ),
                                              TextSpan(
                                                text:
                                                    "Sukoharjo, 6 jam yang lalu",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall!
                                                    .copyWith(fontSize: 11),
                                              ),
                                            ],
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 12,
                                                vertical: 8,
                                              ),
                                              decoration: BoxDecoration(
                                                color: AppColors.secondary
                                                    .withAlpha(40),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Text(
                                                "Progress",
                                                style: TextStyle(
                                                  color: AppColors.secondary,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 5),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 12,
                                                vertical: 8,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withAlpha(30),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.lock_open_rounded, size: 12),
                                                  SizedBox(width: 5),
                                                  Text(
                                                "Publik",
                                                style: TextStyle(
                                                  color: AppColors.textPrimaryLight,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                                ],
                                              )
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
                            right: 12,
                            left: 12,
                            top: 6,
                            bottom: 0,
                          ),
                          child: GestureDetector(
                            onTap: () => Get.to(() => DetailAduanScreen()),
                            child: Container(
                              padding: EdgeInsets.only(
                                right: 12,
                                left: 8,
                                top: 8,
                                bottom: 8,
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
                                        Text(
                                          "17 Sept 2026",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall!
                                                    .copyWith(fontSize: 11),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                           SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 12,
                                                vertical: 8,
                                              ),
                                              decoration: BoxDecoration(
                                                color: AppColors.quartenary
                                                    .withAlpha(40),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Text(
                                                "Selesai",
                                                style: TextStyle(
                                                  color: AppColors.quartenary,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 5),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 12,
                                                vertical: 8,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withAlpha(30),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.lock_open_rounded, size: 12),
                                                  SizedBox(width: 5),
                                                  Text(
                                                "Publik",
                                                style: TextStyle(
                                                  color: AppColors.textPrimaryLight,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                                ],
                                              )
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
    );
  }

  Widget _buildDisimpan() {
    return DefaultTabController(
      length: 2,
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
                              "Aduan Masyarakat",
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
                              "Berita",
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
                            right: 12,
                            left: 12,
                            top: 6,
                            bottom: 0,
                          ),
                          child: GestureDetector(
                            onTap: () => Get.to(() => DetailAduanScreen()),
                            child: Container(
                              padding: EdgeInsets.only(
                                right: 8,
                                left: 8,
                                top: 8,
                                bottom: 14,
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
                                          "LGWS67947799",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                color: AppColors.primary,
                                                fontSize: 12,
                                              ),
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
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "• ",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge!
                                                    .copyWith(fontSize: 12),
                                              ),
                                              TextSpan(
                                                text:
                                                    "Sukoharjo, 6 jam yang lalu",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall!
                                                    .copyWith(fontSize: 11),
                                              ),
                                            ],
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 12,
                                                vertical: 8,
                                              ),
                                              decoration: BoxDecoration(
                                                color: AppColors.quartenary
                                                    .withAlpha(40),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Text(
                                                "Selesai",
                                                style: TextStyle(
                                                  color: AppColors.quartenary,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.bookmark,
                                              color: AppColors.primary,
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
                            right: 12,
                            left: 12,
                            top: 6,
                            bottom: 0,
                          ),
                          child: GestureDetector(
                            onTap: () => Get.to(() => DetailAduanScreen()),
                            child: Container(
                              padding: EdgeInsets.only(
                                right: 12,
                                left: 8,
                                top: 8,
                                bottom: 8,
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
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                       
                                        Text(
                                          "17 Sept 2026",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall!
                                                    .copyWith(fontSize: 11),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Icon(
                                              Icons.bookmark_outline_outlined,
                                              color: AppColors.primary,
                                              size: 30,
                                            ),
                                          ],
                                        )
                                        
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
    );
  }
}
