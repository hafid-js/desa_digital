import 'package:desa_digital/core/utils/constants/app_colors.dart';
import 'package:desa_digital/features/profil/screens/verifikasi_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class EditPhoneScreen extends StatefulWidget {
  const EditPhoneScreen({super.key});

  @override
  State<EditPhoneScreen> createState() => _EditPhoneScreenState();
}

final TextEditingController phoneController = TextEditingController();
final RxBool isValid = false.obs;

void checkValidation(String value) {
  if (value.isNotEmpty && value.length > 11) {
    isValid.value = true;
  } else {
    isValid.value = false;
  }
}

class _EditPhoneScreenState extends State<EditPhoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize(
        preferredSize: const Size.fromHeight(118),
        child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Edit No. Whatsapp",
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        Text(
                          "Pastikan whatsapp aktif untuk menerima kode keamanan",
                          style: Theme.of(context).textTheme.labelSmall!
                              .copyWith(
                                color: Colors.black87,
                                fontWeight: FontWeight.w300,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  child: TextFormField(
    controller: phoneController,
    autofocus: true,
    keyboardType: TextInputType.phone,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    onChanged: (value) => checkValidation(value), // Cek setiap kali mengetik
    decoration: InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      labelText: "Nomor Whatsapp",
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
),
bottomNavigationBar: Obx(
  () => Padding(
    padding: EdgeInsets.only(
      right: 12,
      left: 12,
      bottom: MediaQuery.of(context).viewInsets.bottom + 12,
    ),
    child: ElevatedButton(
                onPressed: isValid.value ? () => Get.to(() => VerifikasiScreen(), arguments: "082322875277") : null,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        // Menggunakan withAlpha(40) / withOpacity(0.16) jika tidak valid
        backgroundColor: isValid.value 
            ? AppColors.primary 
            : AppColors.primary.withAlpha(40), 
        elevation: 0,
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        "Simpan & Kirim Kode",
        style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w600,
          color: isValid.value ? Colors.white : Colors.white.withAlpha(150),
        ),
      ),
    ),
  ),
)
    );
  }
}
