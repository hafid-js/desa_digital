import 'package:desa_digital/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:desa_digital/app/routes/app_routes.dart';
import 'package:get/get.dart';

class LocationPointField extends StatelessWidget {
  const LocationPointField({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {},
      child: TextFormField(
        readOnly: true,
        focusNode: FocusNode(),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.map_outlined, color: AppColors.primary),
          labelText: "Tambah titik lokasi (opsional)",
          labelStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
            color: AppColors.primary,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: AppColors.dark.withAlpha(50),
              width: 1.5,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: AppColors.dark.withAlpha(50),
              width: 1.5,
            ),
          ),
        ),

        onTap: () {
          Get.toNamed(Routes.pilihLokasi);
        },
      ),
    );
  }
}
