import 'package:desa_digital/core/constants/app_colors.dart';
import 'package:desa_digital/features/surat/screens/daftar_surat_screen.dart';
import 'package:desa_digital/core/widgets/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class PermohonanSuratScreen extends StatelessWidget {
  const PermohonanSuratScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pengajuan Surat",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSectionHeading(
                title: "Status Surat",
                buttonTitle: "Lihat Semua",
              ),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Surat Keterangan Usaha",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.quartenary.withAlpha(40),
                            borderRadius: BorderRadius.circular(20),
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
                      ],
                    ),
                    Text(
                      "Diajukan: 02 September 2025",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontSize: 11,
                        color: Colors.black87,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 40),
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.primary,
                        elevation: 0,
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.download_rounded, color: Colors.white),
                          SizedBox(width: 5),
                          Text(
                            "Download PDF",
                            style: Theme.of(context).textTheme.labelMedium!
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pengajuan Surat",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    "Ajukan pembuatan surat yang sesuai kebutuhan Anda, Pilih Kategori dibawah ini.",
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 11,
                      color: Colors.black87,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Expanded(
                        child: _buildSuratCard(
                          context,
                          title: "Surat Keterangan",
                          countText: "3 Jenis Surat",
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildSuratCard(
                          context,
                          title: "Surat Pengantar",
                          countText: "2 Jenis Surat",
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildSuratCard(
                          context,
                          title: "Surat Pernyataan",
                          countText: "4 Jenis Surat",
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildSuratCard(
  BuildContext context, {
  required String title,
  required String countText,
}) {
  return GestureDetector(
    onTap: () {
      if (title == "Surat Keterangan") {
        Get.to(() => DaftarSuratScreen());
      } else if (title == "Surat Pengantar") {
        Get.to(() => DaftarSuratScreen());
      } else {
        Get.to(() => DaftarSuratScreen());
      }
    },
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: FaIcon(
              FontAwesomeIcons.fileLines,
              size: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                countText,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontSize: 11,
                  color: Colors.black87,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Icon(
                Iconsax.arrow_right_3,
                size: 15,
                color: Colors.black54,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
