import 'package:desa_digital/core/constants/app_assets.dart';
import 'package:desa_digital/core/constants/app_colors.dart';
import 'package:desa_digital/core/widgets/pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PeraturanDesaScreen extends StatelessWidget {
  const PeraturanDesaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Peraturan Desa",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PdfViewer(
                      pdfPath: AppAssets.villageRegulationLkdCepedak2021,
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
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
                            "PERATURAN DESA GUNUNGCONDONG NOMOR 8 TAHUN 2021 TENTANG LEMBAGA KEMASYARAKATAN DESA",
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(
                                  color: AppColors.primary,
                                  fontSize: 12,
                                ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "PERATURAN DESA GUNUNGCONDONG NOMOR 8 TAHUN 2021 TENTANG LEMBAGA KEMASYARAKATAN DESA",
                            style: Theme.of(context).textTheme.labelSmall!
                                .copyWith(color: Colors.black),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Iconsax.calendar5,
                                    color: AppColors.primary,
                                    size: 15,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    "03 Januari 2025",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.person_rounded,
                                      color: AppColors.primary,
                                      size: 15,
                                    ),
                                    SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        "Admin",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w300,
                                            ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.bookmark_rounded,
                                color: AppColors.primary,
                                size: 15,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "Peraturan Desa Gunung Condong",
                                style: Theme.of(context).textTheme.labelSmall!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
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
