import 'package:flutter/material.dart';

typedef HomeMenuPageBuilder = Widget Function();

class HomeMenuItem {
  const HomeMenuItem({
    required this.title,
    required this.icon,
    required this.pageBuilder,
  });

  final String title;
  final String icon;
  final HomeMenuPageBuilder pageBuilder;
}
