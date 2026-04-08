import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class DiseaseCard extends StatelessWidget {
  final String title;
  final String diseasetype;
  final String? note;

  const DiseaseCard({
    super.key,
    required this.title,
    required this.diseasetype,
    this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 372,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 17,
              width: 100,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(4),
                shape: BoxShape.rectangle,
              ),
              child: Center(
                child: Text(
                  diseasetype,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.white,
            ),
          ),
          Text(
            note ?? '',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Check Details',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.primary,
              decorationThickness: 2,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
