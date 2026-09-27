import 'package:desa_digital/features/home/widgets/apbdes_card_shell.dart';
import 'package:desa_digital/features/home/widgets/apbdes_progress_item.dart';
import 'package:flutter/material.dart';

class ApbdesPendapatanCard extends StatelessWidget {
  const ApbdesPendapatanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ApbdesCardShell(
      title: "APBDes 2026 Pendapatan",
      children: [
        ApbdesProgressItem(
          title: "Hasil Usaha Desa",
          realAmount: "Rp 0,00",
          targetAmount: "Rp 24.000.000,00",
          progress: 0.01,
          percentageText: "0%",
        ),
        const SizedBox(height: 12),
        ApbdesProgressItem(
          title: "Hasil Aset Desa",
          realAmount: "Rp 0,00",
          targetAmount: "Rp 16.000.000,00",
          progress: 0.01,
          percentageText: "0%",
        ),
        const SizedBox(height: 12),
        ApbdesProgressItem(
          title: "Dana Desa",
          realAmount: "Rp 149.382.400,00",
          targetAmount: "Rp 373.456.000,00",
          progress: 0.4,
          percentageText: "40.2%",
        ),
        const SizedBox(height: 12),
        ApbdesProgressItem(
          title: "Bagi Hasil Pajak Dan Retribusi",
          realAmount: "Rp 0,00",
          targetAmount: "Rp 41.217.700,00",
          progress: 0.01,
          percentageText: "0%",
        ),
        const SizedBox(height: 12),
        ApbdesProgressItem(
          title: "Alokasi Dana Desa",
          realAmount: "Rp 174.647.992,00",
          targetAmount: "Rp 434.491.400,00",
          progress: 0.4,
          percentageText: "40%",
        ),
        const SizedBox(height: 12),
        ApbdesProgressItem(
          title: "Bagi Hasil Pajak Dan Retribusi",
          realAmount: "Rp 0,00",
          targetAmount: "Rp 41.217.700,00",
          progress: 0.01,
          percentageText: "0%",
        ),
        const SizedBox(height: 12),
        ApbdesProgressItem(
          title: "Dana Desa",
          realAmount: "Rp 149.382.400,00",
          targetAmount: "Rp 373.456.000,00",
          progress: 0.4,
          percentageText: "40.2%",
        ),
        const SizedBox(height: 12),
        ApbdesProgressItem(
          title: "Bantuan Keuangan Provinsi",
          realAmount: "Rp 0,00",
          targetAmount: "Rp 100.000.000,00",
          progress: 0.01,
          percentageText: "0%",
        ),
        const SizedBox(height: 12),
        ApbdesProgressItem(
          title: "Bunga Bank",
          realAmount: "Rp 90.994,00",
          targetAmount: "Rp 1.180.417,00",
          progress: 0.07,
          percentageText: "7.71%",
        ),
      ],
    );
  }
}
