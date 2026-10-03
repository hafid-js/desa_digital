import 'package:desa_digital/core/constants/app_colors.dart';
import 'package:desa_digital/core/theme/app_text_theme.dart';
import 'package:desa_digital/features/lapak_warga/data/filter_lapak.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

class FilterLapakSheet extends StatefulWidget {
  const FilterLapakSheet({
    super.key,
    required this.kategori,
    required this.lokasi,
    required this.awal,
  });

  final List<String> kategori;
  final List<String> lokasi;
  final FilterLapak awal;

  @override
  State<FilterLapakSheet> createState() => _FilterLapakSheetState();
}

class _FilterLapakSheetState extends State<FilterLapakSheet> {
  late UrutanLapak _urutan;
  late Set<String> _kategori;
  late Set<String> _lokasi;
  late int? _hargaMinimum;
  late int? _hargaMaksimum;
  late bool _hanyaTersedia;

  final TextEditingController _hargaMinController = TextEditingController();
  final TextEditingController _hargaMaxController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _urutan = widget.awal.urutan;
    _kategori = {...widget.awal.kategori};
    _lokasi = {...widget.awal.lokasi};
    _hargaMinimum = widget.awal.hargaMinimum;
    _hargaMaksimum = widget.awal.hargaMaksimum;
    _hanyaTersedia = widget.awal.hanyaTersedia;
    _hargaMinController.text = _hargaMinimum?.toString() ?? '';
    _hargaMaxController.text = _hargaMaksimum?.toString() ?? '';
  }

  @override
  void dispose() {
    _hargaMinController.dispose();
    _hargaMaxController.dispose();
    super.dispose();
  }

  int? _parseHarga(String value) {
    final bersih = value.replaceAll(RegExp(r'[^0-9]'), '');
    if (bersih.isEmpty) return null;
    return int.tryParse(bersih);
  }

  FilterLapak hasil() {
    return FilterLapak(
      urutan: _urutan,
      kategori: _kategori,
      hargaMinimum: _hargaMinimum,
      hargaMaksimum: _hargaMaksimum,
      lokasi: _lokasi,
      hanyaTersedia: _hanyaTersedia,
    );
  }

  void _terapkan() {
    Navigator.pop(context, hasil());
  }

  void _resetSemua() {
    setState(() {
      _urutan = UrutanLapak.terbaru;
      _kategori = {};
      _lokasi = {};
      _hargaMinimum = null;
      _hargaMaksimum = null;
      _hanyaTersedia = true;
      _hargaMinController.clear();
      _hargaMaxController.clear();
    });
  }

  void _toggle(Set<String> target, String nilai) {
    setState(() {
      if (!target.remove(nilai)) target.add(nilai);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      snap: true,
      snapSizes: const [0.5, 0.9],
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            children: [
              _Header(
                judul: "Filter",
                onReset: _resetSemua,
                onTutup: () => Navigator.pop(context),
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                  children: [
                    _Label("Urutkan"),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final opsi in UrutanLapak.values)
                          _Chip(
                            label: opsi.label,
                            aktif: _urutan == opsi,
                            onTap: () => setState(() => _urutan = opsi),
                          ),
                      ],
                    ),
                    SizedBox(height: 20),
                    _Label("Kategori"),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final kategori in widget.kategori)
                          _Chip(
                            label: kategori,
                            aktif: _kategori.contains(kategori),
                            onTap: () => _toggle(_kategori, kategori),
                          ),
                      ],
                    ),
                    SizedBox(height: 20),
                    _Label("Rentang Harga"),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: _InputHarga(
                            controller: _hargaMinController,
                            hint: "Min",
                            onChanged: (value) =>
                                _hargaMinimum = _parseHarga(value),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text("—"),
                        ),
                        Expanded(
                          child: _InputHarga(
                            controller: _hargaMaxController,
                            hint: "Maks",
                            onChanged: (value) =>
                                _hargaMaksimum = _parseHarga(value),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    _Label("Lokasi"),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final lokasi in widget.lokasi)
                          _Chip(
                            label: lokasi,
                            aktif: _lokasi.contains(lokasi),
                            onTap: () => _toggle(_lokasi, lokasi),
                          ),
                      ],
                    ),

                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Stok tersedia",
                          style: AppTextTheme.lightTextTheme.titleSmall
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        Transform.scale(
                          scale: 0.85,
                          child: Switch(
                            value: _hanyaTersedia,
                            activeThumbColor: AppColors.green,
                            thumbColor: WidgetStatePropertyAll(
                              _hanyaTersedia ? Colors.white : null,
                            ),
                            trackColor: WidgetStatePropertyAll(
                              _hanyaTersedia
                                  ? AppColors.green
                                  : Colors.transparent,
                            ),
                            inactiveThumbColor: AppColors.grey,
                            trackOutlineColor: WidgetStatePropertyAll(
                              _hanyaTersedia ? AppColors.green : AppColors.grey,
                            ),
                            onChanged: (value) =>
                                setState(() => _hanyaTersedia = value),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              _TombolTerapkan(onTap: _terapkan, label: "Terapkan"),
            ],
          ),
        );
      },
    );
  }
}

class _Pemisah extends StatelessWidget {
  const _Pemisah();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Divider(thickness: 0.5, color: AppColors.borderSecondary),
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(this.teks);

  final String teks;

  @override
  Widget build(BuildContext context) {
    return Text(
      teks,
      style: AppTextTheme.lightTextTheme.titleSmall?.copyWith(
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.label, required this.aktif, required this.onTap});

  final String label;
  final bool aktif;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
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

class _InputHarga extends StatelessWidget {
  const _InputHarga({
    required this.controller,
    required this.hint,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hint;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      style: TextStyle(fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,

        hintStyle: TextStyle(
          fontSize: 14,
          color: AppColors.textSecondaryLight,
          fontWeight: FontWeight.w300,
        ),
        isDense: true,
        prefixText: "Rp.",
        prefixStyle: TextStyle(
          fontSize: 14,
          color: Colors.black87,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.primary, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColors.grey.withAlpha(120),
            width: 1.5,
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.judul,
    required this.onReset,
    required this.onTutup,
  });

  final String judul;
  final VoidCallback onReset;
  final VoidCallback onTutup;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
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
          TextButton(onPressed: onReset, child: const Text("Reset")),
        ],
      ),
    );
  }
}

class _TombolTerapkan extends StatelessWidget {
  const _TombolTerapkan({required this.onTap, required this.label});

  final VoidCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
