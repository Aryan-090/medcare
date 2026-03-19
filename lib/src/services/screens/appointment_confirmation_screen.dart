import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medcare/utils/app_colors.dart';
import 'package:medcare/widgets/button/primary_button_widget.dart';

import '../../../widgets/button/swipe_button.dart';
import '../widgets/appointment_detail_card.dart';
import '../widgets/doctor_info_card.dart';
import '../widgets/notification_toggle.dart';
import 'appointment_success_screen.dart';

class AppointmentConfirmationScreen extends StatelessWidget {
  final Map<String, String> doctor;

  const AppointmentConfirmationScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Text("Confirmation"),
        leading: const BackButton(),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            /// DOCTOR INFO
            DoctorInfoCard(
              image: doctor["image"] ?? "assets/doctors/doc1.png",
              name: doctor["name"] ?? "Dr. Unknown",
              speciality: doctor["speciality"] ?? "Specialist",
              experience: doctor["experience"] ?? "0 Years",
              education: doctor["education"] ?? "Unknown University",
              license: doctor["license"] ?? "0000000000000",
            ),

            const SizedBox(height: 16),

            /// DETAIL CARD
            const AppointmentDetailCard(
              dateTime: "Wednesday, 22 Feb 1.00PM",
              clinic: "Rossi Cardiology Clinic",
              address: "Via Garibaldi 15, Milan, Italy",
            ),

            const SizedBox(height: 16),

            const NotificationToggle(),

            const Spacer(),

            /// BUTTON
            SwipeButton(
              text: "Check In",
              onComplete: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AppointmentSuccessScreen(),
                  ),
                );
                Navigator.canPop(context);
              },

              // Navigate or show success
            ),

            const SizedBox(height: 8),

            const Text(
              "Swipe to check in",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
