import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class HospitalDetailScreen extends StatelessWidget {
  const HospitalDetailScreen({super.key});

  String get image => 'assets/hospital/hospital3.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 372,
                  height: 256,
                  color: Colors.transparent,
                  child: Image.asset(image, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 10),
              Text('Ospedale San Raffaele', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),
              Text('Via Olgettina, 60, 20132 Milano MI, Italy', style: TextStyle(fontSize: 12, color: AppColors.grey)),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.call, size: 14, color: AppColors.primary),
                  const SizedBox(width: 5),
                  Text('(+22) 123 456 789', style: TextStyle(fontSize: 12, color: AppColors.primary)),
                ],
              ),
              const SizedBox(height: 10),
              Divider(color: AppColors.grey, thickness: 1),
              const SizedBox(height: 10),

            ],
          ),
        ),
      ),
    );
  }
}
