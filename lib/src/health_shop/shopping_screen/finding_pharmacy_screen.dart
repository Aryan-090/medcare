import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class FindingPharmacyScreen extends StatelessWidget {
  const FindingPharmacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.background,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset('assets/img/Pharmacy 1.png', height: 200)),
            const SizedBox(height: 20),
            const Text(
              'Finding Nearest Pharmacy...',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.add_circle_outline),
                const SizedBox(width: 8),
                Text(
                  'Pricing, product availability, and shipping \nmethods may differ.',
                  style: TextStyle(fontSize: 14, color: AppColors.grey),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.add_circle_outline),
                const SizedBox(width: 8),
                Text(
                  'Select the delivery method that fits your\n requirements.same-day delivery and\n next-day delivery',
                  style: TextStyle(fontSize: 14, color: AppColors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
