import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class ReminderMedicineCard extends StatelessWidget {
  final String title;

  final String subtitle;

  final String? actionText;

  final IconData? actionicon;

  const ReminderMedicineCard({super.key,required this.title,required this.subtitle,this.actionText, this.actionicon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Row(
          children: [
            const Text(
              'Reminder To Take Medicine',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 18),
            if (actionText != null)
              Text(
                actionText!,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.primary,
                ),
              ),
            const SizedBox(width: 5),
            if (actionicon != null) ...[
              const SizedBox(width: 5),

              Icon(
                actionicon,
                size: 14,
                color: AppColors.primary,
              ),
            ],

          ],
         ),
        const SizedBox(height: 10),
        DashedBorderContainer(
          child: Column(
            children: [
              Image.asset('assets/img/reminder.png', width: 133, height: 100),
              const SizedBox(height: 10),
               Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
               Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(

                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.disableText,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Dashed Border Container

class DashedBorderContainer extends StatelessWidget {
  final Widget child;
  final double radius;
  final Color borderColor;
  final double dashWidth;
  final double dashSpace;

  const DashedBorderContainer({
    super.key,
    required this.child,
    this.radius = 12,
    this.borderColor = const Color(0xFF9ED9C4),
    this.dashWidth = 6,
    this.dashSpace = 4,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedBorderPainter(
        radius: radius,
        color: borderColor,
        dashWidth: dashWidth,
        dashSpace: dashSpace,
      ),
      child: Container(padding: const EdgeInsets.all(20), child: child),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final double radius;
  final Color color;
  final double dashWidth;
  final double dashSpace;

  DashedBorderPainter({
    required this.radius,
    required this.color,
    required this.dashWidth,
    required this.dashSpace,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(radius),
    );

    final paint =
    Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(rect);

    final dashPath = Path();
    for (PathMetric pathMetric in path.computeMetrics()) {
      double distance = 0;
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
