import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;


  const NotificationCard({super.key,required this.icon, required this.title, required this.description,required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 117,
      width: 372,
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(icon, size: 24, color: AppColors.white)),
          const SizedBox(width: 15),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                ),
              ),
            ],
          )
        ],
      )
    );
  }
}
