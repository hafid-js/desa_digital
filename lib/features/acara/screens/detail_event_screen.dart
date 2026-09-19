import 'package:desa_digital/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DetailEventScreen extends StatelessWidget {
  const DetailEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "Detail Acara",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [Icon(Icons.share_outlined)],
        actionsPadding: EdgeInsets.only(right: 12),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/events/event-1.png",
              fit: BoxFit.contain,
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bazar Ramadhan Desa Gunung Condong",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 5),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Diselenggarakan oleh ",
                          style: Theme.of(
                            context,
                          ).textTheme.labelSmall!.copyWith(color: Colors.black),
                        ),
                        TextSpan(
                          text: "Arga Bina Cipta",
                          style: Theme.of(context).textTheme.labelSmall!
                              .copyWith(color: AppColors.secondary),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(Iconsax.calendar_tick5, color: AppColors.primary),
                      SizedBox(width: 10),
                      Text(
                        "19 September 2026",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.location_on_sharp, color: AppColors.primary),
                      SizedBox(width: 10),
                      Text(
                        "Gedung Kelurahan",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    "DESKRIPSI",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library in London, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset's Body Type sheets.",
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium!.copyWith(color: Colors.black87),
                    textAlign: TextAlign.justify,
                    softWrap: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
