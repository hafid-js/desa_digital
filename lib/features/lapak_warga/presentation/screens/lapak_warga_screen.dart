import 'package:desa_digital/features/lapak_warga/domain/entities/filter_lapak.dart';
import 'package:desa_digital/features/lapak_warga/domain/entities/produk_lapak.dart';
import 'package:desa_digital/features/lapak_warga/domain/entities/urutan.dart';
import 'package:desa_digital/features/lapak_warga/presentation/controllers/lapak_warga_controller.dart';
import 'package:desa_digital/features/lapak_warga/presentation/widgets/filter_lapak_sheet.dart';
import 'package:desa_digital/features/lapak_warga/presentation/widgets/lapak_detail_modal.dart';
import 'package:desa_digital/features/lapak_warga/presentation/widgets/lapak_item_card.dart';
import 'package:desa_digital/features/lapak_warga/presentation/widgets/lapak_kosong.dart';
import 'package:desa_digital/features/lapak_warga/presentation/widgets/sheet_posting_lapak.dart';
import 'package:desa_digital/features/lapak_warga/presentation/widgets/sheet_urutkan.dart';
import 'package:desa_digital/features/lapak_warga/presentation/widgets/tombol_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LapakWargaScreen extends GetView<LapakWargaController> {
  const LapakWargaScreen({super.key});

  Future<void> _bukaFilter(BuildContext context) async {
    final opsi = controller.opsi;
    final hasil = await showModalBottomSheet<FilterLapak>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FilterLapakSheet(
        kategori: opsi?.kategoriFilter ?? const [],
        lokasi: opsi?.lokasi ?? const [],
        penawaran: opsi?.penawaran ?? const [],
        kondisi: opsi?.kondisiProduk ?? const [],
        terakhirDitambahkan: opsi?.terakhirDitambahkan ?? const [],
        ketersediaan: opsi?.ketersediaan ?? const [],
        awal: controller.filter.value,
      ),
    );

    if (hasil == null) return;

    controller.setFilter(hasil);
  }

  Future<void> _bukaUrutkan(BuildContext context) async {
    final hasil = await showModalBottomSheet<Urutan>(
      context: context,
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      builder: (context) => SheetUrutkan(awal: controller.urutan.value),
    );

    if (hasil == null) return;

    controller.setUrutan(hasil);
  }

  Future<void> _bukaJual(BuildContext context) async {
    final opsi = controller.opsi;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.95,
        minChildSize: 0.95,
        maxChildSize: 1.0,
        expand: false,
        builder: (context, scrollController) => SheetPostingLapak(
          kategori: opsi?.kategoriProduk ?? const [],
          kondisi: opsi?.kondisiProduk ?? const [],
          lokasi: opsi?.lokasi ?? const [],
          scrollController: scrollController,
        ),
      ),
    );
  }

  void _showDetailModal(BuildContext context, ProdukLapak product) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      sheetAnimationStyle: AnimationStyle(
        duration: const Duration(milliseconds: 500),
        reverseDuration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.4,
        maxChildSize: 0.95,
        snap: true,
        snapSizes: const [0.9],
        builder: (context, scrollController) => ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          child: LapakDesaDetailModal(
            product: product,
            scrollController: scrollController,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final produk = controller.produk;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lapak Warga",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () => _bukaJual(context),
            icon: const Icon(Iconsax.add),
            tooltip: "Posting Lapak",
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () => _bukaUrutkan(context),
            icon: const Icon(Iconsax.filter),
            tooltip: "Urutkan",
          ),
          const SizedBox(width: 8),
          Obx(
            () => TombolFilter(
              jumlah: controller.filter.value.jumlahFilterAktif,
              onTap: () => _bukaFilter(context),
            ),
          ),
        ],
        actionsPadding: const EdgeInsets.only(right: 12),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: produk.isEmpty
            ? const LapakKosong()
            : MasonryGridView.count(
                itemCount: produk.length,
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                itemBuilder: (context, index) {
                  final item = produk[index];

                  return LapakItemCard(
                    product: item,
                    onTap: () => _showDetailModal(context, item),
                  );
                },
              ),
      ),
    );
  }
}
