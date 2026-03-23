import 'package:flutter/material.dart';
import 'package:medcare/src/home/widgets/doctor_horizontal_list_selection.dart';
import 'package:medcare/src/home/widgets/grid_view_categories.dart';
import 'package:medcare/src/home/widgets/health_article_section.dart';
import 'package:medcare/src/home/widgets/hospital_list.dart';
import 'package:medcare/src/home/widgets/selling_product_list.dart';

import '../../utils/app_colors.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
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
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
        
            /// HEADER
            Container(
              height: 40,
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: const Row(
                children: [
                  SizedBox(width: 20),
                  Text("Hi,", style: TextStyle(fontSize: 16)),
                  Text(
                    " Alexander",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  ImageIcon(AssetImage('assets/icon/cart.png'), size: 20),
                  SizedBox(width: 10),
                  ImageIcon(AssetImage('assets/icon/bell.png'), size: 20),
                  SizedBox(width: 20),
                ],
              ),
            ),
        
            /// BODY SCROLL
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: AppColors.containerBackground,
                  child: Column(
                    children: [
        
                      /// BANNER
                      Image.asset(
                        'assets/banner/Banner.png',
                        height: 210,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
        
                      /// CONTENT
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
        
                            /// SEARCH
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: AppColors.containerBackground,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Row(
                                children: [
                                  SizedBox(width: 10),
                                  ImageIcon(
                                    AssetImage('assets/icon/search.png'),
                                    size: 20,
                                    color: AppColors.disabledIcon,
                                  ),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      "Find a doctors, medicine or health service",
                                      style: TextStyle(
                                        color: AppColors.disableText,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  ImageIcon(
                                    AssetImage('assets/icon/filter.png'),
                                    size: 20,
                                    color: AppColors.disabledIcon,
                                  ),
                                  SizedBox(width: 10),
                                ],
                              ),
                            ),
        
                            const SizedBox(height: 20),
        
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
        
                            /// CONSULTATION CARD
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.tealContainer,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Consultation with a specialist",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "Promote health via chat or call",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: AppColors.greyLight,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios_outlined, size: 20),
                                ],
                              ),
                            ),
        
                            const SizedBox(height: 20),
        
                            /// SECTIONS
                            const DoctorHorizontalSection(),
                            const SizedBox(height: 20),
                            const SpecialityGridList(),
                            const SizedBox(height: 20),
                            const HospitalList(),
                            const SizedBox(height: 20),
                            const HealthArticleSection(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}