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
    this.width,
    this.padding,
    this.crossAxisAlignment,
    this.icon,
    this.border,
  });

  final String title;
  final Function() onTap;
  final double? radius;
  final Color? backgroundColor;
  final Color? color;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final CrossAxisAlignment? crossAxisAlignment;
  final Widget? icon;
  final BorderSide? border; // changed to BorderSide for button border

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: padding,
          alignment: Alignment.center,
          backgroundColor: backgroundColor ?? AppColors.primary,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 24),

            // Apply border only if provided
            side: border ?? BorderSide.none,
          ),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                color: color ?? AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),

            if (icon != null) ...[
              const SizedBox(width: 8),
              icon!,
            ],
          ],
        ),
      ),
    );
  }
}