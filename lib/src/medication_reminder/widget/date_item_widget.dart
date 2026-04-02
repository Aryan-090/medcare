import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class DateItem extends StatelessWidget {

  final String day;
  final String date;
  final bool isSelected;

  const DateItem({
    super.key,
    required this.day,
    required this.date,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 55,
      margin: const EdgeInsets.only(right: 8),

      decoration: BoxDecoration(

        color: isSelected
            ? AppColors.primary
            : Colors.white,

        borderRadius: BorderRadius.circular(10),

        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Text(
            day,

            style: TextStyle(
              fontSize: 11,

              color: isSelected
                  ? Colors.white
                  : Colors.grey,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            date,

            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,

              color: isSelected
                  ? Colors.white
                  : Colors.black,
            ),
          ),

        ],
      ),
    );
  }
}