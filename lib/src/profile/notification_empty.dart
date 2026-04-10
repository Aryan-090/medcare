import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widgets/bottomNavigationBar/custom_bottom_nav.dart';

class NotificationEmpty extends StatelessWidget {
  const NotificationEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Text("Notification"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 150,),
                    Image.asset('assets/img/empty_notification.png', width: 160, height: 160),
                    const SizedBox(height: 20),
                    const Text('There is nothing here', style: TextStyle(fontSize: 18, color: AppColors.text)),
                    const SizedBox(height: 10),
                    Text('We will use this space to alert you on\n                orders and promos', style: TextStyle(fontSize: 16, color: AppColors.grey)),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: CustomBottomNav(
                currentIndex: 3,
                onTap: (index) {
                  if (index == 0) {
                    Navigator.pushNamed(context, '/home');
                  } else if (index == 1) {
                    Navigator.pushNamed(context, '/profile');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
