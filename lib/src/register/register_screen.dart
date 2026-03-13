import 'package:flutter/material.dart';
import 'package:medcare/src/register/widget/RegisterEmailWidget.dart';
import 'package:medcare/src/register/widget/RegisterPhoneWidget.dart';
import 'package:medcare/utils/app_colors.dart';

import '../../widgets/button/primary_button_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int selectedTab = 0; // 0 = Phone, 1 = Email

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
      ),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Complete Personal Identification",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "You can connect with all healthcare facilities you've previously visited",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryText,
                ),
              ),
              const SizedBox(height: 20),
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
                              color:
                                  selectedTab == 0
                                      ? AppColors.primary
                                      : Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            height: 2,
                            color:
                                selectedTab == 0
                                    ? AppColors.primary
                                    : Colors.grey.shade300,
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// EMAIL TAB
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
                              color:
                                  selectedTab == 1
                                      ? AppColors.primary
                                      : Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            height: 2,
                            color:
                                selectedTab == 1
                                    ? AppColors.primary
                                    : Colors.grey.shade300,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              /// SWITCH WIDGET
              Expanded(
                child:
                    selectedTab == 0
                        ? const RegisterPhoneWidget()
                        : const RegisterEmailWidget(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
