
import 'package:desa_digital/app/main_shell.dart';
import 'package:desa_digital/core/theme/app_theme.dart';
import 'package:desa_digital/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Root widget aplikasi. Seluruh konfigurasi global (tema, navigasi,
/// batasan skala teks) dikumpulkan di sini agar [main] tetap tipis.
class DesaDigitalApp extends StatelessWidget {
  const DesaDigitalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desa Digital',

      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.light,

      // Skala teks dikunci di 100% agar tampilan seragam di semua perangkat.
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.noScaling),
          child: child!,
        );
      },

      home: MainShell(),
    );
  }
}
