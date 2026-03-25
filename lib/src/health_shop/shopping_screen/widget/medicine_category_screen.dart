import 'package:flutter/material.dart';
import 'package:medcare/src/health_shop/shopping_screen/widget/shopping_searchbar_header.dart';
import '../../../../utils/app_colors.dart';
import '../widget/category_horizontal_list.dart';
import '../widget/product_card_widget.dart';
import 'medicine_data.dart';

class MedicineCategoryScreen extends StatelessWidget {

  final String categoryName;
  final int selectedIndex;

  const MedicineCategoryScreen({

    super.key,
    required this.categoryName,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {

    /// filter products by category
    final products = allProducts.where(

          (p) => p.category == categoryName,

    ).toList();

    return Scaffold(
      
      backgroundColor: AppColors.background,

      body: SafeArea(

        child: Column(

          children: [
            const Padding(padding: EdgeInsets.all(10)),

            /// search header
             const ShoppingSearchbarHeader(),

            /// categories
            CategoryHorizontalList(
              selectedIndex: selectedIndex,
            ),

            const SizedBox(height: 10),

            /// product grid
            Expanded(

              child: GridView.builder(

                padding: const EdgeInsets.symmetric(horizontal: 16),

                itemCount: products.length,

                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(

                  crossAxisCount: 2,

                  mainAxisSpacing: 14,

                  crossAxisSpacing: 14,

                  childAspectRatio: 0.72,
                ),

                itemBuilder: (context, index) {

                  final item = products[index];

                  return ProductCard(

                    image: item.image,
                    title: item.name,
                    price: item.price,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}