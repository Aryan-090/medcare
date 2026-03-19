import 'package:flutter/material.dart';
import 'package:medcare/utils/app_colors.dart';

class WorkingHours extends StatefulWidget {
  final List<String> times;

  const WorkingHours({super.key, required this.times});

  @override
  State<WorkingHours> createState() => _WorkingHoursState();
}

class _WorkingHoursState extends State<WorkingHours> {
  int selectedIndex = -1; // -1 means none selected initially

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: List.generate(widget.times.length, (index) {
        final time = widget.times[index];
        final isSelected = selectedIndex == index;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            height: 37,
            width: 78,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected ? AppColors.primary : Colors.grey.shade200,
              ),
            ),
            child: Text(
              time,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey.shade600,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ),
        );
      }),
    );
  }
}