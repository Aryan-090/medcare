import 'package:flutter/material.dart';
import 'package:medcare/utils/app_colors.dart';

class HistoryTabSwitch extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const HistoryTabSwitch({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          _tabItem("Upcoming", 0),
          _tabItem("Completed", 1),
        ],
      ),
    );
  }

  Widget _tabItem(String title, int index) {
    final isSelected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}