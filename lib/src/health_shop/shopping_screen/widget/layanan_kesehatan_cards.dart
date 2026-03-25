import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class HealthServiceCard extends StatelessWidget {

  final String image;
  final String title;

  const HealthServiceCard({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 160,

      margin: const EdgeInsets.only(right: 14),

      decoration: BoxDecoration(


        borderRadius: BorderRadius.circular(16),

        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),

      // child: Container(
      //
      //   alignment: Alignment.bottomLeft,
      //
      //   padding: const EdgeInsets.all(12),
      //
      //   decoration: BoxDecoration(
      //
      //     borderRadius: BorderRadius.circular(16),
      //
      //     gradient: LinearGradient(
      //
      //       begin: Alignment.bottomCenter,
      //
      //       end: Alignment.topCenter,
      //
      //       colors: [
      //
      //         Colors.black.withOpacity(0.5),
      //
      //         Colors.transparent,
      //       ],
      //     ),
      //   ),
      //
      //   child: Text(
      //     title,
      //
      //     style: const TextStyle(
      //
      //       color: AppColors.white,
      //
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      // ),
    );
  }
}