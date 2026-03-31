import 'package:flutter/material.dart';
import 'package:medcare/src/hospital/widget/hospital_maps.dart';
import 'package:medcare/src/hospital/widget/room_details_card.dart';
import 'package:medcare/widgets/button/primary_button_widget.dart';

import '../../utils/app_colors.dart';
import '../home/widgets/grid_view_categories.dart';

class HospitalDetailScreen extends StatefulWidget {
  const HospitalDetailScreen({super.key});

  @override
  State<HospitalDetailScreen> createState() => _HomeTabState();
}

class _HomeTabState extends State<HospitalDetailScreen> {
  int selectedIndex = -1;

  final List<Map<String, String>> items = [
    {"title": "General Practitioner", "icon": "assets/categories/doctor.png"},
    {"title": "Dentistry", "icon": "assets/categories/tooth.png"},
    {"title": "Gynecology", "icon": "assets/categories/gyno.png"},
    {"title": "Ophthalmology", "icon": "assets/categories/eye.png"},
    {"title": "Neurology", "icon": "assets/categories/brain.png"},
    {"title": "Otorhinolaryngology", "icon": "assets/categories/ear.png"},
    {"title": "Pulmonologist", "icon": "assets/categories/lungs.png"},
  ];

  String get image => 'assets/hospital/hospital3.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: 372,
                        height: 256,
                        color: Colors.transparent,
                        child: Image.asset(image, fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Ospedale San Raffaele',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Via Olgettina, 60, 20132 Milano MI, Italy',
                      style: TextStyle(fontSize: 12, color: AppColors.grey),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Icon(Icons.call, size: 14, color: AppColors.primary),
                        SizedBox(width: 5),
                        Text(
                          '(+22) 123 456 789',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Divider(color: AppColors.grey, thickness: 1),
                    const SizedBox(height: 10),
                    const Text(
                      'Specialities',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),

                    /// GRID
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
                    ),
                    const SizedBox(height: 20),
                    Divider(color: AppColors.grey, thickness: 1),
                    const SizedBox(height: 10),
                    const Text(
                      'Type Rooms',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const RoomDetailsCard(
                      title: 'General Ward',
                      type: '(4 Persons Per Room)',
                      beds: '120',
                      availability: '10 beds',
                      price: '\$100-\$150',
                    ),
                    const RoomDetailsCard(
                      title: 'Semi-Private Rooms',
                      type: '(2 Persons Per Room)',
                      beds: '80',
                      availability: '30 beds',
                      price: '\$170-\$210',
                    ),
                    const RoomDetailsCard(
                      title: 'Private Rooms',
                      beds: '40',
                      availability: '20 beds',
                      price: '\$350-\$450',
                      type: '',
                    ),
                    const RoomDetailsCard(
                      title: 'Deluxe Rooms',
                      beds: '12',
                      availability: '0 beds',
                      price: '\$600-\$1000',
                      type: '',
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 70,
                  width: 380,
                  decoration: const BoxDecoration(color: AppColors.background),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: PrimaryButtonWidget(
                          height: 51,
                          // width: 120,
                          backgroundColor: AppColors.white,
                          color: AppColors.primary,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HospitalMaps(),
                              ),
                            );
                          },
                          title: 'Maps',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 5,
                        child: PrimaryButtonWidget(
                          // width: 255,
                          height: 51,
                          onTap: () {},
                          title: 'Contact Now',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
