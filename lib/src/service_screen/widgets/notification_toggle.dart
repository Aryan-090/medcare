import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class NotificationToggle extends StatefulWidget {
  const NotificationToggle({super.key});

  @override
  State<NotificationToggle> createState() => _NotificationToggleState();
}

class _NotificationToggleState extends State<NotificationToggle> {
  bool isOn = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 372,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade100),
      ),
      child: Row(
        children: [

          const ImageIcon(AssetImage('assets/icon/bell.png'), size: 22,color: AppColors.primary,),

          const SizedBox(width: 10),

          const Text("Activate notifications"),

          const Spacer(),

          Switch(
            value: isOn,
            onChanged: (value) {
              setState(() {
                isOn = value;
              });
            },activeTrackColor: AppColors.primary,
            thumbColor:  MaterialStateProperty.all(AppColors.white),
          )
        ],
      ),
    );
  }
}