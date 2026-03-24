import 'package:flutter/material.dart';
import 'package:medcare/src/health_shop/shopping_screen/widget/product_card_widget.dart';

class HorizontalProductList extends StatelessWidget {

  const HorizontalProductList({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(

      height: 230,

      child: ListView(

        scrollDirection: Axis.horizontal,

        padding: const EdgeInsets.symmetric(horizontal: 16),

        children: const [

          ProductCard(
            image: "assets/medicine/promag.png",
            title: "Promag 10 Tablets",
            price: "\$2,00",
          ),

          ProductCard(
            image: "assets/medicine/strip.png",
            title: "STRIP NEURODEX 10 TABLET",
            price: "\$2,00",
          ),

          ProductCard(
            image: "assets/medicine/promag.png",
            title: "Promag 10 Tablets",
            price: "\$2,00",
          ),

        ],
      ),
    );
  }
}