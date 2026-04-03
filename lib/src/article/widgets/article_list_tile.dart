import 'package:flutter/material.dart';
import '../article_detail_screen.dart';
import 'article_model.dart';

class ArticleListTile extends StatelessWidget {

  final ArticleModel article;

  const ArticleListTile({
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
            builder: (_) => ArticleDetailScreen(article: article),
          ),
        );
      },

      child: Container(

        margin: const EdgeInsets.only(bottom: 14),

        child: Row(

          children: [

            ClipRRect(

              borderRadius: BorderRadius.circular(8),

              child: Image.asset(
                article.image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 10),

            Expanded(

              child: Text(
                article.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

          ],
        ),
      ),
    );
  }
}