import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../../widgets/button/primary_button_widget.dart';
import '../../home/main_screen.dart';
import '../../services/local_storage_service.dart';

class OtpPhoneWidget extends StatefulWidget {
  final String phone;

  const OtpPhoneWidget({super.key, required this.phone});

  @override
  State<OtpPhoneWidget> createState() => _OtpPhoneWidgetState();
}

class _OtpPhoneWidgetState extends State<OtpPhoneWidget> {
  final List<TextEditingController> controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  String otp = "";

  void onChanged(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      focusNodes[index + 1].requestFocus();
    }

    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }

    otp = controllers.map((e) => e.text).join();
  }

  Future<void> verifyOtp() async {
    if (otp.length != 4) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Enter 4 digit OTP")));

      return;
    }

    await LocalStorageService.setLoggedIn(true);

    Navigator.pushAndRemoveUntil(
      context,

      MaterialPageRoute(builder: (_) => const MainScreen()),

      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),

      child: Column(
        children: [
          const SizedBox(height: 40),

          const Text(
            "Enter the 4-digit verification code (OTP) sent to your phone",
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          Text(
            widget.phone,
            style: const TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 40),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: List.generate(
              4,

              (index) => SizedBox(
                width: 55,
                height: 55,

                child: TextField(
                  controller: controllers[index],

                  focusNode: focusNodes[index],

                  textAlign: TextAlign.center,

                  keyboardType: TextInputType.number,

                  maxLength: 1,

                  decoration: const InputDecoration(
                    counterText: "",
                    border: OutlineInputBorder(),
                  ),

                  onChanged: (value) {
                    onChanged(value, index);
                  },
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),

          SizedBox(
            width: double.infinity,
            height: 52,

            child: PrimaryButtonWidget(title: "Continue", onTap: verifyOtp),
          ),

          const SizedBox(height: 20),

          const Text(
            "Resend in 60 seconds",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
