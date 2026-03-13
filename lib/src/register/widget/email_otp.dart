import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../../widgets/button/primary_button_widget.dart';
import '../../verification/verification_successfull.dart';

class OtpEmailWidget extends StatelessWidget {
  final String email;

  const OtpEmailWidget({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 40),

          const Text(
            "Enter the 4-digit verification code (OTP) sent to your email",
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          Text(
            email,
            style: const TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 40),

          /// OTP BOXES
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              4,
              (index) => const SizedBox(
                width: 55,
                height: 55,
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  decoration: InputDecoration(
                    counterText: "",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),

          SizedBox(
            width: double.infinity,
            height: 52,
            child: PrimaryButtonWidget(title: "Continue", onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const VerificationSuccess()));
            }),
          ),

          const SizedBox(height: 20),

          const Text(
            "Resend in 60 seconds",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
