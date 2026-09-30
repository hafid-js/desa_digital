import 'package:desa_digital/core/constants/app_assets.dart';
import 'package:desa_digital/core/widgets/app_search_bar.dart';
import 'package:desa_digital/features/artikel/screens/daftar_artikel_screen.dart';
import 'package:desa_digital/features/home/data/item_artikel.dart';
import 'package:desa_digital/features/home/data/item_agenda.dart';
import 'package:desa_digital/features/home/data/menu_items.dart';
import 'package:desa_digital/features/home/data/models/home_menu_item.dart';
import 'package:desa_digital/features/home/widgets/apbdes_section.dart';
import 'package:desa_digital/features/home/widgets/call_center_card.dart';
import 'package:desa_digital/features/home/widgets/content_section.dart';
import 'package:desa_digital/features/home/widgets/footer.dart';
import 'package:desa_digital/features/home/widgets/home_app_bar.dart';
import 'package:desa_digital/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ContentSection(
              title: "Agenda Hari Ini",
              items: daftarAgenda,
              padding: const EdgeInsets.only(left: 15, top: 5, bottom: 8),
              onButtonPressed: () {},
              onTap: (item) {},
            ),
            SizedBox(height: 20),
            ContentSection(
              title: "Artikel Terbaru",
              items: daftarArtikel,
              padding: const EdgeInsets.only(left: 15, top: 5, bottom: 20),
              onButtonPressed: () => Get.to(() => DaftarArtikelScreen()),
              onTap: (item) {},
            ),
            SizedBox(height: 8),
            ApbdesSection(),
            Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildBannerSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        image: DecorationImage(
          opacity: 0.5,
          image: AssetImage(AppAssets.bannerBackground),
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
                child: AppSearchBar(hintText: "Sedang butuh layanan apa?"),
              ),
              SizedBox(width: 15),
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(AppAssets.iconTanya),
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
            children: homeMenuItems
                .map((menu) => _buildMenuItem(context, menu))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(BuildContext context, HomeMenuItem menu) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => Get.to(menu.pageBuilder),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(menu.icon, height: 40, width: 40),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              menu.title,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.titleSmall!.copyWith(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
