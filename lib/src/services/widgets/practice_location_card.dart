import 'package:flutter/material.dart';
import 'package:medcare/utils/app_colors.dart';

class PracticeLocationCard extends StatefulWidget {
  const PracticeLocationCard({super.key});

  @override
  State<PracticeLocationCard> createState() => _PracticeLocationCardState();
}

class _PracticeLocationCardState extends State<PracticeLocationCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.greyContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Rossi Cardiology Clinic",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Icon(
                  isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: Colors.black54,
                ),
              ],
            ),
            if (isExpanded) ...[
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Rossi Cardiology Clinic Via Garibaldi 15, Milan, Italy",
                      style: TextStyle(color: Colors.black87, fontSize: 12, height: 1.4),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.phone_outlined, size: 16, color: AppColors.primary),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "(+21) 6125 7162  7126",
                      style: TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ]
          ],
        ),
      ),
    );
  }
}
