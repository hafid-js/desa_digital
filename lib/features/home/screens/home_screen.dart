import 'package:desa_digital/core/widgets/search_bar.dart';
import 'package:desa_digital/features/artikel/screens/artikel_screen.dart';
import 'package:desa_digital/features/home/data/datasources/article.dart';
import 'package:desa_digital/features/home/data/datasources/events.dart';
import 'package:desa_digital/features/home/data/datasources/menu_items.dart';
import 'package:desa_digital/features/home/screens/widgets/call_center_card.dart';
import 'package:desa_digital/features/home/screens/widgets/content_section.dart';
import 'package:desa_digital/features/home/screens/widgets/footer.dart';
import 'package:desa_digital/features/home/screens/widgets/home_app_bar.dart';
import 'package:desa_digital/features/home/screens/widgets/promo_card.dart';
import 'package:desa_digital/helpers/responsive_helper.dart';
import 'package:desa_digital/shared/widgets/rounded_image.dart';
import 'package:desa_digital/shared/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(toolbarHeight: 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  _buildBannerSection(context),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                    child: Column(
                      children: [
                        CallCenterCard(),
                        SizedBox(height: 20),
                        _buildMenuSection(context),
                        SizedBox(height: 20),
                        // PromoCard(),
                        // Column(
                        //   children: [
                        //     USectionHeading(
                        //       title: "Beasiswa Santri dan Pengasuh",
                        //       buttonTitle: '',
                        //     ),
                        //     URoundedImage(
                        //       imageUrl: "assets/images/banners/banner-4.png",
                        //       isNetworkImage: false,
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ContentSection(
              title: "Agenda Hari Ini",
              items: events,
              padding: const EdgeInsets.only(left: 15, top: 5, bottom: 8),
              onButtonPressed: () {},
              onTap: (item) {},
            ),
            SizedBox(height: 20),
            ContentSection(
              title: "Artikel Terbaru",
              items: articles,
              padding: const EdgeInsets.only(left: 15, top: 5, bottom: 20),
              onButtonPressed: () => Get.to(()=> BeritaScreen()),
              onTap: (item) {},
            ),
            Footer()
          ],
        ),
      ),
    );
  }

  Widget _buildBannerSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 16,
        right: 16,
        left: 16,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        image: DecorationImage(
          opacity: 0.5,
          image: AssetImage(
            "assets/images/banners/banner-background.png",
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppSearchBar(
                  hintText: "Sedang butuh layanan apa?",
                ),
              ),
              SizedBox(width: 15),
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(
                  "assets/icons/tanya.jpg",
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          HomeAppBar(),
        ],
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    return Column(
      children: [
        AnimatedSize(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: GridView.count(
            crossAxisCount: Responsive.gridColumns(
              context,
              phone: 4,
              tablet: 4,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: Responsive.value(context, phone: 12, tablet: 16),
            mainAxisSpacing: Responsive.value(context, phone: 12, tablet: 16),
            childAspectRatio: Responsive.value(
              context,
              phone: 0.8,
              tablet: 1.0,
            ),
            padding: EdgeInsets.zero,
            children: menuItems
                .map((menu) => _buildMenuItem(context, menu))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(BuildContext context, Map menu) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        if (menu["page"] != null) {
          final binding = menu["binding"];

          if (binding != null) {
            Get.to(menu["page"], binding: binding);
          } else {
            Get.to(menu["page"]);
          }
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(menu["icon"], height: 40, width: 40),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              menu["title"],
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
