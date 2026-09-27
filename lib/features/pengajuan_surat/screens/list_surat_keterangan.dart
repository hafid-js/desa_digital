import 'package:desa_digital/features/pengajuan_surat/screens/detail_keterangan_domisili.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:iconsax/iconsax.dart';

class ListSuratKeterangan extends StatelessWidget {
  const ListSuratKeterangan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Surat Keterangan",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            _buildKeteranganCard(
              context,
              title: "Surat Keterangan Domisili",
              subtitle:
                  "Surat untuk menunjukkan alamat tempat tinggal resmi seseorang",
              action: () {
                Get.to(() => DetailKeteranganDomisili());
              },
            ),
            SizedBox(height: 12),
            _buildKeteranganCard(
              context,
              title: "Surat Keterangan Kelahiran",
              subtitle:
                  "Surat yang menyatakan kelahiran seseorang diperlukan untuk proses pembuatan akta kelahiran",
              action: () {},
            ),
            SizedBox(height: 12),
            _buildKeteranganCard(
              context,
              title: "Surat Keterangan Domisili",
              subtitle:
                  "Surat bukti resmi bahwa seseorang telah meninggal dunia",
              action: () {},
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildKeteranganCard(
  BuildContext context, {
  required String title,
  required String subtitle,
  required VoidCallback action,
}) {
  return GestureDetector(
    onTap: action,
    child: Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleSmall),
            const Icon(Iconsax.arrow_right_3, size: 15, color: Colors.black54),
          ],
        ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
            fontSize: 11,
            color: Colors.black87,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    ),
  ),
  );
}
