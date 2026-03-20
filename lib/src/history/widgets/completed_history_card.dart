import 'package:flutter/material.dart';
import 'package:medcare/src/history/widgets/review_bottom_sheet.dart';
import 'package:medcare/utils/app_colors.dart';

class CompletedHistoryCard extends StatelessWidget {
  final String image;
  final String name;
  final String speciality;
  final String dateTime;
  final String location;
  final bool hasReview;

  const CompletedHistoryCard({
    super.key,
    required this.image,
    required this.name,
    required this.speciality,
    required this.dateTime,
    required this.location,
    this.hasReview = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// TOP
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      speciality,
                      style: TextStyle(color: AppColors.grey),
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

          const SizedBox(height: 10),
          const Divider(),

          /// INFO
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date & Time",
                      style: TextStyle(fontSize: 12, color: AppColors.grey),
                    ),
                    Text(
                      dateTime,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Location",
                      style: TextStyle(fontSize: 12, color: AppColors.grey),
                    ),
                    Text(
                      location,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// BOTTOM ACTION
          hasReview
              ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.star,
                          size: 14, color: AppColors.orange),
                      Icon(Icons.star,
                          size: 14, color: AppColors.orange),
                      Icon(Icons.star,
                          size: 14, color: AppColors.orange),
                      Icon(Icons.star,
                          size: 14, color: AppColors.orange),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "My Review",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Optional: open review details
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 12,
                          color: AppColors.primary,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const Spacer(),
              _outlineButton(
                "Next Appointment",
                context,
              ),
            ],
          )
              : Row(
            children: [
              Expanded(
                child: _outlineButton(
                  "Add Review",
                  context,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _outlineButton(
                  "Next Appointment",
                  context,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// REUSABLE BUTTON WITH ACTION
  Widget _outlineButton(String text, BuildContext context) {
    return GestureDetector(
      onTap: () {

        /// ADD REVIEW CLICK
        if (text == "Add Review") {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) {
              return const ReviewBottomSheet();
            },
          );
        }

        /// NEXT APPOINTMENT CLICK
        if (text == "Next Appointment") {
          print("Next Appointment Clicked");
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.green),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}