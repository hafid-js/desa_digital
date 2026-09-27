import 'package:desa_digital/core/widgets/pill_tab_bar.dart';
import 'package:flutter/material.dart';

class ActivityTabSection extends StatelessWidget {
  const ActivityTabSection({
    super.key,
    required this.labels,
    required this.tabs,
  });

  final List<String> labels;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: labels.length,
      child: Builder(
        builder: (context) {
          final controller = DefaultTabController.of(context);

          return Column(
            children: [
              PillTabBar(
                labels: labels,
                controller: controller,
                padding: const EdgeInsets.all(12),
              ),
              Expanded(child: TabBarView(children: tabs)),
            ],
          );
        },
      ),
    );
  }
}
