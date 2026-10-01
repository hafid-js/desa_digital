import 'package:desa_digital/core/constants/app_colors.dart';
import 'package:desa_digital/features/autentikasi/screens/register/register_step_2_screen.dart';
import 'package:desa_digital/features/profil/screens/verifikasi_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class RegisterStep4Screen extends StatefulWidget {
  const RegisterStep4Screen({super.key});

  @override
  RegisterStep4ScreenFieldState createState() => RegisterStep4ScreenFieldState();
}

class RegisterStep4ScreenFieldState extends State<RegisterStep4Screen> {

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
                          "Masukkan No. Whatsapp",
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        Text(
                          "Pastikan whatsapp aktif untuk menerima kode verifikasi",
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
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "08XXXXXXXXXX",
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
        child: Column(
                    mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(Iconsax.info_circle5, color: AppColors.tertiary),
                SizedBox(width: 9),
                Expanded(child: Column(children: [
                  RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "Dengan klik Daftar & Kirim Kode, kamu menyetujui ",
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.black87,
                            ),
                          ),
                          TextSpan(
                            text: "Syarat dan Ketentuan ",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.secondary,
                            ),
                          ),
                          TextSpan(
                            text: "serta ",
                            style: TextStyle(
                                fontSize: 11,
                              color: Colors.black87,
                            ),
                          ),
                          TextSpan(
                            text: "Kebijakan Privasi ",
                            style: TextStyle(
                                fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.secondary,
                            ),
                          ),
                          TextSpan(
                            text: "yang berlaku.",
                            style: TextStyle(
                             fontSize: 11,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],))
              ],
            ),
            SizedBox(height: 20),
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "4 dari 4",
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
                onPressed: () => Get.to(() => VerifikasiOtpScreen()),
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
                      "Daftar & Kirim Kode",
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
          ],
        )
      ),
    );
  }
}
