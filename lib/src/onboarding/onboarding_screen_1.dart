import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../widgets/button/primary_button_widget.dart';
import '../splash/widgets/splash_screen_1.dart';
import 'widgets/onboarding_common.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final PageController _controller = PageController();
  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/img/walkthrough_1.png",
      "title": "Online Consultation",
      "desc":
      "Connect with healthcare professionals virtually for convenient medical advice and support."
    },
    {
      "image": "assets/img/walkthrough_2.png",
      "title": "24 Hours Ready to Serve",
      "desc":
      "Instant access to expert medical assistance. Get the care you need, when you need it, with our app."
    },
    {
      "image": "assets/img/walkthrough_3.png",
      "title": "Medical Record Data Patient",
      "desc":
      "Easily manage and access comprehensive health records, including medical history, test result, and treatement plans, all in one secure place."
    },
  ];

  void nextPage() {
    _controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            /// TOP PART SLIDES
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPage(
                    image: onboardingData[index]["image"]!,
                    title: onboardingData[index]["title"]!,
                    description: onboardingData[index]["desc"]!,
                  );
                },
              ),
            ),

            /// DOT INDICATOR
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                    (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: currentPage == index ? 10 : 6,
                  height: currentPage == index ? 10 : 6,
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? AppColors.primary
                        : AppColors.circleBackground,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// FIXED PRIMARY BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: PrimaryButtonWidget(
                  title: currentPage == 2 ? "Start" : "Next",
                  radius: 30,
                  onTap: () {

                    if (currentPage == 2) {
                      /// LAST PAGE → Navigate
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SplashScreen1(),
                        ),
                      );
                    } else {
                      /// NOT LAST PAGE → Go to next onboarding
                      nextPage();
                    }

                  },
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}