import 'package:flutter/material.dart';

class TopicCard extends StatelessWidget {

  final String title;
  final AssetImage image;


  const TopicCard({
    super.key,
    required this.title,
    required this.image
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      width: 140,

      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(10),

        image: DecorationImage(

          image: image,

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