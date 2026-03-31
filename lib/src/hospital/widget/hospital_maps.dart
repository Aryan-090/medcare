import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import 'hospital_card_widget.dart';

class HospitalMaps extends StatelessWidget {
  const HospitalMaps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: AppColors.background,
            child: Image.asset('assets/img/map.png', fit: BoxFit.cover),
          ),
          Positioned(
            bottom: 30,
            right: 15,
            left: 15,
            child: HospitalCardWidget(
              title: 'Ospedale San Raffaele',
              image: Image.asset('assets/hospital/hospital3.png'),
              phone: '(+22) 123 456 789',
              address: 'Via Olgettina, 60, 20132 Milano MI, Italy',
            )
          ),
        ],
      ),
    );
  }
}
