import 'package:desa_digital/core/constants/app_colors.dart';
import 'package:desa_digital/core/widgets/rounded_image.dart';
import 'package:desa_digital/features/lapak_warga/data/filter_lapak.dart';
import 'package:desa_digital/features/lapak_warga/screens/widgets/filter_lapak_sheet.dart';
import 'package:desa_digital/features/lapak_warga/screens/widgets/lapak_detail_modal.dart';
import 'package:desa_digital/features/lapak_warga/screens/widgets/tombol_terapkan.dart';
import 'package:desa_digital/features/notifikasi/widgets/tile_daftar_notifikasi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconsax/iconsax.dart';

class LapakWargaScreen extends StatefulWidget {
  const LapakWargaScreen({super.key});

  @override
  State<LapakWargaScreen> createState() => _LapakWargaScreenState();
}

enum Urutkan {
  palingSesuai('Paling Sesuai'),
  terbaru('Terbaru'),
  hargaTertinggi('Harga Tertinggi'),
  hargaTerendah('Harga Terendah');

  const Urutkan(this.label);

  final String label;
}

class _LapakWargaScreenState extends State<LapakWargaScreen> {
  static const List<String> _kategori = [
    'Fashion & Pakaian',
    'Kuliner & Olahan',
    'Elektronik & Gadget',
    'Hasil Bumi & Pertanian',
    'Perlengkapan Rumah',
    'Otomotif',
    'Kerajinan & Souvenir',
  ];

  static const List<String> _lokasi = [
    'Dusun Krajan',
    'Dusun Kepudang',
    'Dusun Karangsari',
    'Dusun Kemplung',
    'Dusun Brembet',
  ];

  static const List<String> _penawaran = ['COD', 'Harga Diskon'];

  static const List<String> _kondisi = ['Bar', 'Bekas'];

  static const List<String> _terakhirDitambahkan = [
    '7 hari',
    '14 hari',
    '1 bulan',
    '3 bulan',
  ];

  static const List<String> _ketersediaan = ['Stok Tersedia', 'Preorder'];

  FilterLapak _filter = const FilterLapak();

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
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.4,
          maxChildSize: 0.95,
          snap: true,
          snapSizes: const [0.9],
          builder: (context, scrollController) {
            return ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: LapakDesaDetailModal(
                product: product,
                scrollController: scrollController,
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _bukaFilter() async {
    final hasil = await showModalBottomSheet<FilterLapak>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FilterLapakSheet(
        kategori: _kategori,
        lokasi: _lokasi,
        penawaran: _penawaran,
        kondisi: _kondisi,
        terakhirDitambahkan: _terakhirDitambahkan,
        ketersediaan: _ketersediaan,
        awal: _filter,
      ),
    );

    if (hasil == null || !mounted) return;

    setState(() => _filter = hasil);
  }

  Urutkan _urutan = Urutkan.palingSesuai;

  Future<void> _bukaUrutkan() async {
    final hasil = await showModalBottomSheet<Urutkan>(
      context: context,
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      builder: (context) => _SheetUrutkan(awal: _urutan),
    );

    if (hasil == null || !mounted) return;

    setState(() => _urutan = hasil);
  }

  static final Map<String, dynamic> dummyProduct = {
    "title": "Columbia Women's Castback TC PFG Shoes",
    "price": "31.800",
    "originalPrice": "150.000",
    "discount": "-55%",
    "seller": "Sumanto",
    "location": "Dusun Karangsari",
    "image": "assets/images/lapak_warga/handphone.png",
    "userAvatar": "assets/images/lapak_warga/user_example.jpg",
    "description":
        "Sepatu berkualitas hasil karya warga lokal desa. Nyaman dipakai untuk aktivitas sehari-hari, awet, dan tahan lama.",
  };

  @override
  Widget build(BuildContext context) {
    final produk = List.generate(8, (_) => dummyProduct);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lapak Warga",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: _bukaUrutkan,
            icon: const Icon(Iconsax.filter),
            tooltip: "Urutkan",
          ),
          SizedBox(width: 8),
          _TombolFilter(jumlah: _filter.jumlahFilterAktif, onTap: _bukaFilter),
        ],
        actionsPadding: EdgeInsets.only(right: 12),
      ),
      body: Column(
        children: [
          // _BarisFilter(
          //   urutan: _urutan,
          //   onUrutkan: (opsi) {
          //     setState(() => _urutan = opsi);
          //   },
          // ),

          Expanded(
            child: produk.isEmpty
                ? const _Kosong()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: MasonryGridView.count(
                      itemCount: produk.length,
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      itemBuilder: (context, index) {
                        final item = produk[index];
                        return _LapakItemCard(
                          product: item,
                          onTap: () => _showDetailModal(context, item),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.judul,
    required this.onReset,
    required this.onTutup,
    required this.showReset

  });

  final String judul;
  final VoidCallback onReset;
  final VoidCallback onTutup;
  final bool showReset;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12,right: 12),
      child: Row(
        children: [
          IconButton(
            onPressed: onTutup,
            icon: const Icon(Icons.close_rounded, size: 30),
          ),
          Text(
            judul,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          const Spacer(),
          TextButton(onPressed: onReset, child: showReset ? const Text("Reset") : SizedBox.shrink()),
        ],
      ),
    );
  }
}

class _SheetUrutkan extends StatefulWidget {
  const _SheetUrutkan({this.awal});

  final Urutkan? awal;

  @override
  State<_SheetUrutkan> createState() => _SheetUrutkanState();
}

class _SheetUrutkanState extends State<_SheetUrutkan> {
  late Urutkan? _terpilih;

  @override
  void initState() {
    super.initState();
    _terpilih = widget.awal;
  }

  void _terapkan() {
    Navigator.pop(context, _terpilih ?? Urutkan.palingSesuai);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _Header(
              judul: "Urutkan",
              showReset: false,
              onReset: () => setState(() => _terpilih = Urutkan.palingSesuai),
              onTutup: () => Navigator.pop(context),
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
                  child: RadioGroup<Urutkan>(
                    groupValue: _terpilih,
                    onChanged: (Urutkan? value) {
                      setState(() => _terpilih = value);
                    },
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _BarisUrutkan(
                          title: "Paling sesuai",
                          nilai: Urutkan.palingSesuai,
                        ),
                        _BarisUrutkan(title: "Terbaru", nilai: Urutkan.terbaru),
                        _BarisUrutkan(
                          title: "Harga Tertinggi",
                          nilai: Urutkan.hargaTertinggi,
                        ),
                        _BarisUrutkan(
                          title: "Harga Terendah",
                          nilai: Urutkan.hargaTerendah,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            TombolTerapkan(onTap: _terapkan, label: "Terapkan"),
          ],
        ),
      );
  }
}

class _BarisUrutkan extends StatelessWidget {
  const _BarisUrutkan({required this.title, required this.nilai});

  final String title;
  final Urutkan nilai;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final group = RadioGroup.maybeOf<Urutkan>(context);

        group?.onChanged(nilai);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.copyWith(color: Colors.black),
            ),
            Radio<Urutkan>(value: nilai),
          ],
        ),
      ),
    );
  }
}

