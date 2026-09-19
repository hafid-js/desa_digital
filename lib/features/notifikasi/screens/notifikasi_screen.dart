import 'package:desa_digital/core/utils/constants/app_colors.dart';
import 'package:desa_digital/features/notifikasi/screens/widgets/notifikasi_kosong_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NotifikasiScreen extends StatelessWidget {
  const NotifikasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "Notifikasi",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 4,
        child: Builder(
          builder: (context) {
            final controller = DefaultTabController.of(context);

            return Column(
              children: [
                AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    final selectedIndex = controller.index;

                    return Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => controller.animateTo(0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 14,
                              ),
                              decoration: BoxDecoration(
                                color: selectedIndex == 0
                                    ? AppColors.primary
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "Semua",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelSmall
                                    ?.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: selectedIndex == 0
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),

                          GestureDetector(
                            onTap: () => controller.animateTo(1),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 14,
                              ),
                              decoration: BoxDecoration(
                                color: selectedIndex == 1
                                    ? AppColors.primary
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "Aduan",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelSmall
                                    ?.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: selectedIndex == 1
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),

                          GestureDetector(
                            onTap: () => controller.animateTo(2),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 14,
                              ),
                              decoration: BoxDecoration(
                                color: selectedIndex == 2
                                    ? AppColors.primary
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "Event",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelSmall
                                    ?.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: selectedIndex == 2
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),

                          GestureDetector(
                            onTap: () => controller.animateTo(3),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 14,
                              ),
                              decoration: BoxDecoration(
                                color: selectedIndex == 3
                                    ? AppColors.primary
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "Berita",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelSmall
                                    ?.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: selectedIndex == 3
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                Expanded(
                  child: TabBarView(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
                            Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(color: AppColors.light),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: AppColors.secondary.withAlpha(
                                  40,
                                ),
                                child: Icon(
                                  Iconsax.menu_board,
                                  color: AppColors.secondary,
                                  size: 20,
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Event Kelurahan Hari Ini",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleSmall,
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Husabaqah Tilawatil Qur'an (MTq) Tingkat Nasional XXI Tahun 2026 Berlangsung Di Kota Semarang",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "13 jam yang lalu",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(fontSize: 11),
                                    ),
                                  ],
                                ),
                              ),
                                     
                              
                            ],
                          ),
                        ),
                 Divider(color: Colors.pink)
                      
                          ],
                        )
                      ),
                      NotifikasiKosongScreen(),
                      NotifikasiKosongScreen(),
                      NotifikasiKosongScreen(),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
