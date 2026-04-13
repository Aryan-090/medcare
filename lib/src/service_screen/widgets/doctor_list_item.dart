import 'package:flutter/material.dart';
import 'package:medcare/utils/app_colors.dart';

class DoctorListItem extends StatelessWidget {
  final String image;
  final String name;
  final String speciality;
  final String experience;
  final String availability;
  final VoidCallback? onTap;

  const DoctorListItem({
    super.key,
    required this.image,
    required this.name,
    required this.speciality,
    required this.experience,
    required this.availability,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [

            /// DOCTOR IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 12),

            /// DETAILS
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// NAME
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.text,
                    ),
                  ),

                  const SizedBox(height: 2),

                  /// SPECIALITY + EXPERIENCE
                  Text(
                    "$speciality  •  $experience",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 6),

                  /// AVAILABILITY BADGE
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      availability,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// ARROW
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}