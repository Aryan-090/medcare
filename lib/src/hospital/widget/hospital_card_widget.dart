import 'package:flutter/material.dart';
import 'package:medcare/widgets/button/primary_button_widget.dart';

import '../../../utils/app_colors.dart';
import 'hospital_detail_screen.dart';

class HospitalCardWidget extends StatelessWidget {
  const HospitalCardWidget({
    super.key,
    required this.title,
    required this.image,
    required this.phone,
    required this.address,
  });

  final String title;
  final Widget? image;
  final String? phone;
  final String? address;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 372,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.green),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 85,
                  height: 74,
                  color: Colors.transparent,
                  child:
                      image is Image
                          ? Image(
                            image: (image as Image).image,
                            fit: BoxFit.cover,
                          )
                          : image,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    address!,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.call,
                        size: 14,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        phone!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.primary,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Divider(color: AppColors.grey, thickness: 1),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: PrimaryButtonWidget(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HospitalDetailScreen(),
                      ),
                    );
                  },
                  title: 'Bed Detail',
                  backgroundColor: AppColors.white,
                  color: AppColors.primary,
                  border: BorderSide(color: AppColors.primary),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    PrimaryButtonWidget(
                      onTap: () {},
                      title: 'Location',
                      backgroundColor: AppColors.primary,
                      color: AppColors.white,
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 14,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
