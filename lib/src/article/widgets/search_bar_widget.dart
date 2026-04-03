import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 16,
          ),
        ),
        const SizedBox(width: 15),
        Container(
          height: 48,
          width: 270,
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
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}