import 'package:flutter/material.dart';
import 'package:medcare/utils/app_colors.dart';

class RescheduleBottomSheet extends StatelessWidget {
  const RescheduleBottomSheet({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// DRAG HANDLE
          Center(
            child: Container(
              width: 50,
              height: 5,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          /// TITLE
          const Center(
            child: Text(
              "Reschedule Appointment",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),

          const SizedBox(height: 16),

          /// WORKING HOURS
          const Text("Working Hours",
              style: TextStyle(fontWeight: FontWeight.w500)),

          const SizedBox(height: 10),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: const [
              _TimeBox("9.00 AM"),
              _TimeBox("10.00 AM"),
              _TimeBox("1.00 PM"),
              _TimeBox("2.00 PM"),
              _TimeBox("3.00 PM"),
              _TimeBox("4.00 PM"),
            ],
          ),

          const SizedBox(height: 16),

          /// SCHEDULE
          const Text("Schedule",
              style: TextStyle(fontWeight: FontWeight.w500)),

          const SizedBox(height: 10),

          Wrap(
            spacing: 10,
            children: const [
              _DayBox("Wed", "22"),
              _DayBox("Thu", "23"),
              _DayBox("Fri", "24"),
              _DayBox("Sat", "25"),
              _DayBox("Sun", "26"),
            ],
          ),

          const SizedBox(height: 20),

          /// BUTTONS
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel",style: TextStyle(color: AppColors.black)),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Reschedule",style: TextStyle(color: AppColors.white),),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

/// TIME BOX
class _TimeBox extends StatelessWidget {
  final String time;

  const _TimeBox(this.time);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(time),
    );
  }
}

/// DAY BOX
class _DayBox extends StatelessWidget {
  final String day;
  final String date;

  const _DayBox(this.day, this.date);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Text(day),
          Text(date),
        ],
      ),
    );
  }
}