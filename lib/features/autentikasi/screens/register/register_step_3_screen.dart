import 'package:desa_digital/features/autentikasi/widgets/register_step_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:desa_digital/app/routes/app_routes.dart';
import 'package:get/get.dart';

class RegisterStep3Screen extends StatefulWidget {
  const RegisterStep3Screen({super.key});

  @override
  State<RegisterStep3Screen> createState() => _RegisterStep3ScreenState();
}

class _RegisterStep3ScreenState extends State<RegisterStep3Screen> {
  final FocusNode _focusNode = FocusNode();
  bool _sembunyikanPassword = true;

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

  void _togglePassword() {
    setState(() {
      _sembunyikanPassword = !_sembunyikanPassword;
    });
  }

  InputDecoration _dekorasiPassword() {
    return dekorasiInputRegistrasi(
      hint: "Minimal 8 karakter",
      suffixIcon: IconButton(
        icon: Icon(
          _sembunyikanPassword ? Icons.visibility_off : Icons.visibility,
          color: Colors.grey,
        ),
        onPressed: _togglePassword,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RegisterStepScaffold(
      judul: "Buat Password",
      subjudul: "Gunakan kombinasi angka dan huruf",
      langkah: 3,
      field: TextFormField(
        focusNode: _focusNode,
        obscureText: _sembunyikanPassword,
        keyboardType: TextInputType.visiblePassword,
        decoration: _dekorasiPassword(),
      ),
      onLanjut: () => Get.toNamed(Routes.registerStep4),
      labelLanjut: "Lanjut",
      langkahFontWeight: null,
    );
  }
}
