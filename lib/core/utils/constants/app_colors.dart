
import 'package:desa_digital/helpers/hex_color.dart';
import 'package:flutter/material.dart';
final class AppColors {
  // static Color get primary =>
  //     setting.currentColor.value;
  AppColors._();

  /// PRIMARY
  static Color primary = HexColor.fromHex("#455BCB");

  /// DARK
  static const Color dark = Color(0xFF0F202B);
  static const Color darkCard = Color(0xFF132E3A);
  static Color secondary = HexColor.fromHex("#F7771A");
  static Color darkDisableColor = HexColor.fromHex("#193341");
  static const Color darkSurface = Color(0xFF17404A);
      static Color lightSurface = HexColor.fromHex("#F5F6F6");
  // static Color get darkSurface =>
  //     setting.currentColor.value.withAlpha(50);
  //       static Color get lightSurface =>
  //     setting.currentColor.value.withAlpha(50);

  /// LIGHT
  
  static Color light = HexColor.fromHex("#F5F6F6");
  static Color lightCard = Colors.white;
  static Color textSection = HexColor.fromHex("#2D4A52");
    static Color lightDisableColor = HexColor.fromHex("#F6F8F9");
  // static const Color lightContainer = Color(0xFFEAF4F3);
// static const Color lightSurface = Color(0xFFD8EEEB);

  /// TEXT
  static const Color textPrimaryDark = Colors.white;
  static const Color textSecondaryDark = Color(0xFF8BA4B4);
// static Color get textPrimaryLight  =>
//       setting.currentColor.value;
static const Color textPrimaryLight = Color(0xFF2D4A52);
  static Color textSecondaryLight = HexColor.fromHex("#343a40");

  /// BORDER
  //  static Color get borderPrimary  =>
  //     setting.currentColor.value;
  // static const Color borderPrimary = Color(0x332DC8B9);
}