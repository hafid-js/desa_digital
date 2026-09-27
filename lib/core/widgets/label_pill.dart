import 'package:flutter/material.dart';

/// Label kecil berbentuk pill untuk status (mis. "Progress", "Selesai").
class LabelPill extends StatelessWidget {
  const LabelPill({
    super.key,
    required this.label,
    required this.color,
    required this.backgroundColor,
    this.icon,
  });

  final String label;
  final Color color;
  final Color backgroundColor;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: color,
      fontSize: 10,
      fontWeight: FontWeight.w600,
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: icon == null
          ? Text(label, style: style)
          : Row(
              children: [
                Icon(icon, size: 12),
                SizedBox(width: 5),
                Text(label, style: style),
              ],
            ),
    );
  }
}
