import 'package:desa_digital/core/widgets/pill_tab_bar.dart';
import 'package:desa_digital/features/artikel/data/kategori_artikel.dart';
import 'package:flutter/material.dart';

class BarKategoriArtikel extends StatelessWidget {
  const BarKategoriArtikel({super.key, required this.controller});

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return PillTabBar(
      labels: [for (final category in articleCategories) category.label],
      controller: controller,
    );
  }
}
