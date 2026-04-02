import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import 'medicine_model.dart';

class MedicineListCard extends StatelessWidget {

  final MedicineModel medicine;

  const MedicineListCard({
    super.key,
    required this.medicine,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(10),

        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),

      child: Row(

        children: [

          Container(

            padding: const EdgeInsets.all(8),

            decoration: BoxDecoration(

              color: const Color(0xffE9F5F1),

              borderRadius: BorderRadius.circular(30),
            ),

            child: const Icon(
              Icons.medication_outlined,
              size: 18,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(width: 10),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(
                medicine.name,

                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),

              Text(
                "${medicine.dosage} ${medicine.time}",

                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}