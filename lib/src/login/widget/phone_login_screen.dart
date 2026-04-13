import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/button/primary_button_widget.dart';
import '../../register/register_screen.dart';
import '../../home/main_screen.dart';
import '../../services/local_storage_service.dart';

class LoginPhoneWidget extends StatefulWidget {
  const LoginPhoneWidget({super.key});

  @override
  State<LoginPhoneWidget> createState() => _LoginPhoneWidgetState();
}

class _LoginPhoneWidgetState extends State<LoginPhoneWidget> {

  final formKey = GlobalKey<FormState>();

  String completePhoneNumber = "";

  /// LOGIN FUNCTION
  Future<void> login() async {

    if(formKey.currentState!.validate()){

      if(completePhoneNumber.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Enter phone number")),
        );
        return;
      }

      /// here you can call API

      /// save login status locally
      await LocalStorageService.setLoggedIn(true);

      /// navigate to home
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
            (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),

      child: Form(

        key: formKey,

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text("No Phone"),

            const SizedBox(height: 8),

            IntlPhoneField(

              initialCountryCode: 'IN',

              decoration: const InputDecoration(
                hintText: "Enter phone number",
                border: OutlineInputBorder(),
              ),

              onChanged: (phone) {
                completePhoneNumber = phone.completeNumber;
              },

              validator: (phone){

                if(phone == null || phone.number.isEmpty){
                  return "Enter phone number";
                }

                if(phone.number.length < 10){
                  return "Invalid phone number";
                }

                return null;
              },

            ),

            const SizedBox(height: 8),

            const Text(
              "Is there an issue with your phone number?",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 13,
              ),
            ),

            const Spacer(),

            SizedBox(

              width: double.infinity,

              height: 52,

              child: PrimaryButtonWidget(

                title: "Login",

                onTap: login,

              ),

            ),

            const SizedBox(height: 10),

            Row(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                const Text(
                  "Don't have a MedCare account yet? ",
                ),

                GestureDetector(

                  onTap: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );

                  },

                  child: const Text(

                    "Sign up",

                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),

                  ),
                ),

              ],
            ),

            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}