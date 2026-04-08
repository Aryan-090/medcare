import 'package:flutter/material.dart';
import 'package:medcare/src/profile/widgets/disease_card.dart';

import '../../utils/app_colors.dart';

class HealthHistoryScreen extends StatefulWidget {
  const HealthHistoryScreen({super.key});

  @override
  State<HealthHistoryScreen> createState() => _HealthHistoryScreenState();
}

class _HealthHistoryScreenState extends State<HealthHistoryScreen> {
  String selectedFilter = "Disease History";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Health History"),
        leading: const BackButton(),
        backgroundColor: AppColors.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DiseaseDropdown(
              value: selectedFilter,
              onChanged: (value) {
                setState(() {
                  selectedFilter = value;
                });
              },
            ),
            const SizedBox(height: 10),
            const DiseaseCard(
              title: "Diagnosis : January 10, 2022",
              diseasetype: 'Disease History',
            ),
            const SizedBox(height: 10),
            const DiseaseCard(
              title: "Diagnosis : May 15, 2023",
              diseasetype: 'Disease History',
            ),
            const SizedBox(height: 10),
            const DiseaseCard(
              title: "Severity : Server, Precautions",
              diseasetype: 'Disease History',
              note: 'Avoid foods containing nuts',
            ),
          ],
        ),
      ),
    );
  }
}

class DiseaseDropdown extends StatelessWidget {
  final String value;
  final Function(String) onChanged;

  const DiseaseDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      "Disease History",
      "Allergy History",
      "Surgery History",
      "History of Drugs Consumed"
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
