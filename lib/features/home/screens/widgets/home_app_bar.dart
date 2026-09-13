import 'dart:async';

import 'package:desa_digital/core/utils/constants/colors.dart';
import 'package:desa_digital/helpers/hex_color.dart';
import 'package:desa_digital/shared/widgets/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  late final PageController _pageController;
  Timer? _autoPlayTimer;

  final List<String> sliderItems = [
    "assets/images/banners/banner-1.png",
    "assets/images/banners/banner-2.jpeg",
    "assets/images/banners/banner-3.png",
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _autoPlayTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!mounted) return;
      int nextPage = _pageController.page!.round() + 1;
      if (nextPage >= sliderItems.length) nextPage = 0;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Column(
        children: [
          SizedBox(
            height: 185,
            child: PageView.builder(
              controller: _pageController,
              itemCount: sliderItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: URoundedImage(
                    borderRadius: 22,
                    imageUrl: sliderItems[index],
                    isNetworkImage: false,
                    onTap: () {},
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          SmoothPageIndicator(
            count: sliderItems.length,
            effect: ExpandingDotsEffect(
              dotHeight: 12,
              dotWidth: 12,
              spacing: 8,
              expansionFactor: 4,
              activeDotColor: HexColor.fromHex("#ff6900"),
              dotColor: UColors.white,
            ),
            controller: _pageController,
          ),
        ],
      ),
    );
  }
}
