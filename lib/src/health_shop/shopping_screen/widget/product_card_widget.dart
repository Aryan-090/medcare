import 'package:flutter/material.dart';
import '../../../../utils/app_colors.dart';

class ProductCard extends StatelessWidget {

  final String image;
  final String title;
  final String price;

  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      width: 170,

      margin: const EdgeInsets.only(right: 14),

      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(

        color: AppColors.white,

        borderRadius: BorderRadius.circular(16),

        border: Border.all(color: AppColors.containerBorder),

        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          /// image
          Center(
            child: Image.asset(
              image,
              height: 70,
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 8),

          /// title
          Text(
            title,

            maxLines: 2,
            overflow: TextOverflow.ellipsis,

            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.text,
            ),
          ),

          const SizedBox(height: 2),

          const Text(
            "Per Strip",

            style: TextStyle(
              fontSize: 11,
              color: AppColors.subText,
            ),
          ),

          const Spacer(),   // prevents overflow

          const Text(
            "Start from",

            style: TextStyle(
              fontSize: 10,
              color: AppColors.disableText,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

              Text(
                price,

                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),

              SizedBox(
                height: 30,

                child: OutlinedButton(

                  onPressed: () {},

                  style: OutlinedButton.styleFrom(

                    padding: const EdgeInsets.symmetric(horizontal: 12),

                    side: const BorderSide(
                      color: AppColors.primary,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),

                  child: const Text(
                    "Add",

                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}