import 'package:desa_digital/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AktivitasScreen extends StatelessWidget {
  const AktivitasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Aktivitas",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          bottom: TabBar(
  overlayColor: WidgetStateProperty.all(
    AppColors.secondary.withAlpha(40),
  ),
            indicatorColor: AppColors.secondary,
            indicatorSize: TabBarIndicatorSize.label,
            dividerColor: Colors.transparent,
            unselectedLabelColor: Colors.grey,
            labelColor: AppColors.secondary,
            labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w700),
            indicator: UnderlineTabIndicator(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
    borderSide: BorderSide(
      color: AppColors.secondary,
      width: 3,
    ),
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
          children: [
            _buildLaporanSaya(),
            _buildDisimpan(),
          ],
        ),
      ),
    );
  }

  Widget _buildLaporanSaya() {
    return const Center(
      child: Text('Belum ada laporan'),
    );
  }

  Widget _buildDisimpan() {
    return const Center(
      child: Text('Belum ada item tersimpan'),
    );
  }
}
