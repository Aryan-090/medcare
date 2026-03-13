import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/button/primary_button_widget.dart';
import '../../register/register_screen.dart';
import '../../verification/verification_successfull.dart';

class LoginPhoneWidget extends StatelessWidget {
  const LoginPhoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("No Phone"),

          const SizedBox(height: 8),

          const IntlPhoneField(
            initialCountryCode: 'IN',
            decoration: InputDecoration(
              hintText: "Enter phone number",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            "Is there an issue with your phone number?",
            style: TextStyle(color: AppColors.primary, fontSize: 13),
          ),

          const Spacer(),

          SizedBox(
            width: double.infinity,
            height: 52,
            child: PrimaryButtonWidget(title: "Login", onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const VerificationSuccess()));
            }),
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have a MedCare account yet? "),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const RegisterScreen()));
                },
                child: const Text(
                  "Sign up",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
