import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../widgets/bottomNavigationBar/custom_bottom_nav.dart';
import 'widgets/filter_dropdown.dart';
import 'widgets/doctor_card.dart';

class PrescriptionHistoryScreen extends StatefulWidget {
  const PrescriptionHistoryScreen({super.key});

  @override
  State<PrescriptionHistoryScreen> createState() =>
      _PrescriptionHistoryScreenState();
}

class _PrescriptionHistoryScreenState extends State<PrescriptionHistoryScreen> {
  String selectedFilter = "Active Recipe";

  final List<Map<String, dynamic>> prescriptions = [
    {
      "doctor": "Dr. Emily Smith, MD",
      "date": "12 June 2024 - 20 June 2024",
      "medicines": [
        {
          "name": "Paracetamol 500 mg",
          "description":
              "Take 1 tablet every 6 hours as needed to reduce fever or pain.",
        },
        {
          "name": "Amoxicillin 500 mg",
          "description":
              "Take 1 tablet every 8 hours for 7 days to treat bacterial infection",
        },
        {
          "name": "Omeprazole 20 mg",
          "description":
              "Take 1 tablet every morning before eating to reduce stomach acid production.",
        },
      ],
    },
    {
      "doctor": "Dr. Emily Smith, MD",
      "date": "12 June 2024 - 20 June 2024",
      "medicines": [
        {
          "name": "Paracetamol 500 mg",
          "description":
              "Take 1 tablet every 6 hours as needed to reduce fever or pain.",
        },
        {
          "name": "Amoxicillin 500 mg",
          "description":
              "Take 1 tablet every 8 hours for 7 days to treat bacterial infection",
        },
        {
          "name": "Omeprazole 20 mg",
          "description":
              "Take 1 tablet every morning before eating to reduce stomach acid production.",
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Prescription History"),
        leading: const BackButton(),
        backgroundColor: AppColors.background,
      ),

      body: Column(
        children: [
          /// dropdown filter
          FilterDropdown(
            value: selectedFilter,
            onChanged: (value) {
              setState(() {
                selectedFilter = value;
              });
            },
          ),

          const SizedBox(height: 10),

          /// list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: prescriptions.length,
              itemBuilder: (context, index) {
                final data = prescriptions[index];

                return DoctorCard(
                  doctorName: data["doctor"],
                  date: data["date"],
                  medicines: data["medicines"],
                );
              },
            ),
          ),

          CustomBottomNav(
            currentIndex: 3,
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.pushReplacementNamed(context, '/home');
                  break;
              }
            },
          ),
        ],
      ),
    );
  }
}
