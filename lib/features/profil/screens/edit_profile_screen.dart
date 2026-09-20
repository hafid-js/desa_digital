import 'dart:io';

import 'package:desa_digital/core/utils/constants/app_colors.dart';
import 'package:desa_digital/core/widgets/ucircular_image.dart';
import 'package:desa_digital/features/profil/screens/edit_email_screen.dart';
import 'package:desa_digital/features/profil/screens/edit_phone_screen.dart';
import 'package:desa_digital/helpers/hex_color.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _dateController = TextEditingController();
  late TabController _tabController;
  final ScrollController _scrollControllerTab2 = ScrollController();
  bool _showButton = true;
  File? _profileImage;
  Groceries? _selectedGender;

  final List<String> religionItems = [
    'ISLAM',
    'PROTESTAN',
    'KATHOLIK',
    'HINDU',
    'BUDDHA',
    'KONGHUCU',
  ];

  final List<String> marriedStatus = [
    'BELUM KAWIN',
    'KAWIN',
    'CERAI HIDUP',
    'CERAI MATI',
  ];

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
    }
  }

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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Listener perpindahan Tab
    _tabController.addListener(_onTabChanged);

    // Listener scroll khusus Tab 2
    _scrollControllerTab2.addListener(_onScrollTab2);
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) return;

    if (_tabController.index == 0) {
      // Tab 1: Selalu tampilkan tombol
      setState(() {
        _showButton = true;
      });
    } else {
      // Tab 2: Cek dulu posisi scroll-nya saat ini
      _checkScrollTab2();
    }
  }

  void _onScrollTab2() {
    if (_tabController.index == 1) {
      _checkScrollTab2();
    }
  }

  void _checkScrollTab2() {
    if (!_scrollControllerTab2.hasClients) return;

    final maxScroll = _scrollControllerTab2.position.maxScrollExtent;
    final currentScroll = _scrollControllerTab2.position.pixels;

    // Toleransi 30px sebelum posisi paling bawah
    if (currentScroll >= (maxScroll - 30)) {
      if (!_showButton) {
        setState(() {
          _showButton = true;
        });
      }
    } else {
      if (_showButton) {
        setState(() {
          _showButton = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    _scrollControllerTab2.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Ubah Informasi Pribadi",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          bottom: TabBar(
            controller: _tabController,
            dividerColor: AppColors.grey,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            unselectedLabelStyle: TextStyle(
              color: AppColors.grey,
              fontSize: 14,
            ),
            labelPadding: EdgeInsets.only(bottom: 12, top: 12),
            indicatorColor: AppColors.secondary,
            labelColor: AppColors.secondary,
            overlayColor: WidgetStatePropertyAll(
              AppColors.secondary.withAlpha(40),
            ),
            // indicator: BoxDecoration(
            //   color: HexColor.fromHex("#ff6900"),
            //   backgroundBlendMode: BlendMode.color,
            // ),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
            tabs: [
              Text("Data Profil", style: TextStyle(fontSize: 14)),
              Text("Data Diri", style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  // ProfileImagePicker(
                  //   imageFile: _profileImage,
                  //   onPickImage: _pickImage,
                  // ),
                  CircleAvatar(
                    backgroundColor: AppColors.primary.withAlpha(40),
                    radius: 45,
                    child: Icon(
                      Iconsax.user,
                      size: 30,
                      color: AppColors.primary,
                    ),
                  ),
                  MainInfoForm(),
                ],
              ),
            ),
            SingleChildScrollView(
              controller: _scrollControllerTab2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: PersonalDataForm(
                  dateController: _dateController,
                  pickDate: _pickDate,
                  selectedGender: _selectedGender,
                  onGenderChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                  religionItems: religionItems,
                  marriedStatus: marriedStatus,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: _showButton
            ? SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom + 12,
                    right: 16,
                    left: 16,
                  ),
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => EditProfileScreen()),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.primary,
                      elevation: 0,
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "Ubah Data",
                      style: Theme.of(
                        context,
                      ).textTheme.labelMedium!.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              )
            : SizedBox.shrink(),
      ),
    );
  }
}

class ProfileImagePicker extends StatelessWidget {
  final File? imageFile;
  final VoidCallback onPickImage;

