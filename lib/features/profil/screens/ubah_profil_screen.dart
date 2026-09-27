import 'package:desa_digital/core/constants/app_colors.dart';
import 'package:desa_digital/features/profil/models/jenis_kelamin.dart';
import 'package:desa_digital/features/profil/widgets/main_info_form.dart';
import 'package:desa_digital/features/profil/widgets/personal_data_form.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class UbahProfilScreen extends StatefulWidget {
  const UbahProfilScreen({super.key});

  @override
  State<UbahProfilScreen> createState() => _UbahProfilScreenState();
}

class _UbahProfilScreenState extends State<UbahProfilScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController(
    text: 'HafidTech',
  );
  final TextEditingController _emailController = TextEditingController(
    text: 'dev@hafidtech.com',
  );
  final TextEditingController _phoneController = TextEditingController(
    text: '082322875277',
  );
  late TabController _tabController;
  JenisKelamin? _selectedGender;

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
  final List<String> provinsiItems = [
    'DKI JAKARTA',
    'JAWA TENGAH',
    'JAWA BARAT',
    'DIY YOGYAKARTA',
  ];
  final List<String> kabupatenItems = [
    'PURWOREJO',
    'KEBUMEN',
    'WONOSOBO',
    'MAGELANG',
  ];
  final List<String> kecamatanItems = [
    'BRUNO',
    'KEMIRI',
    'PITURUH',
    'KUTOARJO',
  ];
  final List<String> kelurahanItems = [
    'GUNUNG CONDONG',
    'CEPEDAK',
    'BRUNOREJO',
    'KEMRANGGEN',
  ];

  final Map<String, ValueNotifier<String?>> _dropdownValues = {};

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

    _tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) return;
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    _dateController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    for (final notifier in _dropdownValues.values) {
      notifier.dispose();
    }
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

                  CircleAvatar(
                    backgroundColor: AppColors.primary.withAlpha(40),
                    radius: 45,
                    child: Icon(
                      Iconsax.user,
                      size: 30,
                      color: AppColors.primary,
                    ),
                  ),
                  MainInfoForm(
                    fullNameController: _fullNameController,
                    emailController: _emailController,
                    phoneController: _phoneController,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: PersonalDataForm(
                  onSimpan: () {},
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
                  provinsiItems: provinsiItems,
                  kabupatenItems: kabupatenItems,
                  kecamatanItems: kecamatanItems,
                  kelurahanItems: kelurahanItems,
                  fullNameController: _fullNameController,
                  emailController: _emailController,
                  phoneController: _phoneController,
                  dropdownValues: _dropdownValues,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
