
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

final List<Map<String, dynamic>> dataMenuProfile = [
  {
    "title": "Akun",
    "items": [
      {"icon": Iconsax.profile_circle, "name": "Informasi Pribadi"},
      {"icon": Iconsax.setting_2, "name": "Pengaturan Akun"},
    ],
  },
  {
    "title": "Lainnya",
    "items": [
      {"icon": Icons.contact_support_outlined, "name": "Pusat Bantuan"},
      {"icon": Iconsax.document_text, "name": "Syarat & Ketentuan"},
      {"icon": Iconsax.security, "name": "Kebijakan Privasi"},
      {"icon": Iconsax.star, "name": "Rating Aplikasi"},
    ],
  },
];