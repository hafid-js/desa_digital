import 'package:desa_digital/core/constants/app_assets.dart';
import 'package:desa_digital/core/constants/app_colors.dart';
import 'package:desa_digital/features/artikel/data/kategori_artikel.dart';
import 'package:flutter/material.dart';

class KartuDaftarArtikel extends StatelessWidget {
  const KartuDaftarArtikel({
    super.key,
    required this.title,
    required this.titleColor,
    required this.onTap,
    this.titleFontWeight,
  });

  final String title;
  final Color titleColor;
  final FontWeight? titleFontWeight;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 6, bottom: 6),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.only(right: 12, left: 8, top: 6, bottom: 6),
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
                      title,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: titleColor,
                        fontWeight: titleFontWeight,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    SizedBox(height: 5),
                    Text(
                      articleDescription,
                      style: Theme.of(
                        context,
                      ).textTheme.labelSmall!.copyWith(color: Colors.black),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          articleDate,
                          style: Theme.of(context).textTheme.labelSmall!
                              .copyWith(
                                fontSize: 11,
                                color: AppColors.textSecondaryLight,
                                fontWeight: FontWeight.w500,
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
  }
}
