import 'package:desa_digital/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class DetailKeteranganDomisili extends StatelessWidget {
  const DetailKeteranganDomisili({super.key});

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
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Text(
                "Tempat Lahir",
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              SizedBox(height: 8),
              _buildTextField(label: "Nama Lengkap"),
            ],
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
      // inputFormatters: isNumber
      //     ? [FilteringTextInputFormatter.digitsOnly]
      //     : null,
      maxLength: maxLength,
      style: isReadOnly ? TextStyle(color: Colors.black87, fontSize: 14) : null,
      decoration: InputDecoration(
        floatingLabelBehavior: isReadOnly
            ? FloatingLabelBehavior.always
            : FloatingLabelBehavior.auto,
        labelText: label,
        labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
        floatingLabelStyle: TextStyle(color: Colors.black54, fontSize: 12),

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
