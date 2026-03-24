import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class CategoryHorizontalList extends StatefulWidget {
  const CategoryHorizontalList({super.key});

  @override
  State<CategoryHorizontalList> createState() => _CategoryHorizontalListState();
}

class _CategoryHorizontalListState extends State<CategoryHorizontalList> {
  int selectedIndex = 0;

  final List<String> categories = [
    "All",
    "Medicine & Treatment",
    "Milk",
    "Sexual Health",
    "Vitamins",
    "Diabetes",
    "Baby Care",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final bool isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },

            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(12),

                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.grey,

                  width: 1.5,
                ),
              ),

              child: Center(
                child: Text(
                  categories[index],
                  style: TextStyle(
                    fontSize: 14,

                    fontWeight: FontWeight.w500,

                    color: isSelected ? AppColors.primary : AppColors.grey,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
