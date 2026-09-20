import 'package:desa_digital/core/utils/constants/app_colors.dart';
import 'package:desa_digital/features/profil/screens/edit_profile_screen.dart';
import 'package:desa_digital/features/profil/screens/profile_detail_screen.dart';
import 'package:desa_digital/features/profil/screens/setting_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuProfile extends StatelessWidget {
  final Map<String, dynamic> item;

  void openPrivacyPolicy() async {
    final Uri url = Uri.parse("https://laporgub.jatengprov.go.id/privacy");

    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw 'Could not launch $url';
    }
  }

  void termsAndConditions() async {
    final Uri url = Uri.parse(
      "https://lakon.jatengprov.go.id/ketentuan-pengguna",
    );

    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw 'Could not launch $url';
    }
  }

  const MenuProfile({super.key, required this.item});

  void _handleTap() {
    if (item['name'] == 'Informasi Pribadi') {
      Get.to(() => ProfileDataScreen());
    } else if (item['name'] == 'Pengaturan Akun') {
      Get.to(() => SettingProfileScreen());
    } else if (item['name'] == 'Kebijakan Privasi') {
      openPrivacyPolicy();
    } else if (item['name'] == 'Syarat & Ketentuan') {
      termsAndConditions();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: _handleTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Image.asset(item['icon']!, height: 25, width: 25),
                  Icon(item['icon']!, size: 25, color: AppColors.primary.withAlpha(180)),
                  const SizedBox(width: 10),
                  Text(
                    item['name']!,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 15)
                  ),
                ],
              ),
              Row(
                children: [
                  if (item['name'] == "Rating Aplikasi") Text("v1.0.0", style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.black, fontSize: 11),),
                  const SizedBox(width: 16),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 22,
                    color: AppColors.primary.withAlpha(180),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        if (item['name'] != "Rating Aplikasi")
          Divider(color: AppColors.grey.withAlpha(80), thickness: 1),
        const SizedBox(height: 18),
      ],
    );
  }
}