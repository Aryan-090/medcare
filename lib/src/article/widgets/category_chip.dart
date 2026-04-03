import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';

class CategoryChip extends StatelessWidget {

  final String title;
  final bool selected;

  const CategoryChip({
    super.key,
    required this.title,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 6,
      ),

      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(20),

        color: selected
            ? AppColors.primary
            : Colors.white,

        border: Border.all(color: AppColors.primary),
      ),

      child: Text(

        title,

        style: TextStyle(

          fontSize: 12,

          color: selected
              ? Colors.white
              : AppColors.primary,
        ),
      ),
    );
  }
}