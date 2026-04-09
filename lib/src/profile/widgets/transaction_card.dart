import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class TransactionCard extends StatelessWidget {
  final String date;
  final String month;
  final String title;
  final String amount;

  const TransactionCard({
    super.key,
    required this.date,
    required this.month,
    required this.title,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 78,
      width: 368,
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 43,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(4),
              shape: BoxShape.rectangle,
            ),
            child: Column(
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  month,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                    color: AppColors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                amount,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                    color: AppColors.primary
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Container(
            height: 19,
            width: 36,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(8),
                color: AppColors.circleBackground),
            child: const Center(
              child: Text(
                "Paid",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
