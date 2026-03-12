import 'package:flutter/material.dart';
import 'package:medcare/utils/app_colors.dart';

import '../../../widgets/button/primary_button_widget.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(30),
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 33,
                width: 95,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.border),
                ),
                child: const Center(child: Text("English"),),
              ),
              const Spacer(),
              // SizedBox(height: 220),
              Center(child: Image.asset("assets/img/splash_logo_1.png")),
              const SizedBox(height: 15),
              const Center(
                child: Text(
                  "We're here to help keep you healthy",
                  style: TextStyle(color: AppColors.text, fontSize: 16),
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryButtonWidget(onTap: () {}, title: 'Next'),
                  const SizedBox(height: 10),
                  PrimaryButtonWidget(
                    onTap: () {},
                    title: 'Register',
                    color: AppColors.primary,
                    backgroundColor: AppColors.background,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
