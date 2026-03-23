import 'package:flutter/material.dart';
import 'package:medcare/src/history/widgets/reschedule_bottom_sheet.dart';
import 'package:medcare/utils/app_colors.dart';
import 'package:medcare/widgets/button/primary_button_widget.dart';

import 'notification_bottom_sheet.dart';

class AppointmentHistoryCard extends StatelessWidget {
  final String image;
  final String name;
  final String speciality;
  final String dateTime;
  final String location;
  final bool notificationOn;

  const AppointmentHistoryCard({
    super.key,
    required this.image,
    required this.name,
    required this.speciality,
    required this.dateTime,
    required this.location,
    required this.notificationOn,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text("   1 Minggu yang akan datang",style: TextStyle(fontWeight: FontWeight.w500),),
        ),
        Container(
          height: 230,
          width: 350,
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// TOP ROW
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          speciality,
                          style:  TextStyle(color: AppColors.grey),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage(image),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              const Divider(),

              const SizedBox(height: 10),

              /// DATE & LOCATION
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Date & Time",
                            style: TextStyle(color: AppColors.grey, fontSize: 12)),
                        const SizedBox(height: 2),
                        Text(
                          dateTime,
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Location",
                            style: TextStyle(color: AppColors.grey, fontSize: 12)),
                        const SizedBox(height: 2),
                        Text(
                          location,
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              /// BOTTOM ROW
              Row(
                children: [

                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                              return const NotificationBottomSheet();
                            },
                          );
                        },
                        child: Row(
                          children: [
                            const ImageIcon(AssetImage('assets/icon/bell.png'), size: 18,color: AppColors.primary,),
                            const SizedBox(width: 4),
                            Text(
                              notificationOn ? "Notifications On" : "Notifications Off",
                              style: TextStyle(
                                fontSize: 12,
                                color: notificationOn
                                    ? AppColors.primary
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  SizedBox(
                    height: 36,
                    child: PrimaryButtonWidget(
                      title: "Reschedule",
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return const RescheduleBottomSheet();
                          },
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}