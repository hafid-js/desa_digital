import 'package:desa_digital/core/utils/constants/app_colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  PlatformFile? selectedPdf;
  PlatformFile? selectedVideo;
  XFile? selectedPhoto;
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
                    ClipRRect(
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
                    SizedBox(width: 10),
                    ClipRRect(
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
                                                                  .video
                                                            );

                                                        if (file != null) {
                                                          setState(() {
                                                            selectedVideo = file;
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
  final ImagePicker picker = ImagePicker();

  final XFile? image = await picker.pickImage(
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
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
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
                          size: 40,
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
            ],
          ),
        ),
      ),
    );
  }
}
