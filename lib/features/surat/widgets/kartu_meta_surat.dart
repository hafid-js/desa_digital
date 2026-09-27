import 'package:desa_digital/core/constants/app_colors.dart';
import 'package:desa_digital/features/surat/models/jenis_surat.dart';
import 'package:flutter/material.dart';

class KartuMetaSurat extends StatelessWidget {
  const KartuMetaSurat({super.key, required this.type});

  final JenisSurat type;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _chip('Kode ${type.code}'),
              if (type.labelLampiran != null) ...[
                const SizedBox(width: 8),
                _chip(type.labelLampiran!),
              ],
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.schedule, size: 14, color: Colors.black45),
              const SizedBox(width: 4),
              Text(
                type.labelMasaBerlaku,
                style: const TextStyle(fontSize: 11, color: Colors.black54),
              ),
            ],
          ),
          if (!type.mandiri) ...[
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.groups, size: 14, color: Colors.black45),
                const SizedBox(width: 4),
                const Expanded(
                  child: Text(
                    'Surat ini diverifikasi petugas desa sebelum diterbitkan',
                    style: TextStyle(fontSize: 11, color: Colors.black54),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _chip(String text) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
    decoration: BoxDecoration(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      text,
      style: const TextStyle(fontSize: 10, color: Colors.white),
    ),
  );
}
