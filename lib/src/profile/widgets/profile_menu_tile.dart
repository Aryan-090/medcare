import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';

class ProfileMenuTile extends StatelessWidget {

  final IconData icon;
  final String title;
  final String? subtitle;
  final Function()? onTap;

  const ProfileMenuTile({

    super.key,

    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap,

  });

  @override
  Widget build(BuildContext context) {

    return ListTile(

      leading: Icon(
        icon,
        color: AppColors.primary,
      ),

      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),

      subtitle: subtitle == null
          ? null
          : Text(
        subtitle!,
        style: const TextStyle(fontSize: 12),
      ),

    );

  }

}