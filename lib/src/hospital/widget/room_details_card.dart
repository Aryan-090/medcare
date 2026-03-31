import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class RoomDetailsCard extends StatelessWidget {
  final String title;
  final String beds;
  final String availability;
  final String price;
  final String? type;


  const RoomDetailsCard({
    super.key,
    required this.title,
    this.type,
    required this.beds,
    required this.availability,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Container(
          height: 129,
          width: 372,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.green, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    type!,
                    style: TextStyle(fontSize: 14, color: AppColors.grey),
                  ),
                ],
              ),
            const SizedBox(height: 10),
              Text('Total Beds: $beds', style: const TextStyle(fontWeight: FontWeight.w400)),
              Text('Remaining Availability: $availability', style: const TextStyle(fontWeight: FontWeight.w400)),
              Text('Price Per Night: $price', style: const TextStyle(fontWeight: FontWeight.w400)),
            ],
          ),
        ),
      ],
    );
  }
}
