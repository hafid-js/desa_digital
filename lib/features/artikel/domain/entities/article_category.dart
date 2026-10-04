/// Satu contoh artikel di dalam sebuah kategori.
class ArticleSample {
  const ArticleSample({required this.title});

  final String title;
}

/// Kategori artikel beserta contohnya, misal "Publik" atau "Berita OPD".
class ArticleCategory {
  const ArticleCategory({required this.label, required this.samples});

  final String label;
  final List<ArticleSample> samples;
}
