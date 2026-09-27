import 'package:desa_digital/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ArticleSample {
  const ArticleSample({required this.title});

  final String title;
}

class ArticleCategory {
  const ArticleCategory({
    required this.label,
    required this.titleColor,
    required this.samples,
    this.titleFontWeight,
  });

  final String label;
  final Color titleColor;
  final FontWeight? titleFontWeight;
  final List<ArticleSample> samples;
}

const String articleDescription =
    "Judul : Gapura PRPP | Lokasi : Gapura PRPP Puri Anjasmoro | "
    "Deskripsi Laporan : Gapura PRPP yg lampu merah, mohon di perhatikan";

const String articleDate = "17 Sept 2026";

const ArticleSample _publicSample = ArticleSample(
  title: "Kala Gelaran Final MTQ 2026 di Jateng Pukau Ribuan Orang",
);

const ArticleSample _opdSample = ArticleSample(
  title: "Timsel Calon Anggota Komisi Informasi Jamin Kerahasiaan Soal Seleksi",
);

const List<ArticleSample> _publicSamples = [
  _publicSample,
  _publicSample,
  _publicSample,
];

const List<ArticleSample> _opdSamples = [_opdSample, _opdSample, _opdSample];

final List<ArticleCategory> articleCategories = [
  ArticleCategory(
    label: "Publik",
    titleColor: Colors.black,
    titleFontWeight: FontWeight.w500,
    samples: _publicSamples,
  ),
  ArticleCategory(
    label: "Rilis",
    titleColor: AppColors.primary,
    samples: _opdSamples,
  ),
  ArticleCategory(
    label: "Berita Daerah",
    titleColor: AppColors.primary,
    samples: _opdSamples,
  ),
  ArticleCategory(
    label: "Berita OPD",
    titleColor: AppColors.primary,
    samples: _opdSamples,
  ),
];
