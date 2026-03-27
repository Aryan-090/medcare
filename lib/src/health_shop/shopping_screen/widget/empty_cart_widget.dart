import 'package:flutter/material.dart';
import '../../../../utils/app_colors.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Center(

      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          const SizedBox(height: 150),
          Image.asset(
            "assets/img/empty_cart.png",
            height: 150,
          ),

          const SizedBox(height: 20),

          const Text(

            "Oops! Your shopping cart is still empty",

            style: TextStyle(

              fontSize: 14,

              color: AppColors.subText,

            ),

          ),

        ],

      ),

    );

  }

}