import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class SectionHeader extends StatelessWidget {

  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {

    return Padding(

      padding: const EdgeInsets.symmetric(horizontal: 16),

      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          Text(
            title,

            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.text,
            ),
          ),

          const Text(
            "See all",

            style: TextStyle(
              fontSize: 13,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}