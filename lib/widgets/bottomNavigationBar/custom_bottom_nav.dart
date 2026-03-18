import 'package:flutter/material.dart';
import 'package:medcare/utils/app_colors.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, -2),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          _navItem(
            index: 0,
            icon: "assets/icon/home.png",
            label: "Home",
          ),

          _navItem(
            index: 1,
            icon: "assets/icon/Services.png",
            label: "Services",
          ),

          _navItem(
            index: 2,
            icon: "assets/icon/notes.png",
            label: "History",
          ),

          _navItem(
            index: 3,
            icon: "assets/icon/profile.png",
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget _navItem({
    required int index,
    required String icon,
    required String label,
  }) {
    final bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          /// ICON
          Image.asset(
            icon,
            width: 24,
            height: 24,
            color: isSelected
                ? AppColors.primary
                : Colors.grey,
          ),

          const SizedBox(height: 4),

          /// LABEL
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected
                  ? Colors.black87
                  : Colors.grey,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}