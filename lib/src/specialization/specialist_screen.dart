import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../home/widgets/grid_view_categories.dart';

class SpecialistScreen extends StatefulWidget {
  const SpecialistScreen({super.key});

  @override
  State<SpecialistScreen> createState() => _HomeTabState();
}

class _HomeTabState extends State<SpecialistScreen> {
  int selectedIndex = -1;

  final List<Map<String, String>> items = [
    {"title": "All", "icon": "assets/categories/all.png"},
    {"title": "General Practitioner", "icon": "assets/categories/doctor.png"},
    {"title": "Dentistry", "icon": "assets/categories/tooth.png"},
    {"title": "Gynecology", "icon": "assets/categories/gyno.png"},
    {"title": "Ophthalmology", "icon": "assets/categories/eye.png"},
    {"title": "Neurology", "icon": "assets/categories/brain.png"},
    {"title": "Otorhinolaryngology", "icon": "assets/categories/ear.png"},
    {"title": "Pulmonologist", "icon": "assets/categories/lungs.png"},
    {"title": "Pediatrician", "icon": "assets/categories/pediatrician.png"},
    {"title": "Neurology Practitioner", "icon": "assets/categories/neurology.png"},
    {"title": "Psychiatrist", "icon": "assets/categories/phychiatrist.png"},
    {"title": "Cardiologist", "icon": "assets/categories/cardiologist.png"},
    {"title": "Gastoenterologi", "icon": "assets/categories/gastoenterologi.png"},
    {"title": "Virus", "icon": "assets/categories/virus.png"},
    {"title": "Orthopedi", "icon": "assets/categories/orthopedi.png"},
    {"title": "Endocrin", "icon": "assets/categories/endocrin.png"},
    {"title": "Dermatologist", "icon": "assets/categories/dermatologist.png"},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Text("Specialist", style: TextStyle(fontSize: 18)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
        ),
      ),
      body: Padding(padding: const EdgeInsets.all(10),
        child: /// GRID
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return SpecialityGridItem(
              title: items[index]["title"]!,
              iconPath: items[index]["icon"]!,
              isSelected: selectedIndex == index,
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
            );
          },
        ),),
    );
  }
}
