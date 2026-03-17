import 'package:flutter/material.dart';

class SpecialityGridList extends StatelessWidget {
  const SpecialityGridList({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> doctors = [
      {
        "image": "assets/product/product1.png",
      },
      {
        "image": "assets/product/product2.png",
      },
      {
        "image": "assets/product/product3.png",
      },
      {
        "image": "assets/product/product4.png",
      },
      {
        "image": "assets/product/product2.png",
      },
      {
        "image": "assets/product/product1.png",
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// TITLE
        const Text(
          "Best Selling Products",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 12),

        /// HORIZONTAL LIST
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              final doc = doctors[index];

              return _ProductCard(
                image: doc["image"]!,
              );
            },
          ),
        ),
      ],
    );
  }
}

/// PRIVATE CARD WIDGET (inside same file)
class _ProductCard extends StatelessWidget {
  final String image;

  const _ProductCard({
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      margin: const EdgeInsets.only(right: 12),
      child: Stack(
        children: [

          /// IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              height: 80,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}