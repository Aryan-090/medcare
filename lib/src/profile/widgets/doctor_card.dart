import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import 'medicine_item.dart';

class DoctorCard extends StatelessWidget {

  final String doctorName;
  final String date;
  final List medicines;

  const DoctorCard({
    super.key,
    required this.doctorName,
    required this.date,
    required this.medicines,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(bottom: 18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),

      child: Column(
        children: [

          /// doctor name header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),

            decoration: const BoxDecoration(
              color: Color(0xff2f4b8f),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(11),
              ),
            ),

            child: Text(
              "Doctor's Name: $doctorName",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          /// medicines
          Column(
            children: medicines.map<Widget>((medicine) {

              return MedicineItem(
                title: medicine["name"],
                description: medicine["description"],
              );

            }).toList(),
          ),

          /// date
          Container(
            width: double.infinity,
            height: 25,
            padding: const EdgeInsets.all(5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.grey.shade300,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(11),
              ),
            ),

            child: Text(
              date,
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}