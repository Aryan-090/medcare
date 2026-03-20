import 'package:flutter/material.dart';
import 'package:medcare/utils/app_colors.dart';
import 'package:medcare/widgets/button/primary_button_widget.dart';

class NotificationBottomSheet extends StatefulWidget {
  const NotificationBottomSheet({super.key});

  @override
  State<NotificationBottomSheet> createState() =>
      _NotificationBottomSheetState();
}

class _NotificationBottomSheetState extends State<NotificationBottomSheet> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          /// DRAG HANDLE
          Container(
            width: 50,
            height: 5,
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: AppColors.greyLight,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          /// TITLE
          const Text(
            "Notification",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 20),

          /// TOGGLE CONTAINER
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.green),
            ),
            child: Row(
              children: [

                const Text(
                  "Activate notifications",
                  style: TextStyle(fontSize: 14),
                ),

                const Spacer(),

                Switch(
                  value: isEnabled,
                  activeTrackColor: AppColors.primary,
                  thumbColor:  MaterialStateProperty.all(AppColors.white),
                  inactiveTrackColor: AppColors.primarylow,
                  onChanged: (value) {
                    setState(() {
                      isEnabled = value;
                    });
                  },
                )
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// SUBMIT BUTTON
          SizedBox(
            width: double.infinity,
            height: 50,
            child: PrimaryButtonWidget(
              title: "Submit",
              onTap: () {
                print("Notification: $isEnabled");
                Navigator.pop(context);
              },
            ),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}