  const ProfileImagePicker({
    super.key,
    required this.imageFile,
    required this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        UCircularImage(
          image: imageFile?.path ?? "assets/images/aduan/example1.png",
          isNetworkImage: imageFile != null,
          height: 100,
          width: 100,
        ),
        Positioned(
          bottom: -14,
          right: -1,
          top: 40,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              onTap: onPickImage,
              child: Icon(
                Icons.camera_alt_rounded,
                size: 16,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MainInfoForm extends StatelessWidget {
  const MainInfoForm({super.key});

  Widget _buildTextField({required String label, IconData? suffixIcon}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextFormField(
        readOnly: label != "Nama Lengkap" ? true : false,
        onTap: label == "Nama Lengkap"
      ? null
      : () {
          if (label == "Email") {
            Get.to(() => EditEmailScreen());
          } else if (label == "Nomor Whatsapp") {
            Get.to(() => EditPhoneScreen());
          }
        },
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelText: label,
          labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
          floatingLabelStyle: TextStyle(color: AppColors.primary),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.primary, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.primary),
          ),
          suffixIcon: suffixIcon != null
              ? label == "Email"
                    ? GestureDetector(
                        onTap: () => Get.to(() => EditEmailScreen()),
                        child: Icon(suffixIcon, size: 18),
                      )
                    : label == "Nomor Whatsapp"
                    ? GestureDetector(
                        onTap: () => Get.to(() => EditPhoneScreen()),
                        child: Icon(suffixIcon, size: 18),
                      )
                    : Icon(suffixIcon, size: 18)
              : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Informasi Utama",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 15),
          _buildTextField(label: "Nama Lengkap"),
          _buildTextField(label: "Email", suffixIcon: Iconsax.edit),
          _buildTextField(label: "Nomor Whatsapp", suffixIcon: Iconsax.edit),
        ],
      ),
    );
  }
}

class PersonalDataForm extends StatelessWidget {
  final TextEditingController dateController;
  final VoidCallback pickDate;
  final Groceries? selectedGender;
  final ValueChanged<Groceries?> onGenderChanged;
  final List<String> religionItems;
  final List<String> marriedStatus;

  const PersonalDataForm({
    super.key,
    required this.dateController,
    required this.pickDate,
    required this.selectedGender,
    required this.onGenderChanged,
    required this.religionItems,
    required this.marriedStatus,
  });

  Widget _buildTextField({
    required String label,
    bool isNumber = false,
    int? maxLength,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextFormField(
        keyboardType: isNumber ? TextInputType.number : null,
        inputFormatters: isNumber
            ? [FilteringTextInputFormatter.digitsOnly]
            : null,
        maxLength: maxLength,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelText: label,
          labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
          floatingLabelStyle: TextStyle(color: AppColors.primary),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.primary, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.primary),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({required String label, required List<String> items}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          labelText: label,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.primary, width: 1),
          ),
        ),
        hint: Text('Pilih $label', style: TextStyle(fontSize: 14)),
        items: items
            .map(
              (item) => DropdownItem(
                value: item,
                child: Text(item, style: TextStyle(fontSize: 14)),
              ),
            )
            .toList(),
        onChanged: (value) {},
      ),
    );
  }

  Widget _buildGenderSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Jenis Kelamin",
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: _genderRadio("Laki-Laki", Groceries.pickles)),
            SizedBox(width: 12),
            Expanded(child: _genderRadio("Perempuan", Groceries.tomato)),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _genderRadio(String label, Groceries value) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary, width: 1),
      ),
      child: Row(
        children: [
          Radio<Groceries>(
            value: value,
            groupValue: selectedGender,
            onChanged: onGenderChanged,
            fillColor: MaterialStateProperty.resolveWith(
              (states) => states.contains(MaterialState.selected)
                  ? AppColors.primary
                  : Colors.grey,
            ),
          ),
          SizedBox(width: 4),
          Text(label, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Data Diri", style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 10),
        _buildTextField(label: "Email"),
        _buildTextField(label: "Nama Lengkap"),
        _buildTextField(label: "Nomor Whatsapp"),
        _buildTextField(label: "NIK", isNumber: true, maxLength: 16),
        _buildTextField(label: "Tempat Lahir"),
        Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: TextFormField(
            controller: dateController,
            readOnly: true,
            onTap: pickDate,
            decoration: InputDecoration(
              labelText: "Tanggal Lahir",
              labelStyle: TextStyle(fontSize: 14),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: AppColors.primary, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: AppColors.primary),
              ),
            ),
          ),
        ),
        _buildGenderSelector(),
        _buildDropdown(label: "Agama", items: religionItems),
        _buildDropdown(label: "Status Perkawinan", items: marriedStatus),
        _buildDropdown(label: "Provinsi", items: marriedStatus),
        _buildDropdown(label: "Kabupaten/Kota", items: marriedStatus),
        _buildDropdown(label: "Kecamatan", items: marriedStatus),
        _buildDropdown(label: "Kelurahan", items: marriedStatus),
      ],
    );
  }
}

// Enum untuk gender
enum Groceries { pickles, tomato }
