import 'package:desa_digital/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class APBDeSection extends StatelessWidget {
  const APBDeSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Menghitung nilai progress
    const double pendapatanReal = 369305706;
    const double targetPendapatan = 1125947389;
    const double progressPercentage = pendapatanReal / targetPendapatan;
    final String percentageText =
        "${(progressPercentage * 100).toStringAsFixed(1)}%";

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(13),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    "APBDes 2026 Pelaksanaan",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                // Body Content
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pendapatan",
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rp 369.305.706,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              Text(
                                "Rp 1.125.947.389,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: LinearProgressIndicator(
                                  value: progressPercentage,
                                  minHeight: 15,
                                  backgroundColor: Colors.grey[200],
                                  color: AppColors.secondary,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Text(
                                  percentageText,
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 11,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Belanja",
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rp 280.178.925,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              Text(
                                "Rp 1.099.315.413,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: LinearProgressIndicator(
                                  value: 0.2,
                                  minHeight: 15,
                                  backgroundColor: Colors.grey[200],
                                  color: AppColors.secondary,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Text(
                                  "25.49%",
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 11,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(13),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    "APBDes 2026 Pendapatan",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                // Body Content
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hasil Usaha Desa",
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rp 0,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              Text(
                                "Rp 24.000.000,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: LinearProgressIndicator(
                                  value: 0.01,
                                  minHeight: 15,
                                  backgroundColor: Colors.grey[200],
                                  color: AppColors.secondary,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Text(
                                  "0%",
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 11,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hasil Aset Desa",
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rp 0,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              Text(
                                "Rp 16.000.000,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: LinearProgressIndicator(
                                  value: 0.01,
                                  minHeight: 15,
                                  backgroundColor: Colors.grey[200],
                                  color: AppColors.secondary,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Text(
                                  "0%",
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 11,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dana Desa",
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rp 149.382.400,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              Text(
                                "Rp 373.456.000,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: LinearProgressIndicator(
                                  value: 0.4,
                                  minHeight: 15,
                                  backgroundColor: Colors.grey[200],
                                  color: AppColors.secondary,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Text(
                                  "40.2%",
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 11,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bagi Hasil Pajak Dan Retribusi",
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rp 0,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              Text(
                                "Rp 41.217.700,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: LinearProgressIndicator(
                                  value: 0.01,
                                  minHeight: 15,
                                  backgroundColor: Colors.grey[200],
                                  color: AppColors.secondary,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Text(
                                  "0%",
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 11,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Alokasi Dana Desa",
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rp 174.647.992,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              Text(
                                "Rp 434.491.400,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: LinearProgressIndicator(
                                  value: 0.4,
                                  minHeight: 15,
                                  backgroundColor: Colors.grey[200],
                                  color: AppColors.secondary,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Text(
                                  "40%",
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 11,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bagi Hasil Pajak Dan Retribusi",
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rp 0,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              Text(
                                "Rp 41.217.700,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: LinearProgressIndicator(
                                  value: 0.01,
                                  minHeight: 15,
                                  backgroundColor: Colors.grey[200],
                                  color: AppColors.secondary,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Text(
                                  "0%",
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 11,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dana Desa",
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rp 149.382.400,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              Text(
                                "Rp 373.456.000,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: LinearProgressIndicator(
                                  value: 0.4,
                                  minHeight: 15,
                                  backgroundColor: Colors.grey[200],
                                  color: AppColors.secondary,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Text(
                                  "40.2%",
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 11,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bantuan Keuangan Provinsi",
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rp 0,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              Text(
                                "Rp 100.000.000,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: LinearProgressIndicator(
                                  value: 0.01,
                                  minHeight: 15,
                                  backgroundColor: Colors.grey[200],
                                  color: AppColors.secondary,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Text(
                                  "0%",
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 11,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bunga Bank",
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rp 90.994,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              Text(
                                "Rp 1.180.417,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: LinearProgressIndicator(
                                  value: 0.07,
                                  minHeight: 15,
                                  backgroundColor: Colors.grey[200],
                                  color: AppColors.secondary,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Text(
                                  "7.71%",
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 11,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(13),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    "APBDes 2026 Pembelanjaan",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                // Body Content
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bidang Penyelenggaraan Pemerintahan",
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rp 173.323.325,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              Text(
                                "Rp 642.272.557,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: LinearProgressIndicator(
                                  value: 0.26,
                                  minHeight: 15,
                                  backgroundColor: Colors.grey[200],
                                  color: AppColors.secondary,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Text(
                                  "26.83%",
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 11,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bidang Pelaksanaan Pembangunan Desa",
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rp 63.372.100,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              Text(
                                "Rp 369.859.500,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: LinearProgressIndicator(
                                  value: 0.17,
                                  minHeight: 15,
                                  backgroundColor: Colors.grey[200],
                                  color: AppColors.secondary,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Text(
                                  "17.13%",
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 11,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bidang Pembinaan Kemasyarakatan Desa",
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rp 0,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              Text(
                                "Rp 26.449.856.00,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: LinearProgressIndicator(
                                  value: 0.01,
                                  minHeight: 15,
                                  backgroundColor: Colors.grey[200],
                                  color: AppColors.secondary,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Text(
                                  "0%",
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 11,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bidang Pemberdayaa Masyarakat Desa",
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rp 39.083.500,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              Text(
                                "Rp 39.083.500,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: LinearProgressIndicator(
                                  value: 1,
                                  minHeight: 15,
                                  backgroundColor: Colors.grey[200],
                                  color: AppColors.secondary,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Text(
                                  "100%",
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 11,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bidang Penanggulangan Bencana, Darurat Dan Mendesak Desa",
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rp 5.400.000,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              Text(
                                "Rp 21.600.000,00",
                                style: Theme.of(context).textTheme.labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: LinearProgressIndicator(
                                  value: 0.25,
                                  minHeight: 15,
                                  backgroundColor: Colors.grey[200],
                                  color: AppColors.secondary,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Text(
                                  "25%",
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 11,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
