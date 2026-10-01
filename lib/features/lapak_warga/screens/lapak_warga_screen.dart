import 'package:desa_digital/core/constants/app_colors.dart';
import 'package:desa_digital/core/widgets/rounded_image.dart';
import 'package:desa_digital/features/lapak_warga/screens/widgets/lapak_detail_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconsax/iconsax.dart';

class LapakWargaScreen extends StatelessWidget {
  const LapakWargaScreen({super.key});

  void _showDetailModal(BuildContext context, Map<String, dynamic> product) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,

      sheetAnimationStyle: AnimationStyle(
        duration: const Duration(milliseconds: 500),
        reverseDuration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.4,
          maxChildSize: 0.95,
          snap: true,
          snapSizes: const [0.9],
          builder: (context, scrollController) {
            return ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: LapakDesaDetailModal(
                product: product,
                scrollController: scrollController,
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final dummyProduct = {
      "title": "Columbia Women's Castback TC PFG Shoes",
      "price": "31.800",
      "originalPrice": "150.000",
      "discount": "-55%",
      "seller": "Sumanto",
      "location": "Dusun Karangsari",
      "image": "assets/images/lapak_warga/handphone.png",
      "userAvatar": "assets/images/lapak_warga/user_example.jpg",
      "description":
          "Sepatu berkualitas hasil karya warga lokal desa. Nyaman dipakai untuk beraktivitas sehari-hari, awet, dan tahan lama.",
    };

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
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          itemBuilder: (context, index) {
            return _LapakItemCard(
              product: dummyProduct,
              onTap: () => _showDetailModal(context, dummyProduct),
            );
          },
        ),
      ),
    );
  }
}

class _LapakItemCard extends StatefulWidget {
  final Map<String, dynamic> product;
  final VoidCallback onTap;

  const _LapakItemCard({required this.product, required this.onTap});

  @override
  State<_LapakItemCard> createState() => _LapakItemCardState();
}

class _LapakItemCardState extends State<_LapakItemCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: widget.onTap,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        widget.product["image"],
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Positioned(
                    //   top: 0,
                    //   right: 0,
                    //   child: Container(
                    //     padding: const EdgeInsets.symmetric(
                    //       horizontal: 6,
                    //       vertical: 2,
                    //     ),
                    //     decoration: const BoxDecoration(
                    //       color: Colors.red,
                    //       borderRadius: BorderRadius.only(
                    //         bottomLeft: Radius.circular(6),
                    //         topRight: Radius.circular(6),
                    //       ),
                    //     ),
                    //     child: Text(
                    //       widget.product["discount"] ?? "-55%",
                    //       style: const TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 10,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(height: 6),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        widget.product["title"],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      child: Icon(
                        isFavorite ? Iconsax.heart5 : Iconsax.heart,
                        color: isFavorite ? Colors.redAccent : AppColors.textSecondaryLight,
                        size: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.black,
                        ),
                        children: [
                          const TextSpan(
                            text: "Rp",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ),
                          ),
                          TextSpan(
                            text: widget.product["price"],
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.red,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Iconsax.ticket, size: 14, color: Colors.red),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        "Rp${widget.product['originalPrice']}",
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 10,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                // Row(
                //   children: [
                //     AppRoundedImage(
                //       imageUrl: widget.product["userAvatar"],
                //       height: 24,
                //       width: 24,
                //       fit: BoxFit.cover,
                //     ),
                //     const SizedBox(width: 6),
                //     Expanded(
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             widget.product["seller"],
                //             maxLines: 1,
                //             overflow: TextOverflow.ellipsis,
                //             style: Theme.of(context).textTheme.labelSmall!
                //                 .copyWith(color: AppColors.textSecondaryLight, fontSize: 10),
                //           ),
                //           Row(
                //             children: [
                //               Icon(
                //                 Icons.location_on,
                //                 size: 11,
                //                 color: AppColors.primary,
                //               ),
                //               const SizedBox(width: 2),
                //               Expanded(
                //                 child: Text(
                //                   widget.product["location"],
                //                   maxLines: 1,
                //                   overflow: TextOverflow.ellipsis,
                //                   style: Theme.of(context).textTheme.labelSmall!
                //                       .copyWith(
                //                         fontSize: 10,
                //                         color: AppColors.textSecondaryLight,
                //                       ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

