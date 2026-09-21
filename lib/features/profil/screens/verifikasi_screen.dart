import 'package:desa_digital/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class VerifikasiScreen extends StatefulWidget {
  const VerifikasiScreen({super.key});

  @override
  State<VerifikasiScreen> createState() => _VerifikasiScreenState();
}

class _VerifikasiScreenState extends State<VerifikasiScreen> {
  // 4 Controller dan FocusNode untuk masing-masing kolom
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  final ValueNotifier<bool> _isValid = ValueNotifier<bool>(false);

  void _onOtpChanged(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      // Pindah ke kolom berikutnya jika terisi
      _focusNodes[index + 1].requestFocus();
    }

    // Cek apakah semua 4 kolom sudah terisi
    bool isComplete = _controllers.every((c) => c.text.isNotEmpty);
    _isValid.value = isComplete;
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    _isValid.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String args = Get.arguments ?? '';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Masukkan Kode Verifikasi",
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              "Kami telah mengirim 4 digit kode verifikasi (OTP) melalui email ke $args ",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 30),

            Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int index = 0; index < 4; index++) ...[
                  SizedBox(
                    width: 50,
                    height: 60,
                    child: RawKeyboardListener(
                      focusNode: FocusNode(),
                      onKey: (event) {
                        if (event.runtimeType.toString() == 'RawKeyDownEvent' &&
                            event.logicalKey == LogicalKeyboardKey.backspace &&
                            _controllers[index].text.isEmpty &&
                            index > 0) {
                          _focusNodes[index - 1].requestFocus();
                        }
                      },
                      child: TextFormField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        autofocus: index == 0,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (value) => _onOtpChanged(value, index),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: AppColors.grey,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: AppColors.primary.withAlpha(180),
                              width: 1.8,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (index < 3) const SizedBox(width: 10),
                ],
              ],
            ),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text("Tidak Menerima Kode?", style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.black),),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Iconsax.repeat,size: 20, color: AppColors.secondary,),
                      SizedBox(width: 5),
                      Text("Kirim Ulang", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.secondary),)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder<bool>(
        valueListenable: _isValid,
        builder: (context, isValid, child) {
          return Padding(
            padding: EdgeInsets.only(
              right: 12,
              left: 12,
              bottom: MediaQuery.of(context).viewInsets.bottom + 12,
            ),
            child: ElevatedButton(
              onPressed: isValid
                  ? () {
                      String code = _controllers.map((c) => c.text).join();
                      // Lanjutkan proses verifikasi dengan `code`
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                backgroundColor: isValid
                    ? AppColors.primary
                    : AppColors.primary.withAlpha(40),
                elevation: 0,
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Verifikasi Kode",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isValid ? Colors.white : Colors.white.withAlpha(150),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
