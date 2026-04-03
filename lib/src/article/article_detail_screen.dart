import 'package:flutter/material.dart';
import 'package:medcare/src/article/widgets/article_model.dart';
import 'widgets/tag_chip.dart';

class ArticleDetailScreen extends StatelessWidget {

  final ArticleModel article;

  const ArticleDetailScreen({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(16),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              IconButton(
                onPressed: ()=> Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new),
              ),

              const SizedBox(height: 6),

              Text(
                article.title,

                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                "Written by ${article.author} on ${article.date}",

                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 14),

              ClipRRect(

                borderRadius: BorderRadius.circular(12),

                child: Image.asset(
                  article.image,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 14),

              Text(
                article.description,

                style: const TextStyle(
                  fontSize: 13,
                  height: 1.6,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 20),

              Wrap(

                spacing: 8,

                children: article.tags
                    .map((e) => TagChip(title: e))
                    .toList(),
              ),

            ],
          ),
        ),
      ),
    );
  }
}