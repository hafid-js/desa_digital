import 'package:desa_digital/features/home/widgets/apbdes_pelaksanaan_card.dart';
import 'package:desa_digital/features/home/widgets/apbdes_pembelanjaan_card.dart';
import 'package:desa_digital/features/home/widgets/apbdes_pendapatan_card.dart';
import 'package:flutter/material.dart';

class ApbdesSection extends StatelessWidget {
  const ApbdesSection({super.key});

  @override
  Widget build(BuildContext context) {
    const double pendapatanReal = 369305706;
    const double targetPendapatan = 1125947389;
    const double progressPercentage = pendapatanReal / targetPendapatan;
    final String percentageText =
        "${(progressPercentage * 100).toStringAsFixed(1)}%";

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          ApbdesPelaksanaanCard(
            pendapatanProgress: progressPercentage,
            pendapatanPercentageText: percentageText,
          ),
          SizedBox(height: 16),
          const ApbdesPendapatanCard(),
          SizedBox(height: 16),
          const ApbdesPembelanjaanCard(),
        ],
      ),
    );
  }
}
