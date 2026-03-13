import 'package:flutter/material.dart';
import 'package:medcare/src/register/widget/email_otp.dart';
import 'package:medcare/src/register/widget/phone_otp.dart';

class OtpScreen extends StatelessWidget {
  final bool isPhone;
  final String value;

  const OtpScreen({super.key, required this.isPhone, required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        leading: const BackButton(),
      ),

      body:
          isPhone ? OtpPhoneWidget(phone: value) : OtpEmailWidget(email: value),
    );
  }
}
