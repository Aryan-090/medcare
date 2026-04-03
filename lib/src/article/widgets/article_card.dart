import 'package:flutter/material.dart';

import '../article_detail_screen.dart';
import 'article_model.dart';

class ArticleCard extends StatelessWidget {

  final ArticleModel article;

  const ArticleCard({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: (){

        Navigator.push(

          context,

          MaterialPageRoute(

            builder: (_) => ArticleDetailScreen(
              article: article,
            ),
          ),
        );
      },

      child: ClipRRect(

        borderRadius: BorderRadius.circular(12),

        child: Stack(

          children: [

            Image.asset(
              article.image,
              width: 320,
              height: 180,
              fit: BoxFit.cover,
            ),

            Positioned(

              bottom: 12,
              left: 12,

              child: SizedBox(
                width: 220,

                child: Text(
                  article.title,

                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}