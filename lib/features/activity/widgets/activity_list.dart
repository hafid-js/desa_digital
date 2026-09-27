import 'package:desa_digital/features/activity/data/activity_items.dart';
import 'package:flutter/material.dart';

class ActivityList extends StatelessWidget {
  const ActivityList({
    super.key,
    required this.items,
    required this.itemBuilder,
  });

  final List<ActivityItem> items;
  final Widget Function(ActivityItem item) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => itemBuilder(items[index]),
    );
  }
}
