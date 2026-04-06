import 'package:flutter/material.dart';
import 'package:medcare/src/medication_reminder/widget/reminder_medicine_card.dart';
import 'package:medcare/widgets/button/primary_button_widget.dart';

import 'medication_reminder_empty_screen.dart';

class MedicationReminderScreen extends StatelessWidget {
  const MedicationReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 50),
                    const Text(
                      'Medication Reminder',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                 const ReminderMedicineCard(
                  title: 'Manage your medication',
                  subtitle:
                      'Add the medicine you are taking and create a reminder to take the medicine',
                   actionText: 'Lihat Semua',
                  actionicon: Icons.arrow_forward_ios,
                ),
                const SizedBox(height: 20),
                const ReminderMedicineCard(
                  title: 'View all your medication history',
                  subtitle:
                      'Add the medicine you are taking and create a reminder to take the medicine',
                ),
                const SizedBox(height: 20),
                PrimaryButtonWidget(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MedicationReminderEmptyScreen(),
                      ),
                    );
                  },
                  title: 'Add Medicine',
                  height: 45,

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
