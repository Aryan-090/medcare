import 'package:flutter/material.dart';
import 'package:medcare/src/onboarding/onboarding_screen_1.dart';
import 'package:medcare/src/register/otp_screen.dart';
import 'package:medcare/src/register/register_screen.dart';
import 'package:medcare/src/register/widget/phone_otp.dart';
import 'package:medcare/src/splash/splash_screen.dart';
import 'package:medcare/src/splash/widgets/splash_screen_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medcare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'MedCare'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return const OnboardingScreen();
  }
}
