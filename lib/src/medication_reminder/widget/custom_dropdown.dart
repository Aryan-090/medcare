import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {

  final String title;
  final List<String> items;
  final String? value;
  final Function(String?) onChanged;

  const CustomDropdown({
    super.key,
    required this.title,
    required this.items,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Text(title),

        const SizedBox(height: 6),

        DropdownButtonFormField<String>(

          value: value,

          decoration: InputDecoration(
            hintText: "Choose",

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),

          items: items.map((e){

            return DropdownMenuItem(
              value: e,
              child: Text(e),
            );

          }).toList(),

          onChanged: onChanged,
        ),

        const SizedBox(height: 12),

      ],
    );
  }
}