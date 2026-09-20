import 'package:desa_digital/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Jika menggunakan GetX untuk validasi email (GetUtils.isEmail)

class EditEmailScreen extends StatelessWidget {
  EditEmailScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final ValueNotifier<bool> _isValid = ValueNotifier<bool>(false);

  void _validateEmail(String value) {
    final bool isEmailValid = value.isNotEmpty && GetUtils.isEmail(value);
    _isValid.value = isEmailValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.light,
        surfaceTintColor: AppColors.light,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: AppColors.light,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Edit Alamat Email",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  "Pastikan email aktif untuk menerima kode keamanan",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: TextFormField(
          controller: _emailController,
          autofocus: true,
          keyboardType: TextInputType.emailAddress,
          onChanged: _validateEmail,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelText: "Email",
            labelStyle: const TextStyle(fontSize: 14, color: Colors.grey),
            floatingLabelStyle: TextStyle(color: AppColors.primary),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: AppColors.primary, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: AppColors.primary),
            ),
          ),
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder<bool>(
        valueListenable: _isValid,
        builder: (context, isValid, child) {
          return Padding(
            padding: EdgeInsets.only(
              right: 12,
              left: 12,
              bottom: MediaQuery.of(context).viewInsets.bottom + 12,
            ),
            child: ElevatedButton(
              onPressed: isValid ? () {} : null,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                backgroundColor: isValid
                    ? AppColors.primary
                    : AppColors.primary.withAlpha(40),
                elevation: 0,
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Simpan & Kirim Kode",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isValid ? Colors.white : Colors.white.withAlpha(150),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
