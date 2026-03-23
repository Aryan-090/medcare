import 'package:flutter/material.dart';
import 'package:medcare/src/history/widgets/upcoming_history_card.dart';
import 'package:medcare/src/history/widgets/completed_history_card.dart';
import 'package:medcare/src/history/widgets/history_tab_switch.dart';
import 'package:medcare/src/history/widgets/history_upcoming_empty.dart';
import 'package:medcare/src/history/widgets/history_completed_empty.dart';
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

  /// DEMO LISTS
  /// later you can replace with Firebase data
  List<Map<String, String>> upcomingAppointments = [];

  List<Map<String, dynamic>> completedAppointments = [];

  @override
  void initState() {
    super.initState();

    /// if user booked from doctor screen
    if (widget.selectedDoctor != null) {
      upcomingAppointments.add(widget.selectedDoctor!);
    }

    /// demo completed data (optional remove later)
    // completedAppointments.add({
    //   "image": "assets/doctors/doc1.png",
    //   "name": "Dr. Giovanni Bianchi",
    //   "speciality": "General Surgery",
    //   "dateTime": "Wednesday, 29 Feb 04.00 pm",
    //   "location": "Clinic Address",
    //   "hasReview": false,
    // });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        backgroundColor: AppColors.white,
        titleSpacing: 90,
        title: const Text("History"),
        leading: widget.selectedDoctor != null
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
          color: AppColors.white,
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



              const SizedBox(height: 10),

              /// MAIN CONTENT
              Expanded(
                child: _buildContent(),
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
          }

          else {

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

  /// CONTENT BUILDER
  Widget _buildContent() {

    /// UPCOMING TAB
    if (selectedTab == 0) {

      if (upcomingAppointments.isEmpty) {

        return const HistoryUpcomingEmpty();
      }

      return ListView.builder(

        itemCount: upcomingAppointments.length,

        itemBuilder: (context, index) {

          final data = upcomingAppointments[index];

          return AppointmentHistoryCard(

            image: data["image"] ?? "assets/doctors/doc1.png",

            name: data["name"] ?? "Dr. Unknown",

            speciality: data["speciality"] ?? "Specialist",

            dateTime: data["dateTime"]
                ?? "Wednesday, 29 Feb 04.00 pm",

            location: data["location"]
                ?? "Clinic Address",

            notificationOn: true,
          );
        },
      );
    }

    /// COMPLETED TAB
    else {

      if (completedAppointments.isEmpty) {

        return const HistoryCompletedEmpty();
      }

      return ListView.builder(

        itemCount: completedAppointments.length,

        itemBuilder: (context, index) {

          final data = completedAppointments[index];

          return CompletedHistoryCard(

            image: data["image"] ?? "assets/doctors/doc1.png",

            name: data["name"] ?? "Dr. Unknown",

            speciality: data["speciality"] ?? "Specialist",

            dateTime: data["dateTime"]
                ?? "Wednesday, 29 Feb 04.00 pm",

            location: data["location"]
                ?? "Clinic Address",

            hasReview: data["hasReview"] ?? false,
          );
        },
      );
    }

  }
}