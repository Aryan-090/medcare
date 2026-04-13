import 'package:flutter/material.dart';
import 'package:medcare/utils/app_colors.dart';
import '../../../widgets/button/primary_button_widget.dart';
import '../../register/register_screen.dart';
import '../../home/main_screen.dart';
import '../../services/local_storage_service.dart';

class LoginEmailWidget extends StatefulWidget {
  const LoginEmailWidget({super.key});

  @override
  State<LoginEmailWidget> createState() => _LoginEmailWidgetState();
}

class _LoginEmailWidgetState extends State<LoginEmailWidget> {

  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  /// LOGIN FUNCTION
  Future<void> login() async {

    if(formKey.currentState!.validate()){

      /// here you can call API

      /// save login status locally
      await LocalStorageService.setLoggedIn(true);

      /// navigate to home screen
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

            const Text("Email"),

            const SizedBox(height: 8),

            TextFormField(

              controller: emailController,

              keyboardType: TextInputType.emailAddress,

              decoration: const InputDecoration(
                hintText: "Enter your email",
                border: OutlineInputBorder(),
              ),

              validator: (value){

                if(value == null || value.isEmpty){
                  return "Please enter email";
                }

                if(!RegExp(r'\S+@\S+\.\S+').hasMatch(value)){
                  return "Enter valid email";
                }

                return null;
              },

            ),

            const SizedBox(height: 8),

            const Text(
              "Is there an issue with your email?",
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