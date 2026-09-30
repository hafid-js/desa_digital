import 'package:desa_digital/core/constants/app_colors.dart';
import 'package:desa_digital/core/widgets/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconsax/iconsax.dart';

class LapakWargaScreen extends StatelessWidget {
  const LapakWargaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lapak Warga",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: MasonryGridView.count(
          itemCount: 8,
          crossAxisCount: 2,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          "assets/images/lapak_warga/handphone.png",
                          height: 130,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(6),
                              topRight: Radius.circular(6),
                            ),
                          ),
                          child: const Text(
                            "-55%",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  Text(
                    "Columbia Women's Castback TC PFG Shoes",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(height: 2),

                  Row(
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(fontSize: 11, color: Colors.black),
                          children: [
                            TextSpan(
                              text: "Rp",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.red,
                              ),
                            ),
                            TextSpan(
                              text: "31.800",
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.red,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 2),
                      Icon(Iconsax.ticket, size: 15, color: Colors.red),
                      SizedBox(width: 2),
                      Expanded(
                        child: Text(
                          "Rp150.00000",
                          style: Theme.of(context).textTheme.labelSmall!
                              .copyWith(
                                fontSize: 11,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.grey,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 2),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const AppRoundedImage(
                        imageUrl: "assets/images/lapak_warga/user_example.jpg",
                        height: 25,
                        width: 25,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hafid Tech",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.labelSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                  ),
                            ),
                            const SizedBox(height: 2),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 1),
                                  child: Icon(
                                    Icons.location_on,
                                    size: 12,
                                    color: AppColors.primary,
                                  ),
                                ),
                                const SizedBox(width: 2),
                                Expanded(
                                  child: Text(
                                    "Dusun Karangsari",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(
                                          fontSize: 10,
                                          color: Colors.black54,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
