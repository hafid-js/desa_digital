import 'package:desa_digital/core/utils/constants/app_colors.dart';
import 'package:desa_digital/features/profil/data/detail_info_tile.dart';
import 'package:desa_digital/features/profil/screens/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:iconsax/iconsax.dart';

class ProfileDataScreen extends StatelessWidget {
  const ProfileDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Data Diri", style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          padding: EdgeInsets.only(top: 20, right: 1, left: 1, bottom: 1),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                Center(
                  child: CircleAvatar(
                    backgroundColor: AppColors.primary.withAlpha(40),
                    radius: 45,
                    child: Icon(
                      Iconsax.user,
                      size: 30,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                DetailInfoTile(title: "Nama", value: "Hafid Tech"),
                DetailInfoTile(title: "Email", value: "dev*****@hafidtech.com"),
                DetailInfoTile(title: "No. HP", value: "628232287****"),
                DetailInfoTile(title: "NIK", value: "-"),
                DetailInfoTile(title: "Tempat, Tanggal Lahir", value: "-,-"),
                DetailInfoTile(title: "Jenis Kelamin", value: "-"),
                DetailInfoTile(title: "Alamat", value: "-,-,-,-"),
                DetailInfoTile(title: "Agama", value: "-"),
                DetailInfoTile(title: "Status Perkawinan", value: "-"),
                Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom), child: ElevatedButton(
                  onPressed: () => Get.to(() => EditProfileScreen()),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.primary,
                    elevation: 0,
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Ubah Data",
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium!.copyWith(color: Colors.white),
                  ),
                ),
              ),
                ]
            ),
          ),
        ),
      ),)
    );
  }
}
