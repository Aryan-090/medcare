import 'package:flutter/material.dart';
import 'package:medcare/src/profile/widgets/notification_card.dart';
import 'package:medcare/widgets/bottomNavigationBar/custom_bottom_nav.dart';

import '../../utils/app_colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Notification"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                NotificationCard(
                  icon: Icons.notifications_active,
                  title: 'Doctor Appointment Reminder',
                  description:
                      'Hi Aryan, this is a reminder for your \nconsultation appointment with Dr.Emily',
                  color: AppColors.primary,
                ),
                SizedBox(height: 10),
                NotificationCard(
                  icon: Icons.notifications_active,
                  title: 'New Medical Record Notification',
                  description:
                      'Hello Aryan, you have a new \nmedical record added to your profile.',
                  color: AppColors.purple,
                ),
                SizedBox(height: 10),
                NotificationCard(
                  icon: Icons.back_hand_rounded,
                  title: 'Medication Pickup Reminder',
                  description:
                      'Good Morning Aryan, dont forget to \npick up your daily dose of medication.',
                  color: AppColors.circleBackground,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: CustomBottomNav(
              currentIndex: 3,
              onTap: (index) {
                if (index == 0) {
                  Navigator.pushNamed(context, '/home');
                } else if (index == 1) {
                  Navigator.pushNamed(context, '/profile');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
