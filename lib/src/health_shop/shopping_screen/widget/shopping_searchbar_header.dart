import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class ShoppingSearchbarHeader extends StatelessWidget {
  const  ShoppingSearchbarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 16,
                ),
              ),
              Container(
                height: 48,
                width: 240,
                decoration: BoxDecoration(
                  color: AppColors.containerBackground,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.green),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Icon(Icons.search, size: 20),
                    const SizedBox(width: 10),
                    Text(
                      'Search product or store',
                      style: TextStyle(fontSize: 14, color: AppColors.grey),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                  height: 48,
                  width: 48,
                  child: ImageIcon(const AssetImage('assets/icon/cart.png'), size: 14, color: AppColors.black)),
            ],
          ),
        ],
      ),
    );
  }
}
