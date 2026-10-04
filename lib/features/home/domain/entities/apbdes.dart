/// Penempatan label persentase pada progress bar.
enum ApbdesLabelAlignment { start, center }

/// Satu baris capaian APBDes beserta nilai yang sudah siap tampil.
class ApbdesItem {
  const ApbdesItem({
    required this.title,
    required this.realAmount,
    required this.targetAmount,
    required this.progress,
    required this.percentageText,
    this.labelAlignment = ApbdesLabelAlignment.start,
  });

  final String title;
  final String realAmount;
  final String targetAmount;

  /// Nilai 0..1 untuk progress bar.
  final double progress;

  /// Teks persentase siap tampil, misalnya `40.2%`.
  final String percentageText;

  final ApbdesLabelAlignment labelAlignment;
}

/// Satu kartu APBDes beserta daftar capaiannya.
class ApbdesSection {
  const ApbdesSection({required this.title, required this.items});

  final String title;
  final List<ApbdesItem> items;
}

/// Total realisasi terhadap target; progress dan teks persennya dihitung.
class ApbdesTotal {
  const ApbdesTotal({required this.realAmount, required this.targetAmount});

  final int realAmount;
  final int targetAmount;

  double get progress => targetAmount == 0 ? 0 : realAmount / targetAmount;

  String get percentageText => '${(progress * 100).toStringAsFixed(1)}%';
}

/// Ringkasan APBDes yang ditampilkan pada home.
class ApbdesSummary {
  const ApbdesSummary({
    required this.pelaksanaan,
    required this.pendapatan,
    required this.pembelanjaan,
  });

  final ApbdesSection pelaksanaan;
  final ApbdesSection pendapatan;
  final ApbdesSection pembelanjaan;
}
