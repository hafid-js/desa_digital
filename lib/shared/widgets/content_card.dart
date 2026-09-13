import 'package:desa_digital/shared/models/content_item.dart';
import 'package:desa_digital/shared/widgets/rounded_image.dart';
import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({
    super.key,
    required this.item,
     required this.onTap,
  });

  final ContentItem item;
    final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 165,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            URoundedImage(
              imageUrl: item.image,
              isNetworkImage: false,
              height: 100,
              width: 165,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 6),
            Text(
              item.title,
              style: Theme.of(context).textTheme.titleSmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 2),
            Text(
              item.date,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
