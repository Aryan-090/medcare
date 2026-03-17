import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';

class HospitalList extends StatelessWidget {
  const HospitalList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> hospitals = [
      {
        "image": "assets/hospital/hospital1.png",
        "title": "Cipto Mangunkusumo Hospital (RSCM)",
      },
      {
        "image": "assets/hospital/hospital2.png",
        "title": "Mitra Keluarga Hospital",
      },
      {
        "image": "assets/hospital/hospital1.png",
        "title": "Cipto Mangunkusumo Hospital (RSCM)",
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// TITLE
        Text(
          "Nearby Hospitals",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),

        const SizedBox(height: 12),

        /// HORIZONTAL LIST
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hospitals.length,
            itemBuilder: (context, index) {
              final item = hospitals[index];

              return _HospitalCard(
                logo: item["image"]!,
                title: item["title"]!,
                onTap: () {
                  print("Open maps");
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

/// PRIVATE CARD WIDGET
class _HospitalCard extends StatelessWidget {
  final String logo;
  final String title;
  final VoidCallback onTap;

  const _HospitalCard({
    required this.logo,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: const Color(0xffF7F9FB),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green.shade200, width: 1),
      ),
      child: Stack(
        children: [
          /// TOP RIGHT LIGHT CIRCLE
          Positioned(
            top: -35,
            right: -35,
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.pink.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
            ),
          ),

          /// CONTENT
          Container(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// LOGO
                Image.asset(logo, height: 32),

                const SizedBox(height: 14),

                /// TITLE
                Text(
                  title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),

                const Spacer(),

                /// SEE MAPS
                GestureDetector(
                  onTap: onTap,
                  child: const Row(
                    children: [
                      Text(
                        "See maps",
                        style: TextStyle(color: AppColors.greyLight, fontSize: 13),
                      ),
                      SizedBox(width: 6),
                      Icon(Icons.arrow_forward_ios, size: 12, color: AppColors.greyLight),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
