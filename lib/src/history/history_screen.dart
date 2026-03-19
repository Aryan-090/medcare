import 'package:flutter/material.dart';
import 'package:medcare/src/history/widgets/appointment_history_card.dart';
import 'package:medcare/src/history/widgets/history_tab_switch.dart';

import '../../utils/app_colors.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

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
        leading: IconButton(onPressed: (){},
            icon: const Icon(Icons.arrow_back_ios_new_outlined,)),
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
                child: ListView(
                  children: const [

                    AppointmentHistoryCard(
                      image: "assets/doctors/doc1.png",
                      name: "Dr. Giovanni Bianchi",
                      speciality: "General Surgery",
                      dateTime: "Wednesday, 29 Feb 04.00 pm",
                      location:
                      "Bella Vista Surgery Clinic, Via Garibaldi 10, Milan, Italy",
                      notificationOn: true,
                    ),

                    AppointmentHistoryCard(
                      image: "assets/doctors/doc2.png",
                      name: "Dr. Luca Rossi",
                      speciality: "Cardiology Specialist",
                      dateTime: "Wednesday, 22 Feb 1.00 pm",
                      location:
                      "Rossi Cardiology Clinic Via Garibaldi 15, Milan, Italy",
                      notificationOn: false,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}