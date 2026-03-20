import 'package:flutter/material.dart';
import 'package:medcare/src/history/widgets/upcoming_history_card.dart';
import 'package:medcare/src/history/widgets/completed_history_card.dart';
import 'package:medcare/src/history/widgets/history_tab_switch.dart';
import 'package:medcare/src/home/main_screen.dart';

import '../../utils/app_colors.dart';
import '../../widgets/bottomNavigationBar/custom_bottom_nav.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({
    super.key,
    this.selectedDoctor,
    this.currentNavIndex = 2,
    this.onNavTap,
    this.isStandalone = false,
  });

  final Map<String, String>? selectedDoctor;
  final int currentNavIndex;
  final Function(int)? onNavTap;
  final bool isStandalone;

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        titleSpacing: 90,
        title: const Text("History"),
        leading:
            widget.selectedDoctor != null
                ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_outlined),
                )
                : null,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          color: AppColors.background,
          child: Column(
            children: [
              /// TAB SWITCH
              HistoryTabSwitch(
                selectedIndex: selectedTab,
                onTap: (index) {
                  setState(() {
                    selectedTab = index;
                  });
                },
              ),

              const SizedBox(height: 16),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text("1 Minggu yang akan datang"),
              ),

              const SizedBox(height: 10),

              /// LIST
              Expanded(
                child: widget.selectedDoctor != null
                    ? ListView(
                  children: [
                    if (selectedTab == 0)
                      AppointmentHistoryCard(
                        image: widget.selectedDoctor!["image"] ??
                            "assets/doctors/doc1.png",
                        name: widget.selectedDoctor!["name"] ?? "Dr. Unknown",
                        speciality:
                        widget.selectedDoctor!["speciality"] ?? "Specialist",
                        dateTime:
                        widget.selectedDoctor!["dateTime"] ??
                            "Wednesday, 29 Feb 04.00 pm",
                        location:
                        widget.selectedDoctor!["location"] ?? "Clinic Address",
                        notificationOn: true,
                      ),

                    if (selectedTab == 1)
                      CompletedHistoryCard(
                        image: widget.selectedDoctor!["image"] ??
                            "assets/doctors/doc1.png",
                        name: widget.selectedDoctor!["name"] ?? "Dr. Unknown",
                        speciality:
                        widget.selectedDoctor!["speciality"] ?? "Specialist",
                        dateTime:
                        widget.selectedDoctor!["dateTime"] ??
                            "Wednesday, 29 Feb 04.00 pm",
                        location:
                        widget.selectedDoctor!["location"] ?? "Clinic Address",
                        hasReview: false,
                      ),
                  ],
                )
                    : ListView(
                  children: [
                    /// UPCOMING
                    if (selectedTab == 0) ...[
                      const AppointmentHistoryCard(
                        image: "assets/doctors/doc1.png",
                        name: "Dr. Giovanni Bianchi",
                        speciality: "General Surgery",
                        dateTime: "Wednesday, 29 Feb 04.00 pm",
                        location:
                        "Bella Vista Surgery Clinic, Via Garibaldi 10, Milan, Italy",
                        notificationOn: true,
                      ),
                      const AppointmentHistoryCard(
                        image: "assets/doctors/doc2.png",
                        name: "Dr. Luca Rossi",
                        speciality: "Cardiology Specialist",
                        dateTime: "Wednesday, 22 Feb 1.00 pm",
                        location:
                        "Rossi Cardiology Clinic Via Garibaldi 15, Milan, Italy",
                        notificationOn: false,
                      ),
                    ],

                    /// COMPLETED
                    if (selectedTab == 1) ...[
                      const CompletedHistoryCard(
                        image: "assets/doctors/doc1.png",
                        name: "Dr. Giovanni Bianchi",
                        speciality: "General Surgery",
                        dateTime: "Wednesday, 29 Feb 04.00 pm",
                        location:
                        "Bella Vista Surgery Clinic, Via Garibaldi 10, Milan, Italy",
                        hasReview: false,
                      ),
                      const CompletedHistoryCard(
                        image: "assets/doctors/doc2.png",
                        name: "Dr. Luca Rossi",
                        speciality: "Cardiology Specialist",
                        dateTime: "Wednesday, 22 Feb 1.00 pm",
                        location:
                        "Rossi Cardiology Clinic Via Garibaldi 15, Milan, Italy",
                        hasReview: true,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: widget.isStandalone
          ? CustomBottomNav(
              currentIndex: widget.currentNavIndex,
              onTap: (index) {
                if (widget.onNavTap != null) {
                  widget.onNavTap!(index);
                } else {
                  // Navigate to MainScreen with the selected index
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(initialIndex: index),
                    ),
                  );
                }
              },
            )
          : null,
    );
  }
}
