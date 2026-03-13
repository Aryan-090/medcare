import 'package:flutter/material.dart';
import 'package:medcare/utils/app_colors.dart';
import 'package:medcare/widgets/button/primary_button_widget.dart';

class VerificationSuccess extends StatelessWidget {
  const VerificationSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),

              Image.asset('assets/img/verification.png'),
              const Center(
                child: Text(
                  'Verification Success',
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const Center(
                child: Text(
                  'Congratulations, your account has been \nverified.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.secondaryText,
                  ),
                ),
              ),

              const SizedBox(height: 100),

              PrimaryButtonWidget(
                onTap: () {},
                title: 'Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}