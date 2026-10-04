import 'package:desa_digital/features/lapak_warga/domain/entities/urutan.dart';
import 'package:desa_digital/features/lapak_warga/presentation/widgets/header_sheet.dart';
import 'package:desa_digital/features/lapak_warga/presentation/widgets/tombol_terapkan.dart';
import 'package:flutter/material.dart';

class SheetUrutkan extends StatefulWidget {
  const SheetUrutkan({super.key, this.awal});

  final Urutan? awal;

  @override
  State<SheetUrutkan> createState() => _SheetUrutkanState();
}

class _SheetUrutkanState extends State<SheetUrutkan> {
  late Urutan? _terpilih;

  @override
  void initState() {
    super.initState();
    _terpilih = widget.awal;
  }

  void _terapkan() {
    Navigator.pop(context, _terpilih ?? Urutan.palingSesuai);
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
          HeaderSheet(
            judul: "Urutkan",
            showReset: false,
            publish: false,
            onPublish: () {},
            onReset: () => setState(() => _terpilih = Urutan.palingSesuai),
            onTutup: () => Navigator.pop(context),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
                child: RadioGroup<Urutan>(
                  groupValue: _terpilih,
                  onChanged: (Urutan? value) {
                    setState(() => _terpilih = value);
                  },
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _BarisUrutkan(
                        title: "Paling sesuai",
                        nilai: Urutan.palingSesuai,
                      ),
                      _BarisUrutkan(title: "Terbaru", nilai: Urutan.terbaru),
                      _BarisUrutkan(
                        title: "Harga Tertinggi",
                        nilai: Urutan.hargaTertinggi,
                      ),
                      _BarisUrutkan(
                        title: "Harga Terendah",
                        nilai: Urutan.hargaTerendah,
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
  final Urutan nilai;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final group = RadioGroup.maybeOf<Urutan>(context);

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
            Radio<Urutan>(value: nilai),
          ],
        ),
      ),
    );
  }
}
