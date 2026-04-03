import 'package:flutter/material.dart';

class TopicCard extends StatelessWidget {

  final String title;

  const TopicCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      width: 120,

      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(10),

        image: const DecorationImage(

          image: AssetImage("assets/articles/topic.png"),

          fit: BoxFit.cover,
        ),
      ),

      alignment: Alignment.center,

      child: Text(

        title,

        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}