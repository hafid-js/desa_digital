import 'package:desa_digital/core/utils/constants/app_colors.dart';
import 'package:desa_digital/helpers/hex_color.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.more_horiz, color: Colors.grey, size: 20),
          SizedBox(height: 2),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(fontSize: 11, color: Colors.black),
              children: [
                TextSpan(
                  text: "Jateng Ngopeni Nglakoni. ",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text:
                      "Platform layanan digital Pemerintah Provinsi Jawa Tengah",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
