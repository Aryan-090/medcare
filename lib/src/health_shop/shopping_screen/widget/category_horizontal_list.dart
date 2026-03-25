import 'package:flutter/material.dart';
import 'package:medcare/src/health_shop/shopping_screen/widget/medicine_category_screen.dart';
import '../../../../utils/app_colors.dart';

class CategoryHorizontalList extends StatefulWidget {

  final int selectedIndex;

  const CategoryHorizontalList({
    super.key,
    this.selectedIndex = 0,
  });

  @override
  State<CategoryHorizontalList> createState() => _CategoryHorizontalListState();
}

class _CategoryHorizontalListState extends State<CategoryHorizontalList> {

  late int selectedIndex;

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
  void initState() {
    selectedIndex = widget.selectedIndex;
    super.initState();
  }

  Future<void> onTapCategory(int index) async {

    setState(() {
      selectedIndex = index;
    });

    /// open medicine screen
    if (categories[index] == "Medicine & Treatment") {

      final returnedIndex = await Navigator.push(

        context,

        MaterialPageRoute(

          builder: (_) => const MedicineCategoryScreen(
            selectedIndex: 1, categoryName: "Medicine & Treatment"'',
          ),
        ),
      );

      /// update selection when coming back
      if (returnedIndex != null) {

        setState(() {

          selectedIndex = returnedIndex;

        });

      }

    }

    /// return to main screen when ALL selected
    if (categories[index] == "All") {

      Navigator.pop(context);
    }
  }

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

            onTap: () => onTapCategory(index),

            child: AnimatedContainer(

              duration: const Duration(milliseconds: 200),

              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 10,
              ),

              decoration: BoxDecoration(

                color: Colors.white,

                borderRadius: BorderRadius.circular(12),

                border: Border.all(

                  color: isSelected
                      ? AppColors.primary
                      : AppColors.containerBorder,

                  width: 1.5,
                ),
              ),

              child: Center(

                child: Text(

                  categories[index],

                  style: TextStyle(

                    fontSize: 13,

                    fontWeight: FontWeight.w500,

                    color: isSelected
                        ? AppColors.primary
                        : AppColors.secondaryText,
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