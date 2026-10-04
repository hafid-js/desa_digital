import 'package:desa_digital/features/lapak_warga/data/filter_lapak.dart';
import 'package:desa_digital/features/lapak_warga/data/opsi_lapak.dart';
import 'package:desa_digital/features/lapak_warga/data/produk_contoh.dart';
import 'package:desa_digital/features/lapak_warga/data/urutan_lapak.dart';
import 'package:desa_digital/features/lapak_warga/screens/widgets/filter_lapak_sheet.dart';
import 'package:desa_digital/features/lapak_warga/screens/widgets/lapak_detail_modal.dart';
import 'package:desa_digital/features/lapak_warga/screens/widgets/lapak_item_card.dart';
import 'package:desa_digital/features/lapak_warga/screens/widgets/lapak_kosong.dart';
import 'package:desa_digital/features/lapak_warga/screens/widgets/sheet_posting_lapak.dart';
import 'package:desa_digital/features/lapak_warga/screens/widgets/sheet_urutkan.dart';
import 'package:desa_digital/features/lapak_warga/screens/widgets/tombol_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconsax/iconsax.dart';

class LapakWargaScreen extends StatefulWidget {
  const LapakWargaScreen({super.key});

  @override
  State<LapakWargaScreen> createState() => _LapakWargaScreenState();
}

class _LapakWargaScreenState extends State<LapakWargaScreen> {
  FilterLapak _filter = const FilterLapak();
  Urutan _urutan = Urutan.palingSesuai;

  Future<void> _bukaFilter() async {
    final hasil = await showModalBottomSheet<FilterLapak>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FilterLapakSheet(
        kategori: opsiKategoriFilter,
        lokasi: opsiLokasi,
        penawaran: opsiPenawaran,
        kondisi: opsiKondisiProduk,
        terakhirDitambahkan: opsiTerakhirDitambahkan,
        ketersediaan: opsiKetersediaan,
        awal: _filter,
      ),
    );

    if (hasil == null || !mounted) return;

    setState(() => _filter = hasil);
  }

  Future<void> _bukaUrutkan() async {
    final hasil = await showModalBottomSheet<Urutan>(
      context: context,
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      builder: (context) => SheetUrutkan(awal: _urutan),
    );

    if (hasil == null || !mounted) return;

    setState(() => _urutan = hasil);
  }

  Future<void> _bukaJual() async {
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
          kategori: opsiKategoriProduk,
          kondisi: opsiKondisiProduk,
          lokasi: opsiLokasi,
          scrollController: scrollController,
        ),
      ),
    );
  }

  void _showDetailModal(BuildContext context, Map<String, dynamic> product) {
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
    final produk = List.generate(8, (_) => produkContoh);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lapak Warga",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: _bukaJual,
            icon: const Icon(Iconsax.add),
            tooltip: "Posting Lapak",
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: _bukaUrutkan,
            icon: const Icon(Iconsax.filter),
            tooltip: "Urutkan",
          ),
          const SizedBox(width: 8),
          TombolFilter(jumlah: _filter.jumlahFilterAktif, onTap: _bukaFilter),
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
