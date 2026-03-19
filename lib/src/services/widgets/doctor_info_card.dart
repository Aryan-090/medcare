import 'package:flutter/material.dart';

import 'info_card.dart';

class DoctorInfoCard extends StatelessWidget {
  final String image;
  final String name;
  final String speciality;
  final String experience;
  final String education;
  final String license;

  const DoctorInfoCard({
    super.key,
    required this.image,
    required this.name,
    required this.speciality,
    required this.experience,
    required this.education,
    required this.license,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
          )
        ],
      ),
      child: Column(
        children: [

          /// TOP ROW
          Row(
            children: [

              CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(image),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      "$speciality  •  $experience",
                      style: const TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 6),

                    Row(
                      children: const [
                        Icon(Icons.star, size: 14, color: Colors.orange),
                        Icon(Icons.star, size: 14, color: Colors.orange),
                        Icon(Icons.star, size: 14, color: Colors.orange),
                        Icon(Icons.star, size: 14, color: Colors.orange),
                        Icon(Icons.star_half, size: 14, color: Colors.orange),
                        SizedBox(width: 6),
                        Text("12 Reviews", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// INFO ROW
          Row(
            children: [
              Expanded(
                child: InfoCard(
                  title: "Education",
                  value: education,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: InfoCard(
                  title: "License",
                  value: license,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}