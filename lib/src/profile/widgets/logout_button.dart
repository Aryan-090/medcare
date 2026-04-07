import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {

  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(

      margin: const EdgeInsets.only(bottom: 10),

      width: double.infinity,

      child: OutlinedButton(

        onPressed: (){},

        style: OutlinedButton.styleFrom(

          side: BorderSide(
            color: Colors.green.shade200,
          ),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),

        ),

        child: const Text(

          "Log Out",

          style: TextStyle(
            color: Colors.red,
          ),

        ),

      ),

    );

  }

}