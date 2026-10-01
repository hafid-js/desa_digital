import 'package:desa_digital/core/constants/app_colors.dart';
import 'package:desa_digital/features/autentikasi/screens/register/register_step_2_screen.dart';
import 'package:desa_digital/features/profil/screens/kata_sandi_baru_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterStep1Screen extends StatefulWidget {
  const RegisterStep1Screen({super.key});

  @override
  RegisterStep1ScreenFieldState createState() => RegisterStep1ScreenFieldState();
}

class RegisterStep1ScreenFieldState extends State<RegisterStep1Screen> {

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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(118),
        child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Masukkan Alamat Email",
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        Text(
                          "Pastikan email aktif jaga-jaga kalau kamu lupa password",
                          style: Theme.of(context).textTheme.labelSmall!
                              .copyWith(
                                color: Colors.black87,
                                fontWeight: FontWeight.w300,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 30),
        child: Column(
          children: [
            TextFormField(
              focusNode: _focusNode,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Contoh: hafid.tampan@gmail.com",
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  fontWeight: FontWeight.w300,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: AppColors.primary,
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: AppColors.grey.withAlpha(120),
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "1 dari 4",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                Text(
                  "Langkah Registrasi",
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall!.copyWith(color: AppColors.textSecondaryLight, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 12,
              ),
              child: ElevatedButton(
                onPressed: () => Get.to(() => RegisterStep2Screen()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Lanjut",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
