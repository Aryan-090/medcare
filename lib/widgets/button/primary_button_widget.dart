import 'package:flutter/material.dart';
import 'package:medcare/utils/app_colors.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget({
    super.key,
    required this.onTap,
    required this.title,
    this.radius,
    this.backgroundColor,
    this.color,
  });

  final String title;
  final Function() onTap;
  final double? radius;
  final Color? backgroundColor;
  final Color? color;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 24),
        ),
        backgroundColor: backgroundColor ?? AppColors.primary,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: color ?? AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
