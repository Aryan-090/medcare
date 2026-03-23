import 'package:flutter/material.dart';
import 'package:medcare/utils/app_colors.dart';

class HistoryUpcomingEmpty extends StatelessWidget {
  const HistoryUpcomingEmpty({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(16),

      child: Center(

        child: SizedBox(
          height: 245,
          width: 317,

          child: Column(

            children: [

              Image.asset('assets/img/history_empty.png'),

              const SizedBox(height: 10),

              Text(
                'Next Visit Schedule',

                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "You don't have a further visit scheduled.\nMake an appointment with the doctor now.",

                textAlign: TextAlign.center,

                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}