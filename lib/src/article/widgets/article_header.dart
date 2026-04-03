import 'package:flutter/material.dart';

class ArticleHeader extends StatelessWidget {
  const ArticleHeader({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Row(

          children: [

            IconButton(

              onPressed: () => Navigator.pop(context),

              icon: const Icon(Icons.arrow_back_ios_new, size: 18),
            ),

          ],
        ),

        const SizedBox(height: 6),

        const Text(

          "Getting to know Hanta Virus Disease from Rodents",

          style: TextStyle(

            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 4),

        const Text(

          "Written by Leonard on January 10, 2024",

          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),

      ],
    );
  }
}