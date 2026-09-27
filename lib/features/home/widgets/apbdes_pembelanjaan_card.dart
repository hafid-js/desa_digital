import 'package:desa_digital/features/home/widgets/apbdes_card_shell.dart';
import 'package:desa_digital/features/home/widgets/apbdes_progress_item.dart';
import 'package:flutter/material.dart';

class ApbdesPembelanjaanCard extends StatelessWidget {
  const ApbdesPembelanjaanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ApbdesCardShell(
      title: "APBDes 2026 Pembelanjaan",
      children: [
        ApbdesProgressItem(
          title: "Bidang Penyelenggaraan Pemerintahan",
          realAmount: "Rp 173.323.325,00",
          targetAmount: "Rp 642.272.557,00",
          progress: 0.26,
          percentageText: "26.83%",
        ),
        const SizedBox(height: 12),
        ApbdesProgressItem(
          title: "Bidang Pelaksanaan Pembangunan Desa",
          realAmount: "Rp 63.372.100,00",
          targetAmount: "Rp 369.859.500,00",
          progress: 0.17,
          percentageText: "17.13%",
        ),
        const SizedBox(height: 12),
        ApbdesProgressItem(
          title: "Bidang Pembinaan Kemasyarakatan Desa",
          realAmount: "Rp 0,00",
          targetAmount: "Rp 26.449.856.00,00",
          progress: 0.01,
          percentageText: "0%",
        ),
        const SizedBox(height: 12),
        ApbdesProgressItem(
          title: "Bidang Pemberdayaa Masyarakat Desa",
          realAmount: "Rp 39.083.500,00",
          targetAmount: "Rp 39.083.500,00",
          progress: 1,
          percentageText: "100%",
          stackAlignment: Alignment.center,
        ),
        const SizedBox(height: 12),
        ApbdesProgressItem(
          title: "Bidang Penanggulangan Bencana, Darurat Dan Mendesak Desa",
          realAmount: "Rp 5.400.000,00",
          targetAmount: "Rp 21.600.000,00",
          progress: 0.25,
          percentageText: "25%",
        ),
      ],
    );
  }
}
