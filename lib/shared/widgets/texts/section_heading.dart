import 'package:desa_digital/core/utils/constants/app_colors.dart';
import 'package:desa_digital/helpers/hex_color.dart';
import 'package:flutter/material.dart';

class USectionHeading extends StatelessWidget {
  const USectionHeading({
    super.key,
    required this.title,
    this.buttonTitle,
    this.onPressed,
    this.showActionButton = true
  });

  final String title;
  final String? buttonTitle;
  final VoidCallback? onPressed;
  final bool showActionButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        if(showActionButton) TextButton(onPressed: onPressed, child: Text(buttonTitle ?? '', style: Theme.of(context).textTheme.labelSmall!.copyWith(color: AppColors.blue),)),
      ],
    );
  }
}
