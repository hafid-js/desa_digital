import 'package:desa_digital/core/utils/constants/app_colors.dart';
import 'package:desa_digital/core/widgets/ucircular_image.dart';
import 'package:desa_digital/features/profil/data/data_menu_profile.dart';
import 'package:desa_digital/features/profil/widgets/menu_profile.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical:20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Profile",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold)
                    ),
                    SizedBox(height: 15),
                    CircleAvatar(
                      backgroundColor: AppColors.primary.withAlpha(40),
                      radius: 45,
                      child: Icon(Iconsax.user, size: 30, color: AppColors.primary,),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Unknown",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700)
                    ),
                    SizedBox(height: 5),
                    Text(
                      "support@hafidtech.com",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ),

              ...dataMenuProfile.map((category) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category['title'],
                      style: Theme.of(context).textTheme.titleLarge
                    ),

                    SizedBox(height: 30),

                    ...category['items'].map<Widget>((item) {
                      return MenuProfile(item: item);
                    }).toList(),
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }
  }