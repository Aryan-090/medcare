import 'package:flutter/material.dart';
import 'package:medcare/src/profile/transaction_screen.dart';
import '../../../utils/app_colors.dart';
import '../account_setting_screen.dart';
import '../health_history_screen.dart';
import '../notification_empty.dart';
import '../notification_screen.dart';
import '../prescription_history_screen.dart';
import 'profile_menu_tile.dart';

class ProfileMenuSection extends StatelessWidget {
  const ProfileMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PrescriptionHistoryScreen(),
                ),
              );
            },
            child: const ProfileMenuTile(
              icon: Icons.description_outlined,

              title: "Prescription History",

              subtitle: "Check out the full prescription history here",
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HealthHistoryScreen(),
                ),
              );
            },
            child: const ProfileMenuTile(
              icon: Icons.favorite_border,

              title: "Health History",

              subtitle: "Check details regarding your medical history",
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TransactionScreen(),
                ),
              );
            },
            child: const ProfileMenuTile(
              icon: Icons.account_balance_wallet_outlined,

              title: "Transactions",

              subtitle: "Look back at your previous transactions",
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileSettingsSection extends StatelessWidget {
  final bool darkMode;
  final Function(bool) onDarkModeChanged;

  const ProfileSettingsSection({
    super.key,

    required this.darkMode,
    required this.onDarkModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccountSettingScreen(),
                ),
              );
            },
            child: const ProfileMenuTile(
              icon: Icons.settings_outlined,
              title: "Account Settings",
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationEmpty(),
                ),
              );
            },
            child: const ProfileMenuTile(
              icon: Icons.notifications_none,
              title: "Notifications",
            ),
          ),

          const ProfileMenuTile(
            icon: Icons.badge_outlined,
            title: "Reference Settings",
          ),

          SwitchListTile(
            value: darkMode,

            onChanged: onDarkModeChanged,

            title: const Text("Dark Mode"),

            secondary: const Icon(
              Icons.dark_mode_outlined,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
