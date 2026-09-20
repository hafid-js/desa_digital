import 'package:flutter/material.dart';

class NotifikasiKosongScreen extends StatelessWidget {
  const NotifikasiKosongScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/icons/empty_box.png", height: 120, width: 120),
        SizedBox(height: 10),
        Text(
          "Notifikasi tidak ditemukan",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(height: 5),
        Text(
          "Belum ada pengumumuman buat kamu",
          style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.black, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}
