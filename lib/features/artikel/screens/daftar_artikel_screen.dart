import 'package:desa_digital/core/widgets/tab_section.dart';
import 'package:desa_digital/features/artikel/data/kategori_artikel.dart';
import 'package:desa_digital/features/artikel/widgets/daftar_artikel.dart';
import 'package:flutter/material.dart';
import 'package:desa_digital/app/routes/app_routes.dart';
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
      body: TabSection(
        labels: [for (final category in articleCategories) category.label],
        tabs: [
          for (final category in articleCategories)
            DaftarArtikel(
              category: category,
              onItemTap: () => Get.toNamed(Routes.detailArtikel),
            ),
        ],
      ),
    );
  }
}
