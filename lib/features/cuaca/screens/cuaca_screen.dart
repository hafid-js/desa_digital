import 'package:desa_digital/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CuacaScreen extends StatefulWidget {
  const CuacaScreen({super.key});

  @override
  State<CuacaScreen> createState() => _CuacaScreenState();
}

class _CuacaScreenState extends State<CuacaScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Prakiraan Cuaca",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: TextFormField(
              autofocus: true,
              keyboardType: TextInputType.name,
              controller: _searchController,
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search, color: Colors.black87),
                hint: Text(
                  "Cari lokasi",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                floatingLabelStyle: TextStyle(color: AppColors.primary),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: AppColors.grey.withAlpha(180),
                    width: 1.5,
                  ),
                ),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(
                          Iconsax.close_circle5,
                          size: 20,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          _searchController.clear();
                          setState(() {});
                        },
                      )
                    : null,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: AppColors.grey.withAlpha(180),
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey.withAlpha(50),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withAlpha(50),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.location_on_outlined,
                            color: AppColors.primary,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          "Cepedak, Bruno",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      height: 140,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 12),
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            width: 120,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withAlpha(50),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Min, 4 Okt",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                SizedBox(height: 5),
                                Image.asset(
                                  "assets/icons/cloud.png",
                                  height: 30,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Berawan",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "24-29",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "68-87%",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey.withAlpha(50),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withAlpha(50),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.location_on_outlined,
                            color: AppColors.primary,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          "Cepedak, Bruno",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      height: 140,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 12),
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            width: 120,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withAlpha(50),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Min, 4 Okt",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                SizedBox(height: 5),
                                Image.asset(
                                  "assets/icons/cloud.png",
                                  height: 30,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Berawan",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "24-29",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "68-87%",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey.withAlpha(50),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withAlpha(50),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.location_on_outlined,
                            color: AppColors.primary,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          "Cepedak, Bruno",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      height: 140,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 12),
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            width: 120,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withAlpha(50),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Min, 4 Okt",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                SizedBox(height: 5),
                                Image.asset(
                                  "assets/icons/cloud.png",
                                  height: 30,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Berawan",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "24-29",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "68-87%",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey.withAlpha(50),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withAlpha(50),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.location_on_outlined,
                            color: AppColors.primary,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          "Cepedak, Bruno",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      height: 140,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 12),
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            width: 120,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withAlpha(50),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Min, 4 Okt",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                SizedBox(height: 5),
                                Image.asset(
                                  "assets/icons/cloud.png",
                                  height: 30,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Berawan",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "24-29",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "68-87%",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey.withAlpha(50),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withAlpha(50),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.location_on_outlined,
                            color: AppColors.primary,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          "Cepedak, Bruno",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      height: 140,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 12),
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            width: 120,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withAlpha(50),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Min, 4 Okt",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                SizedBox(height: 5),
                                Image.asset(
                                  "assets/icons/cloud.png",
                                  height: 30,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Berawan",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "24-29",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "68-87%",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
