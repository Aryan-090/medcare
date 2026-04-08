import 'package:flutter/material.dart';

class FilterDropdown extends StatelessWidget {

  final String value;
  final Function(String) onChanged;

  const FilterDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {


    final List<String> items = [
      "Active Recipe",
      "Past Prescriptions",
      "Recent Prescriptions",
      "Oldest Prescriptions"
    ];

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),

        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(

            value: value,
            isExpanded: true,

            icon: const Icon(Icons.keyboard_arrow_down),

            items: items.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e),
              );
            }).toList(),

            onChanged: (val) {
              if (val != null) {
                onChanged(val);
              }
            },
          ),
        ),
      ),
    );
  }
}