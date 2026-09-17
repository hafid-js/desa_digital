import 'package:desa_digital/core/utils/constants/app_colors.dart';
import 'package:desa_digital/core/utils/constants/colors.dart';
import 'package:desa_digital/features/aduan/screens/form_screen.dart';
import 'package:desa_digital/features/aduan/screens/list_aduan_screen.dart';
import 'package:desa_digital/shared/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class AduanScreen extends StatefulWidget {
  const AduanScreen({super.key});

  @override
  State<AduanScreen> createState() => _AduanScreenState();
}

class _AduanScreenState extends State<AduanScreen> {
  bool _agreeChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Aduan Masyarakat",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 5),
          Text(
            "Sampaikan aduan seputar layanan atau fasilitas umum di Provinsi Jawa Tengah",
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    ),
  ),
      ),

      body: Column(
        children: [
          
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                USectionHeading(title: "Lapor Aduan"),
                Padding(
                  padding: EdgeInsets.all(2),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border(
                            left: BorderSide(
                              width: 0.2,
                              color: AppColors.primary,
                            ),
                            right: BorderSide(
                              width: 0.2,
                              color: AppColors.primary,
                            ),
                            bottom: BorderSide(
                              width: 0.2,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/kamera.png",
                              height: 40,
                              width: 40,
                            ),

                            const SizedBox(width: 10),

                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    backgroundColor: Theme.of(
                                      context,
                                    ).scaffoldBackgroundColor,
                                    context: context,
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(16),
                                      ),
                                    ),
                                    builder: (context) {
                                      return StatefulBuilder(
                                        builder: (context, setModalState) {
                                          return DraggableScrollableSheet(
                                            expand: false,
                                            initialChildSize: 0.64,
                                            minChildSize: 0.3,
                                            maxChildSize: 1.0,
                                            builder: (context, scrollController) {
                                              return Padding(
                                                padding: EdgeInsets.all(12),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Perhatikan informasi berikut sebelum melaporkan aduan",
                                                      style: Theme.of(
                                                        context,
                                                      ).textTheme.titleLarge,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            vertical: 16,
                                                          ),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Iconsax
                                                                    .profile_2user,
                                                                color: AppColors
                                                                    .primary,
                                                              ),

                                                              const SizedBox(
                                                                width: 10,
                                                              ),

                                                              Expanded(
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      "Anonim",
                                                                      style: Theme.of(
                                                                        context,
                                                                      ).textTheme.titleSmall,
                                                                    ),

                                                                    const SizedBox(
                                                                      height: 5,
                                                                    ),

                                                                    Text(
                                                                      "Identitas pelapor tidak akan ditampilkan di dalam aduan. Identitas hanya dapat dilihat oleh dirimu dan admin utama.",
                                                                      style: Theme.of(
                                                                        context,
                                                                      ).textTheme.labelSmall,
                                                                      maxLines:
                                                                          5,
                                                                      softWrap:
                                                                          true,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 20),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Iconsax.lock,
                                                                color: AppColors
                                                                    .primary,
                                                              ),

                                                              const SizedBox(
                                                                width: 10,
                                                              ),

                                                              Expanded(
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      "Aduan Privat (Rahasia)",
                                                                      style: Theme.of(
                                                                        context,
                                                                      ).textTheme.titleSmall,
                                                                    ),

                                                                    const SizedBox(
                                                                      height: 5,
                                                                    ),

                                                                    Text(
                                                                      "Jenis aduan akan otomatis terpilih privat/rahasia. Aduan hanya dapat dilihat oleh petugas",
                                                                      style: Theme.of(
                                                                        context,
                                                                      ).textTheme.labelSmall,
                                                                      maxLines:
                                                                          2,
                                                                      softWrap:
                                                                          true,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 20),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Iconsax.global,
                                                                color: AppColors
                                                                    .primary,
                                                              ),

                                                              const SizedBox(
                                                                width: 10,
                                                              ),

                                                              Expanded(
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      "Aduan Publik",
                                                                      style: Theme.of(
                                                                        context,
                                                                      ).textTheme.titleSmall,
                                                                    ),

                                                                    const SizedBox(
                                                                      height: 5,
                                                                    ),

                                                                    Text(
                                                                      "Jenis aduan dapat kamu ubah menjadi publik jika kamu ingin aduan terlihat oleh pengguna aplikasi Ngopeni Nglakoni lainnya. Jika aduan Publik berisi data pribadi maka jenis akan diubah menjadi privat/rahasia.",
                                                                      style: Theme.of(
                                                                        context,
                                                                      ).textTheme.labelSmall,
                                                                      maxLines:
                                                                          5,
                                                                      softWrap:
                                                                          true,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.all(
                                                        5,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: AppColors.dark
                                                            .withAlpha(10),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              8,
                                                            ),
                                                      ),
                                                      child: CheckboxListTile(
                                                        contentPadding:
                                                            EdgeInsets.zero,
                                                        visualDensity:
                                                            VisualDensity
                                                                .compact,
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .leading,

                                                        title: Text(
                                                          "Saya sudah mengerti, jangan tampilkan lagi",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .labelSmall,
                                                        ),

                                                        value: _agreeChecked,

                                                        fillColor:
                                                            WidgetStateProperty.resolveWith<
                                                              Color
                                                            >((states) {
                                                              if (states.contains(
                                                                WidgetState
                                                                    .selected,
                                                              )) {
                                                                return AppColors
                                                                    .primary;
                                                              }
                                                              return Colors
                                                                  .white;
                                                            }),

                                                        checkColor:
                                                            Colors.white,

                                                        side: BorderSide(
                                                          color:
                                                              AppColors.primary,
                                                          width: 1.5,
                                                        ),

                                                        onChanged: (v) {
                                                          setModalState(() {
                                                            _agreeChecked =
                                                                v ?? false;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(height: 20),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: SizedBox(
                                                            height: 42,
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                border: Border(
                                                                  left: BorderSide(
                                                                    width: 0.2,
                                                                    color: Colors
                                                                        .red,
                                                                  ),
                                                                  right: BorderSide(
                                                                    width: 0.2,
                                                                    color: Colors
                                                                        .red,
                                                                  ),
                                                                  bottom: BorderSide(
                                                                    width: 0.2,
                                                                    color: Colors
                                                                        .red,
                                                                  ),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      20,
                                                                    ),
                                                              ),
                                                              child: ElevatedButton(
                                                                onPressed:
                                                                    () {},
                                                                style: ElevatedButton.styleFrom(
                                                                  backgroundColor:
                                                                      Colors.red
                                                                          .withAlpha(
                                                                            40,
                                                                          ),
                                                                  foregroundColor:
                                                                      Colors
                                                                          .red,
                                                                  elevation: 0,
                                                                  side:
                                                                      BorderSide
                                                                          .none,
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                          20,
                                                                        ),
                                                                  ),
                                                                ),
                                                                child: const Text(
                                                                  "Batal",
                                                                  style: TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .red,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 12,
                                                        ),

                                                        Expanded(
                                                          child: SizedBox(
                                                            height: 42,
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                border: Border(
                                                                  left: BorderSide(
                                                                    width: 0.2,
                                                                    color: AppColors
                                                                        .primary,
                                                                  ),
                                                                  right: BorderSide(
                                                                    width: 0.2,
                                                                    color: AppColors
                                                                        .primary,
                                                                  ),
                                                                  bottom: BorderSide(
                                                                    width: 0.2,
                                                                    color: AppColors
                                                                        .primary,
                                                                  ),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      20,
                                                                    ),
                                                              ),
                                                              child: ElevatedButton(
                                                                onPressed:
                                                                    () => Get.to(() => FormScreen()),
                                                                style: ElevatedButton.styleFrom(
                                                                  backgroundColor:
                                                                      AppColors
                                                                          .primary
                                                                          .withAlpha(
                                                                            40,
                                                                          ),
                                                                  foregroundColor:
                                                                      AppColors
                                                                          .primary,
                                                                  elevation: 0,
                                                                  side:
                                                                      BorderSide
                                                                          .none,
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                          20,
                                                                        ),
                                                                  ),
                                                                ),
                                                                child: Text(
                                                                  "Lanjutkan",
                                                                  style: TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: AppColors
                                                                        .primary,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Aduan Umum",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.titleSmall,
                                      ),

                                      const SizedBox(height: 5),

                                      Text(
                                        "Laporkan permasalahan umum seperti infrastruktur, layanan publik, dll",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.labelSmall,
                                        maxLines: 2,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                              ),
                            ),
                            Icon(
                              Iconsax.arrow_right_3,
                              color: AppColors.primary,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border(
                            left: BorderSide(
                              width: 0.2,
                              color: AppColors.primary,
                            ),
                            right: BorderSide(
                              width: 0.2,
                              color: AppColors.primary,
                            ),
                            bottom: BorderSide(
                              width: 0.2,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/icons/telepon-2.png",
                                  height: 35,
                                  width: 35,
                                ),

                                const SizedBox(width: 10),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Call Center JNN Gratis",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.titleSmall,
                                      ),

                                      const SizedBox(height: 5),

                                      Text(
                                        "Telepon bebas pulsa ke CS Jateng Ngopeni Nglakoni",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.labelSmall,
                                        maxLines: 2,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Iconsax.arrow_right_3,
                                  color: AppColors.primary,
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Divider(
                              height: 10,
                              color: AppColors.primary,
                              thickness: 0.15,
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/icons/telepon-3.png",
                                  height: 35,
                                  width: 35,
                                ),

                                const SizedBox(width: 10),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Call Center 150945",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.titleSmall,
                                      ),

                                      const SizedBox(height: 5),

                                      Text(
                                        "Telepon call center berbayar ke CS Jateng Ngpeni Nglakoni",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.labelSmall,
                                        maxLines: 2,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Iconsax.arrow_right_3,
                                  color: AppColors.primary,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                USectionHeading(title: "Jelajahi Aduan"),
                Padding(
                  padding: EdgeInsets.all(2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Get.to(() => ListAduanScreen()),
                        child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border(
                            left: BorderSide(
                              width: 0.2,
                              color: AppColors.primary,
                            ),
                            right: BorderSide(
                              width: 0.2,
                              color: AppColors.primary,
                            ),
                            bottom: BorderSide(
                              width: 0.2,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/icons/search-lampiran.png",
                                  height: 35,
                                  width: 35,
                                ),

                                const SizedBox(width: 10),

                                Text(
                                  "Lihat Aduan Masyarakat",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),

                            Icon(
                              Iconsax.arrow_right_3,
                              color: AppColors.primary,
                            ),
                          ],
                        ),
                      ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border(
                            left: BorderSide(
                              width: 0.2,
                              color: AppColors.primary,
                            ),
                            right: BorderSide(
                              width: 0.2,
                              color: AppColors.primary,
                            ),
                            bottom: BorderSide(
                              width: 0.2,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/icons/list.png",
                                  height: 35,
                                  width: 35,
                                ),

                                const SizedBox(width: 10),

                                Text(
                                  "Laporan Saya",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),

                            Icon(
                              Iconsax.arrow_right_3,
                              color: AppColors.primary,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
