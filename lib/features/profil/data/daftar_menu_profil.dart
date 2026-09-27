import 'package:desa_digital/features/profil/data/models/item_menu_profil.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

final List<BagianMenuProfil> bagianMenuProfil = [
  BagianMenuProfil(
    title: 'Akun',
    items: [
      ItemMenuProfil(
        icon: Iconsax.profile_circle,
        label: 'Informasi Pribadi',
        action: ProfileMenuAction.profileInfo,
      ),
      ItemMenuProfil(
        icon: Iconsax.setting_2,
        label: 'Pengaturan Akun',
        action: ProfileMenuAction.accountSettings,
        showDivider: false,
      ),
    ],
  ),
  BagianMenuProfil(
    title: 'Lainnya',
    items: [
      ItemMenuProfil(
        icon: Icons.contact_support_outlined,
        label: 'Pusat Bantuan',
        action: ProfileMenuAction.helpCenter,
      ),
      ItemMenuProfil(
        icon: Iconsax.document_text,
        label: 'Syarat & Ketentuan',
        action: ProfileMenuAction.termsConditions,
      ),
      ItemMenuProfil(
        icon: Iconsax.security,
        label: 'Kebijakan Privasi',
        action: ProfileMenuAction.privacyPolicy,
      ),
      ItemMenuProfil(
        icon: Iconsax.star,
        label: 'Rating Aplikasi',
        action: ProfileMenuAction.rateApp,
        showDivider: false,
      ),
    ],
  ),
];
