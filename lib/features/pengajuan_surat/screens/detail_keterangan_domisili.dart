import 'package:desa_digital/core/utils/constants/app_colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class DetailKeteranganDomisili extends StatefulWidget {
  const DetailKeteranganDomisili({super.key});

  @override
  State<DetailKeteranganDomisili> createState() =>
      _DetailKeteranganDomisiliState();
}

class _DetailKeteranganDomisiliState extends State<DetailKeteranganDomisili> {
  final TextEditingController _dateController = TextEditingController();

  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: AppColors.primary),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      setState(() {
        _dateController.text = formattedDate;
      });
    }
  }

  final List<String> marriedStatus = [
    'BELUM KAWIN',
    'KAWIN',
    'CERAI HIDUP',
    'CERAI MATI',
  ];

  String? _marriedStatus;

  XFile? _ktpPhoto;

  final ImagePicker _picker = ImagePicker();

  final ValueNotifier<String?> _statusPerkawinan = ValueNotifier<String?>(null);

  Future<void> _pickKtpPhoto() async {
    final source = await showModalBottomSheet<_PhotoSource>(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 20,
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Unggah Lampiran",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              Text(
                "Pilih jenis lampiran yang akan kamu unggah.",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: _buildSourceButton(
                      context: context,
                      icon: Icons.camera_alt_rounded,
                      label: "Ambil Foto",
                      onTap: () => Navigator.pop(context, _PhotoSource.camera),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildSourceButton(
                      context: context,
                      icon: Icons.insert_photo_rounded,
                      label: "File Foto",
                      onTap: () => Navigator.pop(context, _PhotoSource.gallery),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );

    if (source == null || !mounted) return;

    final XFile? photo;
    switch (source) {
      case _PhotoSource.camera:
        photo = await _picker.pickImage(
          source: ImageSource.camera,
          maxWidth: 2000,
          imageQuality: 85,
        );
      case _PhotoSource.gallery:
        photo = await _picker.pickImage(
          source: ImageSource.gallery,
          maxWidth: 2000,
          imageQuality: 85,
        );
    }

    if (photo != null) {
      setState(() => _ktpPhoto = photo);
    }
  }

  final _formKey = GlobalKey<FormState>();

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final data = {
      'status_perkawinan': _marriedStatus,
      'foto_ktp': _ktpPhoto?.name,
    };
    debugPrint('Data domisili: $data');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _statusPerkawinan.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Surat Keterangan Domisili",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nama Lengkap",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                SizedBox(height: 8),
                _buildTextField(label: "Nama Lengkap"),
                Text(
                  "NIK",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                SizedBox(height: 8),
                _buildTextField(
                  label: "Contoh : 33061322089902",
                  isNumber: true,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- Kolom Kiri: Tempat Lahir ---
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Tempat Lahir",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          const SizedBox(height: 8),
                          _buildTextField(label: "Contoh: Purworejo"),
                        ],
                      ),
                    ),

                    const SizedBox(width: 12), // Jarak horizontal antar kolom
                    // --- Kolom Kanan: Tanggal Lahir ---
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Tanggal Lahir",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 14),
                            child: TextFormField(
                              controller: _dateController,
                              readOnly: true,
                              onTap: _pickDate,
                              decoration: InputDecoration(
                                hintText: "-",
                                hintStyle: const TextStyle(fontSize: 14),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  "Status Perkawinan",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                SizedBox(height: 8),
                _buildDropdown(
                  label: "Status Perkawinan",
                  items: marriedStatus,
                  value: _statusPerkawinan,
                  onChanged: (v) => setState(() => _marriedStatus = v),
                ),
                Text(
                  "Alamat KTP",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                SizedBox(height: 8),
                TextFormField(
                  maxLines: 4,
                  minLines: 3,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black),
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    hintText:
                        "Dukuh Krajan RT003 RW001, Desa Gunung Condong, Kecamatan Bruno, Kabupaten Purworejo",
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                    alignLabelWithHint: false,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: AppColors.primary,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: AppColors.primary,
                        width: 1,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Alamat Domisili Saat Ini",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                SizedBox(height: 8),
                TextFormField(
                  maxLines: 4,
                  minLines: 3,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(fontSize: 14, color: Colors.black),
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    hintText:
                        "Contoh: Blok D No.35, Desa Tegalsari, Kecamatan Kepil, Kabupaten Wonosobo",
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                    alignLabelWithHint: false,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: AppColors.primary,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: AppColors.primary,
                        width: 1,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Upload Foto KTP",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                SizedBox(height: 8),
                _buildPhotoField(
                  hint: "Pilih File Gambar",
                  file: _ktpPhoto,
                  onTap: _pickKtpPhoto,
                  onRemove: () => setState(() => _ktpPhoto = null),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      "Simpan",
                      style: Theme.of(
                        context,
                      ).textTheme.labelMedium!.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildTextField({
  required String label,
  bool isNumber = false,
  bool isReadOnly = false,
  int? maxLength,
  TextEditingController? controller,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 14),
    child: TextFormField(
      controller: controller,
      enabled: !isReadOnly,
      keyboardType: isNumber ? TextInputType.number : null,
      inputFormatters: isNumber
          ? [FilteringTextInputFormatter.digitsOnly]
          : null,
      maxLength: maxLength,
      style: isReadOnly ? TextStyle(color: Colors.black87, fontSize: 12) : null,
      decoration: InputDecoration(
        floatingLabelBehavior: isReadOnly
            ? FloatingLabelBehavior.always
            : FloatingLabelBehavior.auto,
        hintText: label,
        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
        floatingLabelStyle: TextStyle(color: Colors.black54, fontSize: 14),

        // fillColor: isReadOnly ? AppColors.grey.withAlpha(30) : null,
        // filled: isReadOnly,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.black54, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: isReadOnly ? Colors.black54 : AppColors.primary,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: isReadOnly ? AppColors.grey : AppColors.primary,
          ),
        ),
      ),
    ),
  );
}

enum _PhotoSource { camera, gallery }

Widget _buildSourceButton({
  required BuildContext context,
  required IconData icon,
  required String label,
  required VoidCallback onTap,
}) {
  return SizedBox(
    height: 40,
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary.withAlpha(40),
        foregroundColor: AppColors.primary,
        elevation: 0,
        side: BorderSide.none,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: AppColors.primary),
          SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildPhotoField({
  required String hint,
  XFile? file,
  VoidCallback? onTap,
  VoidCallback? onRemove,
}) {
  final hasFile = file != null;
  return Padding(
    padding: const EdgeInsets.only(bottom: 14),
    child: InkWell(
      onTap: hasFile ? null : onTap,
      borderRadius: BorderRadius.circular(20),
      child: InputDecorator(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          prefixIcon: Icon(
            hasFile ? Iconsax.tick_circle : Icons.attach_file_rounded,
            size: 20,
            color: hasFile ? AppColors.green : AppColors.primary,
          ),
          suffixIcon: hasFile
              ? IconButton(
                  onPressed: onRemove,
                  icon: Icon(
                    Iconsax.close_circle,
                    size: 20,
                    color: AppColors.secondary,
                  ),
                )
              : Icon(Iconsax.arrow_down_1, size: 20, color: AppColors.primary),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.primary, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.primary),
          ),
        ),
        child: hasFile
            ? Text(
                file.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14, color: Colors.black),
              )
            : const SizedBox.shrink(),
      ),
    ),
  );
}

Widget _buildDropdown({
  required String label,
  required List<String> items,
  required ValueNotifier<String?> value,
  ValueChanged<String?>? onChanged,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: DropdownButtonFormField2<String>(
      isExpanded: true,
      valueListenable: value,
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: 12, color: Colors.black),
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.primary, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.primary, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.primary, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.primary, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.primary, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.primary, width: 1),
        ),
      ),
      hint: Text(
        'Pilih $label',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.black54,
        ),
      ),
      items: items
          .map(
            (item) => DropdownItem(
              value: item,
              child: Text(
                item,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
          )
          .toList(),
      onChanged: (v) {
        value.value = v;
        onChanged?.call(v);
      },
    ),
  );
}
