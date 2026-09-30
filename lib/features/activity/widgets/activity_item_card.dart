import 'package:desa_digital/core/constants/app_assets.dart';
import 'package:desa_digital/core/constants/app_colors.dart';
import 'package:desa_digital/features/activity/data/activity_items.dart';
import 'package:flutter/material.dart';

class ActivityItemCard extends StatelessWidget {
  const ActivityItemCard({
    super.key,
    required this.item,
    required this.footer,
    required this.onTap,
    this.meta,
    this.cardPadding = const EdgeInsets.only(
      right: 12,
      left: 8,
      top: 8,
      bottom: 8,
    ),
  });

  final ActivityItem item;

  final Widget? meta;
  final Widget footer;
  final VoidCallback onTap;
  final EdgeInsets cardPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, left: 12, top: 6, bottom: 0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: cardPadding,
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
                    if (item.isReportCode)
                      Text(
                        item.title,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColors.primary,
                          fontSize: 12,
                        ),
                      )
                    else
                      Text(
                        item.title,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColors.primary,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    SizedBox(height: 5),
                    Text(
                      activityDescription,
                      style: Theme.of(
                        context,
                      ).textTheme.labelSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    if (meta != null) ...[meta!, SizedBox(height: 15)],
                    footer,
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
