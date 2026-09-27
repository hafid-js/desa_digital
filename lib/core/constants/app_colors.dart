import 'package:desa_digital/core/utils/color_utils.dart';
import 'package:flutter/material.dart';

/// Sumber tunggal warna aplikasi.
///
/// Seluruh nilai berasal dari palet yang sudah dipakai sebelum refactor,
/// jadi tampilan tidak berubah. Tambahkan warna baru hanya di sini.
final class AppColors {
  AppColors._();

  // ---------------------------------------------------------------------
  // PRIMARY
  // ---------------------------------------------------------------------

  /// Warna utama aplikasi. Dipakai sebagai `ThemeData.primaryColor` dan
  /// `ColorScheme.primary`, sehingga tombol, ikon aktif, dan status bar
  /// mengambil warna ini secara otomatis.
  static Color primary = HexColor.fromHex('#455cca');

  static Color blue = HexColor.fromHex('#020381');
  static Color green = HexColor.fromHex('#23a842');
  static Color secondary = HexColor.fromHex('#fd7e14');
  static Color tertiary = HexColor.fromHex('#4EA6DC');
  static Color quartenary = HexColor.fromHex('#2B8637');

  // ---------------------------------------------------------------------
  // LIGHT
  // ---------------------------------------------------------------------

  static Color light = HexColor.fromHex('#F5F6F6');
  static Color lightCard = Colors.white;
  static Color lightSurface = HexColor.fromHex('#F5F6F6');
  static Color lightDisableColor = HexColor.fromHex('#F6F8F9');

  // ---------------------------------------------------------------------
  // DARK
  // ---------------------------------------------------------------------

  static const Color dark = Color(0xFF0F202B);
  static const Color darkCard = Color(0xFF132E3A);
  static const Color darkSurface = Color(0xFF17404A);
  static Color darkDisableColor = HexColor.fromHex('#193341');

  // ---------------------------------------------------------------------
  // TEXT
  // ---------------------------------------------------------------------

  static const Color textPrimaryDark = Colors.white;
  static const Color textSecondaryDark = Color(0xFF8BA4B4);
  static const Color textPrimaryLight = Color(0xFF2D4A52);
  static Color textSecondaryLight = Color.fromARGB(255, 128, 125, 125);
  static Color textSection = HexColor.fromHex('#2D4A52');

  // ---------------------------------------------------------------------
  // NEUTRAL & BORDER
  // ---------------------------------------------------------------------

  static Color grey = HexColor.fromHex('#AAB1B9');
  static const Color white = Colors.white;
  static const Color black = Color(0xFF232323);
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);
  static const Color background = Color(0xFFF7F8FB);

  // ---------------------------------------------------------------------
  // STATUS
  // ---------------------------------------------------------------------

  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);
  static const Color yellow = Color(0xFFFFE24B);
}
