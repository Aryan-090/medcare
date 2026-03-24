import 'package:flutter/material.dart';
import 'package:medcare/src/health_shop/shopping_screen/widget/brands_horizontal_list.dart';
import 'package:medcare/src/health_shop/shopping_screen/widget/category_horizontal_list.dart';
import 'package:medcare/src/health_shop/shopping_screen/widget/health_service_list.dart';
import 'package:medcare/src/health_shop/shopping_screen/widget/horizontal_product_list.dart';
import 'package:medcare/src/health_shop/shopping_screen/widget/section_title.dart';
import 'package:medcare/src/health_shop/shopping_screen/widget/shopping_searchbar_header.dart';

import '../../../utils/app_colors.dart';

class shopping_screen extends StatelessWidget {
  const shopping_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShoppingSearchbarHeader(),
              SizedBox(height: 10),
              CategoryHorizontalList(),
               SizedBox(height: 20),
              OfficialStoreSection(),
              SizedBox(height: 20),
              SectionHeader(title: "Hot Sales"),

              SizedBox(height: 10),

              HorizontalProductList(),

              SizedBox(height: 20),

              SectionHeader(title: "Recently Viewed"),

              SizedBox(height: 10),

              HorizontalProductList(),

              SizedBox(height: 20),

              SectionHeader(title: "Layanan Kesehatan"),

              SizedBox(height: 10),

              HealthServicesList(),

              SizedBox(height: 20),

            ],
          ),
        ),

      ),
    );
  }
}
