import 'package:flutter/material.dart';

enum ProfileMenuAction {
  profileInfo,
  accountSettings,
  helpCenter,
  termsConditions,
  privacyPolicy,
  rateApp,
}

class ItemMenuProfil {
  const ItemMenuProfil({
    required this.icon,
    required this.label,
    required this.action,
    this.showDivider = true,
  });

  final IconData icon;
  final String label;
  final ProfileMenuAction action;

  final bool showDivider;
}

class BagianMenuProfil {
  const BagianMenuProfil({required this.title, required this.items});

  final String title;
  final List<ItemMenuProfil> items;
}
