import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class AccountSettingScreen extends StatefulWidget {
  const AccountSettingScreen({super.key});

  @override
  State<AccountSettingScreen> createState() => _AccountSettingScreenState();
}

class _AccountSettingScreenState extends State<AccountSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Account Settings"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        backgroundColor: AppColors.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Password',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 44,
              width: 372,
              decoration: BoxDecoration(
                color: AppColors.greyContainer,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.green),
              ),
              child: const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter your new password',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const SettingCard(title: 'Language', language: 'English'),
            const SizedBox(height: 20),
            const SettingCard(
              title: 'Privacy Settings',
              language: 'Information Privacy',
            ),
          ],
        ),
      ),
    );
  }
}

class SettingCard extends StatelessWidget {
  final String title;
  final String language;

  const SettingCard({super.key, required this.title, required this.language});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 44,
          width: 372,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.greyContainer,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.green),
          ),
          child: Row(
            children: [
              Text(
                language,
                style: TextStyle(fontSize: 14, color: AppColors.black),
              ),
              const Spacer(),
              if (title == 'Language') ...[
                const Icon(Icons.keyboard_arrow_down, size: 16),
              ] else if (title == 'Privacy Settings') ...[
                const Icon(Icons.arrow_forward_ios, size: 12),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
