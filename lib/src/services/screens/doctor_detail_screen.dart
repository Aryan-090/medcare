import 'package:flutter/material.dart';
import 'package:medcare/utils/app_colors.dart';

import '../widgets/doctor_profile_header.dart';
import '../widgets/info_card.dart';
import '../widgets/review_card.dart';
import '../widgets/schedule_selector.dart';
import '../widgets/working_hours.dart';
import '../widgets/practice_location_card.dart';

class DoctorDetailScreen extends StatelessWidget {
  final Map<String, String> doctor;

  const DoctorDetailScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,

      appBar: AppBar(
        title: const Text(
          "Doctor Details",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_outlined)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.share_outlined, color: Colors.black87),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: Column(
        children: [
          const SizedBox(height: 10),

          DoctorProfileHeader(doctor: doctor),

          const SizedBox(height: 16),

          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// INFO
                    Row(
                      children: const [
                        Expanded(
                          child: InfoCard(
                            title: "Education",
                            value: "University of Milan",
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: InfoCard(
                            title: "License",
                            value: "1276126552881",
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    /// PRACTICE LOCATION
                    const Text(
                      "Practice Location",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const PracticeLocationCard(),

                    const SizedBox(height: 16),

                    /// WORKING HOURS
                    const Text(
                      "Working Hours",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const WorkingHours(times: [
                      "9.00 AM",
                      "10.00 AM",
                      "1.00 PM",
                      "2.00 PM",
                      "3.00 PM",
                      "4.00 PM"
                    ]),

                    const SizedBox(height: 16),

                    /// SCHEDULE SELECTOR
                    const Text(
                      "Schedule",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const ScheduleSelector(days: [
                      {"day": "Wed", "date": "22"},
                      {"day": "Thu", "date": "23"},
                      {"day": "Fri", "date": "24"},
                      {"day": "Sat", "date": "25"},
                      {"day": "Sun", "date": "26"},
                      {"day": "Mon", "date": "27"},
                    ]),

                    const SizedBox(height: 16),

                    /// REVIEWS
                    const Text(
                      "Review",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      child: Row(
                        children: const [
                          ReviewCard(),
                          ReviewCard(),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 24), // Extra space for bottom nav
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      /// BOTTOM BUTTONS
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
        child: Row(
          children: [
            /// CHAT BUTTON
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: AppColors.primary),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              child: Row(
                children: const [
                  Icon(Icons.chat_outlined, color: AppColors.primary, size: 20),
                  SizedBox(width: 8),
                  Text(
                    "Chat",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(width: 16),

            /// MAKE AN APPOINTMENT BUTTON
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  "Make An Appointment",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
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