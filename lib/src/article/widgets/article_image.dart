import 'package:flutter/material.dart';

class ArticleImage extends StatelessWidget {
  const ArticleImage({super.key});

  @override
  Widget build(BuildContext context) {

    return ClipRRect(

      borderRadius: BorderRadius.circular(12),

      child: Image.asset(

        "assets/articles/hanta_virus.png",

        height: 150,
        width: double.infinity,

        fit: BoxFit.cover,
      ),
    );
  }
}