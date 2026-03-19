import 'package:flutter/material.dart';
import 'package:medcare/widgets/button/primary_button_widget.dart';

import '../../../utils/app_colors.dart';
import '../../history/history_screen.dart';

class AppointmentSuccessScreen extends StatelessWidget {
  const AppointmentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Image(image: AssetImage('assets/img/appointment.png')),
          ),
          const SizedBox(height: 30),
          const Text(
            "Appointment have been made",
            style: TextStyle(
              color: AppColors.text,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 30),
          const Center(
            child: Text(
              "Prepare your attendance well, arrive 30\n    minutes before the appointed time",
              style: TextStyle(
                color: AppColors.text,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 40),
          PrimaryButtonWidget(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HistoryScreen()),
              );
            },
            title: 'Go To Details',
            color: AppColors.primary,
            backgroundColor: AppColors.white,
          ),
        ],
      ),
    );
  }
}
