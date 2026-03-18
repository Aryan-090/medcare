import 'package:flutter/material.dart';
import 'package:medcare/utils/app_colors.dart';

import '../../../widgets/bottomNavigationBar/custom_bottom_nav.dart';
import '../widgets/doctor_list_item.dart';
import '../../home/main_screen.dart';
import 'doctor_detail_screen.dart';

class DoctorListScreen extends StatefulWidget {
  const DoctorListScreen({super.key});

  @override
  State<DoctorListScreen> createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  int currentIndex = 1; // Services tab

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> doctors = [
      {
        "image": "assets/doctors/doc3.png",
        "name": "Dr. Luca Rossi",
        "speciality": "Cardiology Specialist",
        "experience": "3 Years",
        "availability": "Available on Wed - Sat",
      },
      {
        "image": "assets/doctors/doc4.png",
        "name": "Dr. Marco Ferrari",
        "speciality": "Orthopedics Specialist",
        "experience": "3 Years",
        "availability": "Available on Wed - Tue",
      },
      {
        "image": "assets/doctors/doc5.png",
        "name": "Dr. Sofia Müller",
        "speciality": "Dermatology Specialist",
        "experience": "6 Years",
        "availability": "Available on Wed - Sat",
      },
      {
        "image": "assets/doctors/doc6.png",
        "name": "Dr. Rajesh Patel",
        "speciality": "General Surgery",
        "experience": "2 Years",
        "availability": "Available on Wed - Sat",
      },
      {
        "image": "assets/doctors/doc7.png",
        "name": "Dr. Anna Schmidt",
        "speciality": "General Practitioner",
        "experience": "10 Years",
        "availability": "Available on Wed - Sat",
      },
      {
        "image": "assets/doctors/doc8.png",
        "name": "Dr. Emma Andersen",
        "speciality": "Spesialis Neurologi",
        "experience": "4 Years",
        "availability": "Available on Wed - Sat",
      },
      {
        "image": "assets/doctors/doc9.png",
        "name": "Dr. Fabian Weber",
        "speciality": "General Surgery",
        "experience": "6 Years",
        "availability": "Available on Wed - Sat",
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Chat Doctor"),
        leading: const BackButton(),
        elevation: 0,
        backgroundColor: AppColors.background,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// SEARCH BAR
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.containerBackground,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: AppColors.green,
                ),
              ),
              child: const Row(
                children: [
                  SizedBox(width: 10),
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Text(
                    "Find a doctors",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// LIST
            Expanded(
              child: ListView.builder(
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  final doc = doctors[index];

                  return DoctorListItem(
                    image: doc["image"]!,
                    name: doc["name"]!,
                    speciality: doc["speciality"]!,
                    experience: doc["experience"]!,
                    availability: doc["availability"]!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorDetailScreen(doctor: doc),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

          ],
        ),
      ),

      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == currentIndex) return;
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MainScreen(initialIndex: index)),
          );
        },
      ),
    );
  }
}