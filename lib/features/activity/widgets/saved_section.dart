import 'package:desa_digital/core/constants/app_colors.dart';
import 'package:desa_digital/core/widgets/label_pill.dart';
import 'package:desa_digital/features/activity/data/activity_items.dart';
import 'package:desa_digital/features/activity/widgets/activity_item_card.dart';
import 'package:desa_digital/features/activity/widgets/activity_list.dart';
import 'package:desa_digital/features/activity/widgets/activity_meta.dart';
import 'package:desa_digital/features/activity/widgets/activity_tab_section.dart';
import 'package:desa_digital/features/pengaduan/screens/detail_pengaduan_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SavedSection extends StatelessWidget {
  const SavedSection({super.key});

  void _openDetail() => Get.to(() => DetailPengaduanScreen());

  @override
  Widget build(BuildContext context) {
    return ActivityTabSection(
      labels: const ["Aduan Masyarakat", "Berita"],
      tabs: [
        ActivityList(
          items: savedComplaints,
          itemBuilder: (item) => ActivityItemCard(
            item: item,
            cardPadding: activityReportCardPadding,
            meta: BulletMeta(text: item.meta),
            footer: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelPill(
                  label: "Selesai",
                  color: AppColors.quartenary,
                  backgroundColor: AppColors.quartenary.withAlpha(40),
                ),
                Icon(Icons.bookmark, color: AppColors.primary, size: 30),
              ],
            ),
            onTap: _openDetail,
          ),
        ),
        ActivityList(
          items: savedNews,
          itemBuilder: (item) => ActivityItemCard(
            item: item,
            footer: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateText(text: item.meta),
                Icon(
                  Icons.bookmark_outline_outlined,
                  color: AppColors.primary,
                  size: 30,
                ),
              ],
            ),
            onTap: _openDetail,
          ),
        ),
      ],
    );
  }
}
