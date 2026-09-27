import 'package:desa_digital/features/home/widgets/apbdes_card_shell.dart';
import 'package:desa_digital/features/home/widgets/apbdes_progress_item.dart';
import 'package:flutter/material.dart';

class ApbdesPelaksanaanCard extends StatelessWidget {
  const ApbdesPelaksanaanCard({
    super.key,
    required this.pendapatanProgress,
    required this.pendapatanPercentageText,
  });

  final double pendapatanProgress;
  final String pendapatanPercentageText;

  @override
  Widget build(BuildContext context) {
    return ApbdesCardShell(
      title: "APBDes 2026 Pelaksanaan",
      children: [
        ApbdesProgressItem(
          title: "Pendapatan",
          realAmount: "Rp 369.305.706,00",
          targetAmount: "Rp 1.125.947.389,00",
          progress: pendapatanProgress,
          percentageText: pendapatanPercentageText,
        ),
        const SizedBox(height: 12),
        ApbdesProgressItem(
          title: "Belanja",
          realAmount: "Rp 280.178.925,00",
          targetAmount: "Rp 1.099.315.413,00",
          progress: 0.2,
          percentageText: "25.49%",
        ),
      ],
    );
  }
}
