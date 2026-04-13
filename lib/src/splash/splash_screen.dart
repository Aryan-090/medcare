import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medcare/src/splash/widgets/splash_screen_1.dart';

import '../home/main_screen.dart';
import '../login/login_screen.dart';
import '../onboarding/onboarding_screen_1.dart';
import '../services/local_storage_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  Future<void> navigate() async {
    await Future.delayed(const Duration(seconds: 2));

    bool firstTime = await LocalStorageService.isFirstTime();
    bool loggedIn = await LocalStorageService.isLoggedIn();

    /// FIRST TIME OPEN APP
    if (firstTime) {
      Navigator.pushReplacement(
        context,

        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );

      return;
    }

    /// ALREADY LOGIN
    if (loggedIn) {
      Navigator.pushReplacement(
        context,

        MaterialPageRoute(builder: (_) => const MainScreen()),
      );
    }
    /// NOT LOGIN
    else {
      Navigator.pushReplacement(
        context,

        MaterialPageRoute(builder: (_) => const SplashScreen1()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,

          width: double.infinity,

          decoration: const BoxDecoration(color: Color(0xFF26408B)),

          child: Center(child: Image.asset("assets/img/splash_logo.png")),
        ),
      ),
    );
  }
}
