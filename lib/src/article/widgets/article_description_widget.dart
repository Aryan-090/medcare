import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

  class ArticleDescriptionWidget extends StatelessWidget {
  final String title;

  final String subtitle;

  const ArticleDescriptionWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.text,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.text,
          ),
        ),
      ],
    );
  }
}
