import 'package:desa_digital/core/utils/constants/app_colors.dart';
import 'package:desa_digital/features/aduan/presentation/controllers/wilayah_search_controller.dart';
import 'package:desa_digital/features/aduan/screens/detail_lampiran_screen.dart';
import 'package:desa_digital/features/aduan/screens/pilih_lokasi_map_screen.dart';
import 'package:desa_digital/helpers/hex_color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

enum Groceries { privat, publik }

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  PlatformFile? selectedPdf;
  PlatformFile? selectedVideo;
  XFile? selectedPhoto;
  Groceries? _selected = Groceries.privat;
  String? selectedRegion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Isi Laporan",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Lampiran Foto/Video/PDF",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    WidgetSpan(child: SizedBox(width: 5)),
                    TextSpan(
                      text: "Maks.3",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.to(
                        () => DetailLampiranScreen(),
                        arguments: "foto",
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          width: 120,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "assets/images/aduan/example1.png",
                                height: 100,
                                width: 120,
                                fit: BoxFit.cover,
                              ),

                              Container(
                                width: double.infinity,
                                color: AppColors.secondary,
                                padding: EdgeInsets.symmetric(vertical: 2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Iconsax.edit,
                                      color: Colors.white,
                                      size: 14,
                                      weight: 30,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Edit",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => Get.to(
                        () => DetailLampiranScreen(),
                        arguments: "pdf",
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          width: 120,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 100,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withAlpha(30),
                                ),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.filePdf,
                                        color: AppColors.textPrimaryLight,
                                        size: 25,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Lorem_Ipsum_is_simply_dummy_text_of_the_printing.pdf",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.labelSmall,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                color: AppColors.secondary,
                                padding: EdgeInsets.symmetric(vertical: 2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Iconsax.edit,
                                      color: Colors.white,
                                      size: 14,
                                      weight: 30,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Edit",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),

                    GestureDetector(
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

                                  initialChildSize: 0.27,
                                  minChildSize: 0.2,
                                  maxChildSize: 1.0,
                                  builder: (context, scrollController) {
                                    return Container(
                                      padding: EdgeInsets.all(12),
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Unggah Lampiran",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            "Pilih jenis lampiran yang akan kamu unggah.",
                                            style: Theme.of(
                                              context,
                                            ).textTheme.labelSmall,
                                          ),
                                          SizedBox(height: 30),
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
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                        right: BorderSide(
                                                          width: 0.2,
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                        bottom: BorderSide(
                                                          width: 0.2,
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            20,
                                                          ),
                                                    ),
                                                    child: ElevatedButton(
                                                      onPressed: () async {
                                                        final PlatformFile?
                                                        file =
                                                            await FilePicker.pickFile(
                                                              type: FileType
                                                                  .custom,
                                                              allowedExtensions:
                                                                  ['pdf'],
                                                            );

                                                        if (file != null) {
                                                          setState(() {
                                                            selectedPdf = file;
                                                          });
                                                        }
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor:
                                                            AppColors.primary
                                                                .withAlpha(40),
                                                        foregroundColor:
                                                            AppColors.primary,
                                                        elevation: 0,
                                                        side: BorderSide.none,
                                                        // shape: RoundedRectangleBorder(
                                                        //   borderRadius:
                                                        //       BorderRadius.circular(
                                                        //         20,
                                                        //       ),
                                                        // ),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .insert_drive_file_rounded,
                                                            size: 20,
                                                            color: AppColors
                                                                .primary,
                                                          ),
                                                          SizedBox(width: 6),
                                                          Text(
                                                            "File PDF",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: AppColors
                                                                  .primary,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 12),

                                              Expanded(
                                                child: SizedBox(
                                                  height: 42,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        left: BorderSide(
                                                          width: 0.2,
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                        right: BorderSide(
                                                          width: 0.2,
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                        bottom: BorderSide(
                                                          width: 0.2,
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            20,
                                                          ),
                                                    ),
                                                    child: ElevatedButton(
                                                      onPressed: () async {
                                                        final PlatformFile?
                                                        file =
                                                            await FilePicker.pickFile(
                                                              type: FileType
                                                                  .video,
                                                            );

                                                        if (file != null) {
                                                          setState(() {
                                                            selectedVideo =
                                                                file;
                                                          });
                                                        }
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor:
                                                            AppColors.primary
                                                                .withAlpha(40),
                                                        foregroundColor:
                                                            AppColors.primary,
                                                        elevation: 0,
                                                        side: BorderSide.none,
                                                        // shape: RoundedRectangleBorder(
                                                        //   borderRadius:
                                                        //       BorderRadius.circular(
                                                        //         20,
                                                        //       ),
                                                        // ),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .video_file_rounded,
                                                            size: 20,
                                                            color: AppColors
                                                                .primary,
                                                          ),
                                                          SizedBox(width: 6),
                                                          Text(
                                                            "File Video",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: AppColors
                                                                  .primary,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          ElevatedButton(
                                            onPressed: () async {
                                              final ImagePicker picker =
                                                  ImagePicker();

                                              final XFile? image = await picker
                                                  .pickImage(
                                                    source: ImageSource.camera,
                                                  );

                                              if (image != null) {
                                                print('Foto: ${image.path}');

                                                // simpan ke state kalau mau ditampilkan
                                                setState(() {
                                                  selectedPhoto = image;
                                                });
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 12,
                                              ),
                                              backgroundColor:
                                                  AppColors.primary,
                                              foregroundColor:
                                                  AppColors.primary,
                                              elevation: 0,
                                              side: BorderSide.none,
                                              // shape: RoundedRectangleBorder(
                                              //   borderRadius:
                                              //       BorderRadius.circular(
                                              //         20,
                                              //       ),
                                              // ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.camera_alt_rounded,
                                                  size: 20,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(width: 6),
                                                Text(
                                                  "Ambil Foto",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                        color: Colors.white,
                                                      ),
                                                ),
                                              ],
                                            ),
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
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withAlpha(30),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          size: 35,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Lokasi Laporan",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: 10),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {},
                child: TextFormField(
                  readOnly: true,
                  focusNode: FocusNode(),
                  decoration: InputDecoration(
                    labelText: selectedRegion ?? "Pilih Kabupaten/Kota",
                    labelStyle: Theme.of(context).textTheme.labelSmall,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: AppColors.dark.withAlpha(50),
                        width: 1.5,
                      ),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: AppColors.dark.withAlpha(50),
                        width: 1.5,
                      ),
                    ),
                  ),

                  onTap: () async {
                    final selected = await showModalBottomSheet<String>(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      ),
                      builder: (context) {
                        if (Get.isRegistered<WilayahSearchController>()) {
                          Get.delete<WilayahSearchController>();
                        }
                        final controller = Get.put(WilayahSearchController());

                        return AnimatedPadding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          duration: const Duration(milliseconds: 100),
                          child: Container(
                            height: 400,
                            padding: EdgeInsets.only(
                              right: 8,
                              left: 8,
                              top: 10,
                              bottom: 25,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  controller: controller.searchController,
                                  onChanged: controller.onQueryChanged,
                                  autofocus: true,
                                  textCapitalization:
                                      TextCapitalization.characters,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(
                                        color: AppColors.primary,
                                        width: 1,
                                      ),
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(
                                        color: AppColors.primary,
                                        width: 1,
                                      ),
                                    ),
                                    hintText:
                                        "Cari Provinsi/Kabupaten/Kecamatan/Kelurahan",
                                    hintStyle: Theme.of(
                                      context,
                                    ).textTheme.labelMedium,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Expanded(
                                  child: Obx(() {
                                    if (controller.isLoading.value) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }

                                    if (controller.results.isEmpty) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 40,
                                        ),
                                        child: Center(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.asset(
                                                "assets/images/data-kosong.png",
                                                height: 150,
                                                width: 150,
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                controller.searchController.text
                                                            .trim()
                                                            .length <
                                                        WilayahSearchController
                                                            .minChars
                                                    ? "Masukkan minimal 3 karakter pada kolom pencarian"
                                                    : "Data tidak ditemukan",
                                                style: Theme.of(
                                                  context,
                                                ).textTheme.labelSmall,
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }

                                    final count = controller.results.length;

                                    return Column(
                                      children: [
                                        Text(
                                          "$count hasil ditemukan",
                                          style: Theme.of(
                                            context,
                                          ).textTheme.labelSmall,
                                        ),
                                        const SizedBox(height: 4),
                                        Expanded(
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              _SearchableWheel(
                                                controller: controller,
                                                count: count,
                                              ),
                                              IgnorePointer(
                                                child: Container(
                                                  height: 56,
                                                  margin:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 18,
                                                      ),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.primary
                                                        .withAlpha(14),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          14,
                                                        ),
                                                    border: Border.all(
                                                      color: AppColors.primary
                                                          .withAlpha(60),
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: 30,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border(
                                              left: BorderSide(
                                                width: 0.2,
                                                color: Colors.red,
                                              ),
                                              right: BorderSide(
                                                width: 0.2,
                                                color: Colors.red,
                                              ),
                                              bottom: BorderSide(
                                                width: 0.2,
                                                color: Colors.red,
                                              ),
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          child: ElevatedButton(
                                            onPressed: () => Get.back(),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red
                                                  .withAlpha(40),
                                              foregroundColor: Colors.red,
                                              elevation: 0,
                                              side: BorderSide.none,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                            child: const Text(
                                              "Batal",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.red,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),

                                    Expanded(
                                      child: SizedBox(
                                        height: 30,
                                        child: Container(
                                          decoration: BoxDecoration(
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
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              final location =
                                                  controller.fullLocation;

                                              if (location != null) {
                                                Navigator.pop(
                                                  context,
                                                  location,
                                                );
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: AppColors.primary
                                                  .withAlpha(40),
                                              foregroundColor:
                                                  AppColors.primary,
                                              elevation: 0,
                                              side: BorderSide.none,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                            child: Text(
                                              "Pilih",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: AppColors.primary,
                                                fontWeight: FontWeight.w700,
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
                          ),
                        );
                      },
                    );

                    if (selected != null) {
                      setState(() {
                        selectedRegion = selected;
                      });
                    }
                  },
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {},
                child: TextFormField(
                  readOnly: true,
                  focusNode: FocusNode(),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.map_outlined,
                      color: AppColors.primary,
                    ),
                    labelText: "Tambah titik lokasi (opsional)",
                    labelStyle: Theme.of(context).textTheme.labelSmall!
                        .copyWith(
                          color: AppColors.primary,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: AppColors.dark.withAlpha(50),
                        width: 1.5,
                      ),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: AppColors.dark.withAlpha(50),
                        width: 1.5,
                      ),
                    ),
                  ),

                  onTap: () {
                    Get.to(() => PilihLokasiMapScreen());
                  },
                ),
              ),
              SizedBox(height: 20),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Rincian Laporan",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    WidgetSpan(child: SizedBox(width: 5)),
                    TextSpan(
                      text: "Minimal 50 karakter",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              TextFormField(
                maxLines: null,
                minLines: 8,
                expands: false,

                decoration: InputDecoration(
                  labelText: "Rincian Laporan",
                  labelStyle: Theme.of(context).textTheme.labelMedium,
                  alignLabelWithHint: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: AppColors.dark.withAlpha(50),
                      width: 1.5,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColors.primary, width: 1),
                  ),
                  hintText: "Ceritakan laporan secara lengkap dan jelas",
                  hintStyle: Theme.of(context).textTheme.labelMedium,
                ),
              ),

              SizedBox(height: 8),
              Text(
                "Sertakan waktu kejadian dan detail yang diperlukan",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              SizedBox(height: 20),
              Text(
                "Jenis Privasi",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: 10),
              Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade300, width: 0.5),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 56,
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                              ),
                              onTap: () {
                                setState(() {
                                  _selected = Groceries.privat;
                                });
                              },
                              child: Row(
                                children: [
                                  Radio<Groceries>(
                                    value: Groceries.privat,
                                    groupValue: _selected,
                                    onChanged: (value) {
                                      setState(() {
                                        _selected = value;
                                      });
                                    },
                                    fillColor:
                                        MaterialStateProperty.resolveWith<
                                          Color
                                        >((states) {
                                          if (states.contains(
                                            MaterialState.selected,
                                          )) {
                                            return Colors.green;
                                          }

                                          return Colors.grey;
                                        }),
                                  ),

                                  const SizedBox(width: 4),

                                  const Text(
                                    'Privat (Rahasia)',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 0.5,
                            height: double.infinity,
                            color: Colors.grey.shade300,
                          ),
                          Expanded(
                            child: InkWell(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(16),
                              ),
                              onTap: () {
                                setState(() {
                                  _selected = Groceries.publik;
                                });
                              },
                              child: Row(
                                children: [
                                  Radio<Groceries>(
                                    value: Groceries.publik,
                                    groupValue: _selected,
                                    onChanged: (value) {
                                      setState(() {
                                        _selected = value;
                                      });
                                    },
                                    fillColor:
                                        MaterialStateProperty.resolveWith<
                                          Color
                                        >((states) {
                                          if (states.contains(
                                            MaterialState.selected,
                                          )) {
                                            return Colors.green;
                                          }

                                          return Colors.grey;
                                        }),
                                  ),

                                  const SizedBox(width: 4),

                                  const Text(
                                    'Publik',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(height: 0.5, color: Colors.grey.shade300),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(25),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            _selected == Groceries.privat
                                ? Icons.lock_outline_rounded
                                : Icons.public_rounded,
                            color: AppColors.primary.withAlpha(120),
                            size: 25,
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _selected == Groceries.privat
                                      ? 'Aduan Privat (Rahasia)'
                                      : 'Aduan Publik',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),

                                const SizedBox(height: 5),

                                Text(
                                  _selected == Groceries.privat
                                      ? 'Aduan hanya dapat diakses olehmu sebagai '
                                            'pelapor dan petugas yang melakukan tindak '
                                            'lanjut. Aduan privat tidak akan terlihat '
                                            'oleh pengguna lain.'
                                      : 'Aduan dapat dilihat oleh pengguna aplikasi '
                                            'Ngopeni Nglakoni lainnya. Pilih opsi ini '
                                            'jika kamu bersedia agar aduanmu dapat '
                                            'dilihat oleh publik.',
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .copyWith(
                                        fontSize: 11,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
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
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: ElevatedButton(
                  onPressed: () {
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

                              initialChildSize: 0.22,
                              minChildSize: 0.2,
                              maxChildSize: 1.0,
                              builder: (context, scrollController) {
                                return Container(
                                  padding: EdgeInsets.all(12),
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Yakin ingin mengirim laporan?",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Pastikan informasi yang akan kamu laporkan sudah benar dan lengkap.",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.labelSmall,
                                      ),
                                      SizedBox(height: 30),
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
                                                      color:
                                                          AppColors.secondary,
                                                    ),
                                                    right: BorderSide(
                                                      width: 0.2,
                                                      color:
                                                          AppColors.secondary,
                                                    ),
                                                    bottom: BorderSide(
                                                      width: 0.2,
                                                      color:
                                                          AppColors.secondary,
                                                    ),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: AppColors
                                                        .secondary
                                                        .withAlpha(40),
                                                    foregroundColor: AppColors
                                                        .secondary
                                                        .withAlpha(40),
                                                    elevation: 0,
                                                    side: BorderSide.none,
                                                    // shape: RoundedRectangleBorder(
                                                    //   borderRadius:
                                                    //       BorderRadius.circular(
                                                    //         20,
                                                    //       ),
                                                    // ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Tinjau Ulang",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleSmall!
                                                            .copyWith(
                                                              color: AppColors
                                                                  .secondary,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 12),

                                          Expanded(
                                            child: SizedBox(
                                              height: 42,
                                              child: Container(
                                                decoration: BoxDecoration(
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
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        AppColors.primary,
                                                    foregroundColor:
                                                        AppColors.primary,
                                                    elevation: 0,
                                                    side: BorderSide.none,
                                                    // shape: RoundedRectangleBorder(
                                                    //   borderRadius:
                                                    //       BorderRadius.circular(
                                                    //         20,
                                                    //       ),
                                                    // ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Ya, Kirim",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleSmall!
                                                            .copyWith(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                      ),
                                                    ],
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
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    minimumSize: const Size(double.infinity, 48),
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.primary,
                    elevation: 0,
                    side: BorderSide.none,
                    // shape: RoundedRectangleBorder(
                    //   borderRadius:
                    //       BorderRadius.circular(
                    //         20,
                    //       ),
                    // ),
                  ),
                  child: Text(
                    "Kirim Laporan",
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchableWheel extends StatefulWidget {
  final WilayahSearchController controller;
  final int count;

  const _SearchableWheel({required this.controller, required this.count});

  @override
  State<_SearchableWheel> createState() => _SearchableWheelState();
}

class _SearchableWheelState extends State<_SearchableWheel> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller.attachScrollListener();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;
    final count = widget.count;

    return ListWheelScrollView.useDelegate(
      controller: controller.scrollController,
      itemExtent: WilayahSearchController.itemExtent,
      onSelectedItemChanged: (index) {
        if (index != controller.selectedIndex.value) {
          controller.selectedIndex.value = index;
        }
      },
      childDelegate: ListWheelChildBuilderDelegate(
        childCount: count,
        builder: (context, index) {
          final region = controller.results[index];
          final selected = index == controller.selectedIndex.value;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                controller.pathOf(region),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: selected ? AppColors.primary : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
