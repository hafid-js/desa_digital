import 'package:desa_digital/core/widgets/rounded_image.dart';
import 'package:desa_digital/features/agenda/data/event_agenda.dart';
import 'package:desa_digital/features/agenda/screens/detail_agenda_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KartuAgenda extends StatelessWidget {
  const KartuAgenda({super.key, required this.event});

  final EventAgenda event;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => const DetailEventScreen()),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppRoundedImage(
            fit: BoxFit.cover,
            imageUrl: event.image,
            isNetworkImage: false,
            width: 90,
            height: 90,
            borderRadius: 8,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        event.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.arrow_forward_ios, size: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  event.date,
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall!.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
