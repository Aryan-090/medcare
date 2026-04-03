import 'package:flutter/material.dart';
import 'package:medcare/src/medication_reminder/medication_reminder_screen.dart';
import 'package:medcare/utils/app_colors.dart';

import 'package:medcare/src/services/screens/chat_doctor_screen.dart';

import '../article/list_article_screen.dart';
import '../health_shop/shopping_screen/shopping_screen.dart';
import '../hospital/list_hospital_screen.dart';
import '../specialization/specialist_screen.dart';

class Services extends StatefulWidget {
  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  int selectedIndex = -1;

  final List<Map<String, String>> items = [
    {"title": "Chat Doctor", "icon": "assets/icon/chat.png"},
    {"title": "Hospital", "icon": "assets/icon/hospital.png"},
    {"title": "Emergency Services", "icon": "assets/icon/emergency.png"},
    {"title": "Article", "icon": "assets/icon/article.png"},
    {"title": "Medication Reminder", "icon": "assets/icon/medication.png"},
    {"title": "Specialization", "icon": "assets/icon/specialization.png"},
    {"title": "Health Shop", "icon": "assets/icon/shop.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        double padding = orientation == Orientation.portrait ? 10.0 : 20.0;
        double itemSize = orientation == Orientation.portrait ? 81.0 : 100.0; // Adjust size for landscape
        int crossAxisCount = orientation == Orientation.portrait ? 4 : 3; // 4 in portrait, 3 in landscape for better fit

        return SafeArea(
          child: Container(
            color: AppColors.background,
            padding: EdgeInsets.all(padding),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
                    ),
                    const SizedBox(width: 85),
                    const Center(
                      child: Text(
                        "Services",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    itemCount: items.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 20,
                      childAspectRatio: 1, // Square items
                    ),
                    itemBuilder: (context, index) {
                      return ServiceItem(
                        title: items[index]["title"]!,
                        iconPath: items[index]["icon"]!,
                        isSelected: selectedIndex == index,
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                          if (items[index]["title"] == "Chat Doctor") {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const DoctorListScreen()));
                          }
                          else if (items[index]["title"] == "Health Shop") {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const shopping_screen()));
                          }
                          else if (items[index]["title"] == "Hospital") {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ListHospitalScreen()));
                          }
                          else if (items[index]["title"] == "Medication Reminder") {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const MedicationReminderScreen()));
                          }
                          else if (items[index]["title"] == "Specialization") {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const SpecialistScreen()));
                          }
                          else if (items[index]["title"] == "Article") {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ListArticleScreen()));
                          }
                        },
                        size: itemSize,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ServiceItem extends StatelessWidget {
  final String title;
  final String iconPath;
  final bool isSelected;
  final VoidCallback onTap;
  final double size;

  const ServiceItem({
    super.key,
    required this.title,
    required this.iconPath,
    this.isSelected = false,
    required this.onTap,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: isSelected
              ? Border.all(color: AppColors.primary, width: 2)
              : Border.all(color: Colors.transparent),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, width: 30, height: 30),
            const SizedBox(height: 7),
            SizedBox(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 10,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
