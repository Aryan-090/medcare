import 'package:flutter/material.dart';

class DoctorHorizontalSection extends StatelessWidget {
  const DoctorHorizontalSection({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> doctors = [
      {
        "image": "assets/doctor/doc1.png",
        "name": "Dr. Leonard Campbell",
        "speciality": "Heart Specialist"
      },
      {
        "image": "assets/doctor/doc2.png",
        "name": "Dr. Sarah Johnson",
        "speciality": "Dentist"
      },
      {
        "image": "assets/doctor/doc1.png",
        "name": "Dr. Leonard Campbell",
        "speciality": "Heart Specialist"
      },
      {
        "image": "assets/doctor/doc2.png",
        "name": "Dr. Sarah Johnson",
        "speciality": "Dentist"
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// TITLE
        const Text(
          "Chat Doctor",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 12),

        /// HORIZONTAL LIST
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              final doc = doctors[index];

              return _DoctorCard(
                image: doc["image"]!,
                name: doc["name"]!,
                speciality: doc["speciality"]!,
              );
            },
          ),
        ),
      ],
    );
  }
}

/// PRIVATE CARD WIDGET (inside same file)
class _DoctorCard extends StatelessWidget {
  final String image;
  final String name;
  final String speciality;

  const _DoctorCard({
    required this.image,
    required this.name,
    required this.speciality,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 12),
      child: Stack(
        children: [

          /// IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          /// GRADIENT
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
          ),

          /// TEXT
          Positioned(
            bottom: 12,
            left: 12,
            right: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  speciality,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}