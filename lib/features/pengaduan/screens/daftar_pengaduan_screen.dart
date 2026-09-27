import 'package:desa_digital/core/constants/app_assets.dart';
import 'package:desa_digital/core/constants/app_colors.dart';
import 'package:desa_digital/features/pengaduan/screens/detail_pengaduan_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DaftarPengaduanScreen extends StatelessWidget {
  const DaftarPengaduanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "Aduan Masyarakat",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              right: 6,
              left: 6,
              top: 6,
              bottom: 0,
            ),
            child: GestureDetector(
              onTap: () => Get.to(() => DetailPengaduanScreen()),
              child: Container(
                padding: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border(
                    left: BorderSide(width: 0.2, color: AppColors.primary),
                    right: BorderSide(width: 0.2, color: AppColors.primary),
                    bottom: BorderSide(width: 0.2, color: AppColors.primary),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        AppAssets.complaintThumbnail,
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            "LGWS67947799",
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(
                                  color: AppColors.primary,
                                  fontSize: 12,
                                ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Judul : Gapura PRPP | Lokasi : Gapura PRPP Puri Anjasmoro | Deskripsi Laporan : Gapura PRPP yg lampu merah, mohon di perhatikan",
                            style: Theme.of(context).textTheme.labelSmall!
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
                                  style: Theme.of(context).textTheme.labelLarge!
                                      .copyWith(fontSize: 12),
                                ),
                                TextSpan(
                                  text: "Sukoharjo, 6 jam yang lalu",
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .copyWith(fontSize: 11),
                                ),
                              ],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withAlpha(40),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "Disposisi",
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.bookmark_border_outlined,
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
    );
  }
}
