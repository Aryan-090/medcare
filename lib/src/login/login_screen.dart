import 'package:flutter/material.dart';
import 'package:medcare/src/login/widget/email_login_screen.dart';
import 'package:medcare/src/login/widget/phone_login_screen.dart';

import '../../utils/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        elevation: 0,
      ),
      body: Column(
          children: [
            const SizedBox(height: 10),

      const Text(
        "Enter your phone number or email",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),

      const SizedBox(height: 20),

      /// TAB SWITCH
      Row(
        children: [

          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedTab = 0;
                });
              },
              child: Column(
                children: [
                  Text(
                    "No Phone",
                    style: TextStyle(
                      color: selectedTab == 0
                          ? AppColors.primary
                          : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    height: 2,
                    color: selectedTab == 0
                        ? AppColors.primary
                        : Colors.grey.shade300,
                  )
                ],
              ),
            ),
          ),

          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedTab = 1;
                });
              },
              child: Column(
                children: [
                  Text(
                    "Email",
                    style: TextStyle(
                      color: selectedTab == 1
                          ? AppColors.primary
                          : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    height: 2,
                    color: selectedTab == 1
                        ? AppColors.primary
                        : Colors.grey.shade300,
                  )
                ],
              ),
            ),
          ),
        ],
      ),

      const SizedBox(height: 20),

      Expanded(
        child: selectedTab == 0
            ? const LoginPhoneWidget()
            : const LoginEmailWidget(),
      )
      ],
    ),
    );

  }
}
