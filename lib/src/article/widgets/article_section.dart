import 'package:flutter/material.dart';

class ArticleSection extends StatelessWidget {

  final String title;
  final String content;

  const ArticleSection({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(

      padding: const EdgeInsets.only(bottom: 14),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Text(

            title,

            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 6),

          Text(

            content,

            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              height: 1.5,
            ),
          ),

        ],
      ),
    );
  }
}