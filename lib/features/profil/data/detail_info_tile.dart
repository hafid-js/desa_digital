import 'package:flutter/material.dart';
class DetailInfoTile extends StatelessWidget {
  final String title;
  final String value;

  const DetailInfoTile({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title, 
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 4), // Opsional: Beri sedikit jarak antar teks
        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: Colors.black),
        ),
                      SizedBox(height: 8),
      ],
    );
  }
}