class _BarisFilter extends StatelessWidget {
  const _BarisFilter({required this.urutan, required this.onUrutkan});

  final Urutkan urutan;
  final ValueChanged<Urutkan> onUrutkan;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        children: [
          for (final opsi in Urutkan.values)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _ChipUrutan(
                label: opsi.label,
                aktif: urutan == opsi,
                onTap: () => onUrutkan(opsi),
              ),
            ),
        ],
      ),
    );
  }
}

class _TombolFilter extends StatelessWidget {
  const _TombolFilter({required this.jumlah, required this.onTap});

  final int jumlah;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          const Icon(Iconsax.setting_4),
          const SizedBox(width: 6),
          if (jumlah > 0) ...[
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "$jumlah",
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ChipUrutan extends StatelessWidget {
  const _ChipUrutan({
    required this.label,
    required this.aktif,
    required this.onTap,
  });

  final String label;
  final bool aktif;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: aktif ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: aktif ? AppColors.primary : AppColors.borderPrimary,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: aktif ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}

class _Kosong extends StatelessWidget {
  const _Kosong();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Iconsax.box, size: 48, color: AppColors.grey),
          const SizedBox(height: 12),
          Text(
            "Tidak ada produk yang cocok",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 4),
          Text(
            "Coba ubah filter atau urutanmu",
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.textSecondaryLight,
            ),
          ),
        ],
      ),
    );
  }
}

class _LapakItemCard extends StatefulWidget {
  final Map<String, dynamic> product;
  final VoidCallback onTap;

  const _LapakItemCard({required this.product, required this.onTap});

  @override
  State<_LapakItemCard> createState() => _LapakItemCardState();
}

class _LapakItemCardState extends State<_LapakItemCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: widget.onTap,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        widget.product["image"],
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if ((widget.product["discount"] as String?)?.isNotEmpty ??
                        false)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(6),
                              topRight: Radius.circular(6),
                            ),
                          ),
                          child: Text(
                            widget.product["discount"],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 6),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        widget.product["title"],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      child: Icon(
                        isFavorite ? Iconsax.heart5 : Iconsax.heart,
                        color: isFavorite
                            ? Colors.redAccent
                            : AppColors.textSecondaryLight,
                        size: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.black,
                        ),
                        children: [
                          const TextSpan(
                            text: "Rp",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ),
                          ),
                          TextSpan(
                            text: widget.product["price"],
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.red,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Iconsax.ticket, size: 14, color: Colors.red),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        "Rp${widget.product['originalPrice']}",
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 10,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                Row(
                  children: [
                    AppRoundedImage(
                      imageUrl: widget.product["userAvatar"],
                      height: 24,
                      width: 24,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product["seller"],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.labelSmall!
                                .copyWith(
                                  color: AppColors.textSecondaryLight,
                                  fontSize: 10,
                                ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 11,
                                color: AppColors.primary,
                              ),
                              const SizedBox(width: 2),
                              Expanded(
                                child: Text(
                                  widget.product["location"],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .copyWith(
                                        fontSize: 10,
                                        color: AppColors.textSecondaryLight,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
