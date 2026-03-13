import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/button/primary_button_widget.dart';
import '../../login/login_screen.dart';
import '../otp_screen.dart';
import '../../splash/widgets/splash_screen_1.dart';

class RegisterPhoneWidget extends StatefulWidget {
  const RegisterPhoneWidget({super.key});

  @override
  State<RegisterPhoneWidget> createState() => _RegisterPhoneWidgetState();
}

class _RegisterPhoneWidgetState extends State<RegisterPhoneWidget> {
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final phoneController = TextEditingController();

  String phoneNumber = '';
  String? gender;
  bool agree = false;

  Future<void> pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      dobController.text =
          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// PHONE
          const Text("Phone Number*"),

          const SizedBox(height: 8),

          IntlPhoneField(
            initialCountryCode: 'IN',
            decoration: const InputDecoration(
              hintText: "Enter phone number",
              border: OutlineInputBorder(),
            ),
            onChanged: (phone) {
              setState(() {
                phoneNumber = phone.completeNumber;
              });
            },
          ),

          const SizedBox(height: 20),

          /// FULL NAME
          const Text("Full name"),
          const SizedBox(height: 8),

          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: "Enter your full name",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 20),

          /// GENDER
          const Text("Gender"),
          const SizedBox(height: 8),

          DropdownButtonFormField<String>(
            hint: const Text("Choose your gender"),
            value: gender,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            items: const [
              DropdownMenuItem(value: "Male", child: Text("Male")),
              DropdownMenuItem(value: "Female", child: Text("Female")),
              DropdownMenuItem(value: "Other", child: Text("Other")),
            ],
            onChanged: (value) {
              setState(() {
                gender = value;
              });
            },
          ),

          const SizedBox(height: 20),

          /// DOB
          const Text("Date of birth"),
          const SizedBox(height: 8),

          TextField(
            controller: dobController,
            readOnly: true,
            onTap: pickDate,
            decoration: const InputDecoration(
              hintText: "Enter your date of birth",
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.calendar_today),
            ),
          ),

          const SizedBox(height: 10),

          /// CHECKBOX
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: agree,
                onChanged: (value) {
                  setState(() {
                    agree = value!;
                  });
                },
              ),

              const Expanded(
                child: Text(
                  "You agree to receive information and notifications sent by MedCare",
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          /// REGISTER BUTTON
          SizedBox(
            width: double.infinity,
            height: 52,
            child: PrimaryButtonWidget(
              title: "Register",
              onTap: () {
                if (phoneNumber.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OtpScreen(
                        isPhone: true,
                        value: phoneNumber,
                      ),
                    ),
                  );
                } else {
                  // Show error or something
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please enter a phone number")),
                  );
                }
              },
            ),
          ),

          const SizedBox(height: 20),

          /// LOGIN TEXT
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Already have an account? "),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Click here to login",
                  style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
