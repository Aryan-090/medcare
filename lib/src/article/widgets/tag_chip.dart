import 'package:flutter/material.dart';
import '../../../../utils/app_colors.dart';

class TagChip extends StatelessWidget {

  final String title;

  const TagChip({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),

      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(20),

        border: Border.all(color: AppColors.primary),
      ),

      child: Text(

        title,

        style: const TextStyle(
          fontSize: 12,
          color: AppColors.primary,
        ),
      ),
    );
  }
}