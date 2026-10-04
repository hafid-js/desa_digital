import 'package:desa_digital/core/constants/app_colors.dart';
import 'package:desa_digital/core/widgets/label_pill.dart';
import 'package:desa_digital/core/widgets/tab_section.dart';
import 'package:desa_digital/features/activity/data/activity_items.dart';
import 'package:desa_digital/features/activity/widgets/activity_item_card.dart';
import 'package:desa_digital/features/activity/widgets/activity_list.dart';
import 'package:desa_digital/features/activity/widgets/activity_meta.dart';
import 'package:flutter/material.dart';
import 'package:desa_digital/app/routes/app_routes.dart';
import 'package:get/get.dart';

class MyReportsSection extends StatelessWidget {
  const MyReportsSection({super.key});

  void _openDetail() => Get.toNamed(Routes.detailPengaduan);

  @override
  Widget build(BuildContext context) {
    return TabSection(
      labels: const ["Proses", "Selesai"],
      tabs: [
        ActivityList(
          items: inProgressReports,
          itemBuilder: (item) => ActivityItemCard(
            item: item,
            cardPadding: activityReportCardPadding,
            meta: BulletMeta(text: item.meta),
            footer: _pillRow(
              LabelPill(
                label: "Progress",
                color: AppColors.secondary,
                backgroundColor: AppColors.secondary.withAlpha(40),
              ),
            ),
            onTap: _openDetail,
          ),
        ),
        ActivityList(
          items: finishedReports,
          itemBuilder: (item) => ActivityItemCard(
            item: item,
            meta: DateMeta(text: item.meta),
            footer: _pillRow(
              LabelPill(
                label: "Selesai",
                color: AppColors.quartenary,
                backgroundColor: AppColors.quartenary.withAlpha(40),
              ),
            ),
            onTap: _openDetail,
          ),
        ),
      ],
      barPadding: const EdgeInsets.all(12),
    );
  }

  Widget _pillRow(Widget statusPill) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        statusPill,
        const SizedBox(width: 5),
        const LabelPill(
          label: "Publik",
          color: AppColors.textPrimaryLight,
          backgroundColor: Color(0x1E000000),
          icon: Icons.lock_open_rounded,
        ),
      ],
    );
  }
}
