import 'package:desa_digital/features/artikel/data/kategori_artikel.dart';
import 'package:desa_digital/features/artikel/screens/detail_artikel_screen.dart';
import 'package:desa_digital/features/artikel/widgets/bar_kategori_artikel.dart';
import 'package:desa_digital/features/artikel/widgets/daftar_artikel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DaftarArtikelScreen extends StatelessWidget {
  const DaftarArtikelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "Warta Desa",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: articleCategories.length,
        child: Builder(
          builder: (context) {
            final controller = DefaultTabController.of(context);

            return Column(
              children: [
                BarKategoriArtikel(controller: controller),
                Expanded(
                  child: TabBarView(
                    children: [
                      for (final category in articleCategories)
                        DaftarArtikel(
                          category: category,
                          onItemTap: () => Get.to(() => DetailArtikelScreen()),
                        ),
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
