import 'package:flutter/material.dart';
import '../../../../utils/app_colors.dart';

class OfficialStoreSection extends StatelessWidget {
  const OfficialStoreSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> brandImages = [
      'assets/brands/kalbe.png',
      'assets/brands/kimia.png',
      'assets/brands/dexa.png',
      'assets/brands/kalbe.png',
    ];

    return Container(
      width: double.infinity,

      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),

      decoration: const BoxDecoration(color: AppColors.circleBackground),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          /// title row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              const Text(
                "Official Store",

                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.text,
                ),
              ),

              GestureDetector(
                onTap: () {},

                child: const Text(
                  "See all",

                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),

          const Text(
            "Special offers from various renowned brands",

            style: TextStyle(fontSize: 13, color: AppColors.secondaryText),
          ),

          const SizedBox(height: 16),

          /// brand cards
          SizedBox(
            height: 120,

            child: ListView.builder(
              scrollDirection: Axis.horizontal,

              itemCount: brandImages.length,

              itemBuilder: (context, index) {
                return Container(
                  width: 120,
                  margin: const EdgeInsets.only(right: 14),

                  decoration: BoxDecoration(
                    color: AppColors.grey,

                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: Center(
                    child: Container(
                      width: 80,
                      height: 80,

                      padding: const EdgeInsets.all(12),

                      decoration: BoxDecoration(
                        color: AppColors.white,

                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: Image.asset(
                        brandImages[index],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
