import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

import 'widgets/profile_header.dart';
import 'widgets/profile_menu_section.dart';
import 'widgets/logout_button.dart';

class ProfileScreen extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const ProfileScreen({
    super.key,

    required this.currentIndex,

    required this.onTap,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 10),

              /// header
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      widget.onTap(0); // go back home tab
                    },

                    icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                  ),

                  const SizedBox(width: 10),

                  const Text(
                    "My Profile",

                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              const ProfileHeader(),

              const SizedBox(height: 18),

              const Text(
                "Menu",

                style: TextStyle(color: AppColors.disableText),
              ),

              const SizedBox(height: 10),

              const ProfileMenuSection(),

              const SizedBox(height: 18),

              const Text(
                "General Information",

                style: TextStyle(color: AppColors.disableText),
              ),

              const SizedBox(height: 10),

              ProfileSettingsSection(
                darkMode: darkMode,

                onDarkModeChanged: (value) {
                  setState(() {
                    darkMode = value;
                  });
                },
              ),

              const SizedBox(height: 20),

              const LogoutButton(),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
