import 'package:flutter/material.dart';

import 'layanan_kesehatan_cards.dart';

class HealthServicesList extends StatelessWidget {

  const HealthServicesList({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(

      height: 160,

      child: ListView(

        scrollDirection: Axis.horizontal,

        padding: const EdgeInsets.symmetric(horizontal: 16),

        children: const [

          HealthServiceCard(
            image: "assets/product/product1.png",
            title: "Vaccine",
          ),

          HealthServiceCard(
            image: "assets/product/product2.png",
            title: "Braces",
          ),
          HealthServiceCard(
            image: "assets/product/product3.png",
            title: "WheelChair",
          ),
          HealthServiceCard(
            image: "assets/product/product4.png",
            title: "Mask",
          ),

        ],
      ),
    );
  }
}