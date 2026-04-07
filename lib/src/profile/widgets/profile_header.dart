import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';

class ProfileHeader extends StatelessWidget {

  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(16),

      ),

      child: Row(

        children: [

          Stack(

            children: [

              const CircleAvatar(

                radius: 30,

                backgroundImage: AssetImage(
                  "assets/img/profile.png",
                ),

              ),

              Positioned(

                bottom: 0,
                right: 0,

                child: Container(

                  padding: const EdgeInsets.all(4),

                  decoration: const BoxDecoration(

                    color: AppColors.primary,

                    shape: BoxShape.circle,

                  ),

                  child: const Icon(
                    Icons.edit,
                    size: 12,
                    color: Colors.white,
                  ),

                ),

              )

            ],

          ),

          const SizedBox(width: 14),

          const Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(
                "Lorenzo Ricci",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 4),

              Row(
                children: [
                  Icon(Icons.email_outlined,size:14),
                  SizedBox(width: 5),
                  Text(
                    "lorenzoricci@example.com",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),

              SizedBox(height: 4),

              Row(
                children: [
                  Icon(Icons.phone_outlined,size:14),
                  SizedBox(width: 5),
                  Text(
                    "+39 1234567890",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),

            ],

          ),

        ],

      ),

    );

  }

}