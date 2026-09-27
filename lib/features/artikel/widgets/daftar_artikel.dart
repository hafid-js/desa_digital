import 'package:desa_digital/features/artikel/data/kategori_artikel.dart';
import 'package:desa_digital/features/artikel/widgets/kartu_daftar_artikel.dart';
import 'package:flutter/material.dart';

class DaftarArtikel extends StatelessWidget {
  const DaftarArtikel({
    super.key,
    required this.category,
    required this.onItemTap,
  });

  final ArticleCategory category;
  final VoidCallback onItemTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: category.samples.length,
      itemBuilder: (context, index) {
        return KartuDaftarArtikel(
          title: category.samples[index].title,
          titleColor: category.titleColor,
          titleFontWeight: category.titleFontWeight,
          onTap: onItemTap,
        );
      },
    );
  }
}
