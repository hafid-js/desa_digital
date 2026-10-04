import 'package:desa_digital/features/autentikasi/widgets/register_step_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:desa_digital/app/routes/app_routes.dart';
import 'package:get/get.dart';

class RegisterStep1Screen extends StatefulWidget {
  const RegisterStep1Screen({super.key});

  @override
  State<RegisterStep1Screen> createState() => _RegisterStep1ScreenState();
}

class _RegisterStep1ScreenState extends State<RegisterStep1Screen> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RegisterStepScaffold(
      judul: "Masukkan Alamat Email",
      subjudul: "Pastikan email aktif jaga-jaga kalau kamu lupa password",
      langkah: 1,
      field: TextFormField(
        focusNode: _focusNode,
        keyboardType: TextInputType.emailAddress,
        decoration: dekorasiInputRegistrasi(
          hint: "Contoh: hafid.tampan@gmail.com",
        ),
      ),
      onLanjut: () => Get.toNamed(Routes.registerStep2),
      labelLanjut: "Lanjut",
    );
  }
}
