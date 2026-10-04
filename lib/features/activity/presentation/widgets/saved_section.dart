import 'package:desa_digital/app/routes/app_routes.dart';
import 'package:desa_digital/core/constants/app_colors.dart';
import 'package:desa_digital/core/widgets/label_pill.dart';
import 'package:desa_digital/core/widgets/tab_section.dart';
import 'package:desa_digital/features/activity/presentation/controllers/activity_controller.dart';
import 'package:desa_digital/features/activity/presentation/widgets/activity_item_card.dart';
import 'package:desa_digital/features/activity/presentation/widgets/activity_list.dart';
import 'package:desa_digital/features/activity/presentation/widgets/activity_meta.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SavedSection extends StatelessWidget {
  const SavedSection({super.key});

  ActivityController get _controller => Get.find<ActivityController>();

  void _openDetail() => Get.toNamed(Routes.detailPengaduan);

  @override
  Widget build(BuildContext context) {
    return TabSection(
      labels: const ["Aduan Masyarakat", "Berita"],
      tabs: [
        ActivityList(
          items: _controller.keluhanTersimpan,
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
          items: _controller.beritaTersimpan,
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
      barPadding: const EdgeInsets.all(12),
    );
  }
}
