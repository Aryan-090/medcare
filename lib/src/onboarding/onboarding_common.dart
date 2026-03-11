import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:medcare/utils/app_colors.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget({
    super.key,
    required this.title1,
    required this.subtitle,
    required this.Image, this.backgroundColor,
  });

  final String title1;
  final String Image;
  final Color? backgroundColor;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 50),

        const SizedBox(height: 20),
        Container(
          height: 120,
          width: 300,
          padding: const EdgeInsets.all(10),
          child: const Column(
            children: [
              Text(
                title1,
                style: TextStyle(
                  color: Color(0xFF121212),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              Text(
                subtitle,
              //   "Connect with healthcare professionals\nvirtually for convenient medical advice\n                     and support.",
               ),
            ],
          ),
        ),
        const SizedBox(height: 120),
        PrimaryButtonWidget(onTap: () {}, title: 'Next'),
      ],
    );
  }
}
