import 'package:flutter/material.dart';
import 'package:medcare/utils/app_colors.dart';

class DoctorProfileHeader extends StatelessWidget {
  final Map<String, String> doctor;

  const DoctorProfileHeader({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// PROFILE IMAGE
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.circleBackground,
              ),
              child: CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage(doctor["image"]!),
              ),
            ),

            /// ONLINE DOT
            Positioned(
              bottom: 8,
              right: 8,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: AppColors.success,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        /// NAME
        Text(
          doctor["name"]!,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.text,
          ),
        ),

        const SizedBox(height: 6),

        /// SPECIALITY
        Text(
          "${doctor["speciality"]}  •  ${doctor["experience"]}",
          style: const TextStyle(
            color: AppColors.subText, 
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 10),

        /// RATING
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.star, color: Colors.orange, size: 16),
            Icon(Icons.star, color: Colors.orange, size: 16),
            Icon(Icons.star, color: Colors.orange, size: 16),
            Icon(Icons.star, color: Colors.orange, size: 16),
            Icon(Icons.star_border, color: Colors.orange, size: 16),
            SizedBox(width: 8),
            Text("12 Reviews", style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        )
      ],
    );
  }
}