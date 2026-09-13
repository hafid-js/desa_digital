import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(176, 238, 238, 238),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(right: 15, left: 15, top: 0, bottom: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.more_horiz, color: Colors.grey, size: 30),
          SizedBox(height: 2),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(fontSize: 11, color: Colors.black),
              children: [
                TextSpan(
                  text: "Jateng Ngopeni Nglakoni. ",
                  style: TextStyle(fontWeight: FontWeight.bold),
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
