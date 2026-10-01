import 'package:desa_digital/app/main_shell.dart';
import 'package:desa_digital/core/constants/app_colors.dart';
import 'package:desa_digital/features/autentikasi/screens/register/register_step_1_screen.dart';
import 'package:desa_digital/features/home/screens/home_screen.dart';
import 'package:desa_digital/features/profil/screens/lupa_password_screen.dart';
import 'package:desa_digital/features/profil/screens/ubah_kata_sandi_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obsecureText = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),

      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 40),
                      child: Center(
                        child: Image.asset(
                          "assets/images/logo_main.png",
                          height: 100,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Sugeng Rawuh",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Masukkan alamat email dan password kamu",
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      // controller: _emailController,
                      // autofocus: true,
                      keyboardType: TextInputType.emailAddress,

                      // onChanged: _validateEmail,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_rounded,
                          size: 20,
                          color: Colors.grey,
                        ),

                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        hintText: "Masukkan email / no WA",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.w300,
                        ),
                        floatingLabelStyle: TextStyle(color: AppColors.primary),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: AppColors.primary,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: AppColors.primary),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      // controller: _emailController,
                      // autofocus: true,
                      obscureText: _obsecureText,

                      keyboardType: TextInputType.emailAddress,
                      // onChanged: _validateEmail,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Iconsax.key1,
                          size: 20,
                          color: Colors.grey,
                        ),
                        suffixIcon: IconButton(
                          onPressed: _togglePasswordVisibility,
                          icon: Icon(
                            _obsecureText ? Iconsax.eye : Iconsax.eye_slash,
                          ),
                          color: AppColors.textSecondaryLight,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        hintText: "Masukkan password",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.w300,
                        ),
                        floatingLabelStyle: TextStyle(color: AppColors.primary),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: AppColors.primary,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: AppColors.primary),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => Get.to(() => MainShell()),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.primary,
                        elevation: 0,
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        "Masuk",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => Get.to(() => LupaPasswordScreen()), child: Center(
                      child: Text(
                        "Lupa Password?",
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),),
                    
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(thickness: 0.25, color: Colors.grey),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'Atau',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),

                        Expanded(
                          child: Divider(thickness: 0.25, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
                        backgroundColor: AppColors.textPrimaryDark,
                        foregroundColor: AppColors.textPrimaryDark,
                        elevation: 0.8,
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(FontAwesomeIcons.google, color: Colors.black),
                          SizedBox(width: 10),
                          Text(
                            "Masuk/Daftar dengan Google",
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.black,
                        elevation: 0.8,
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.apple,
                            color: AppColors.textPrimaryDark,
                          ),

                          SizedBox(width: 10),
                          Text(
                            "Masuk/Daftar dengan Apple",
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(
                                  fontSize: 15,
                                  color: AppColors.textPrimaryDark,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "Dengan masuk ke aplikasi Desa Ngopeni Nglakoni, kamu menyetujui ",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black87,
                            ),
                          ),
                          TextSpan(
                            text: "Syarat dan Ketentuan ",
                            style: TextStyle(
                              fontSize: 10,
                              color: AppColors.secondary,
                            ),
                          ),
                          TextSpan(
                            text: "serta ",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black87,
                            ),
                          ),
                          TextSpan(
                            text: "Kebijakan Privasi ",
                            style: TextStyle(
                              fontSize: 10,
                              color: AppColors.secondary,
                            ),
                          ),
                          TextSpan(
                            text: "yang berlaku.",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Belum punya akun? ",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          TextSpan(
                            text: "Daftar disini",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.to(() => const RegisterStep1Screen())
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
