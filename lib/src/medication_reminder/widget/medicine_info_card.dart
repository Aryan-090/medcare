import 'package:flutter/material.dart';

class MedicineInfoCard extends StatelessWidget {
  const MedicineInfoCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: const Color(0xffBFE3D7),
        borderRadius: BorderRadius.circular(10),
      ),

      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Text(
            "Paracetamol 500 mg",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),

          SizedBox(height: 4),

          Text(
            "Take 1 tablet every 6 hours as needed to reduce fever or pain.",
            style: TextStyle(fontSize: 12),
          ),

        ],
      ),
    );
  }
}