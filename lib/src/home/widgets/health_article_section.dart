import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';

class HealthArticleSection extends StatelessWidget {
  const HealthArticleSection({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> articles = [
      {
        "image": "assets/articles/article1.png",
        "category": "Disease Prevention",
        "title":
        "Understanding Vaccination, The Importance of Preventative Medicine",
        "date": "14 - Jun - 2023",
      },
      {
        "image": "assets/articles/article2.png",
        "category": "Healthy Lifestyle",
        "title":
        "Turning Bad Habits into Healthy Habits: Tips for Living Better",
        "date": "14 - Jun - 2023",
      },
      {
        "image": "assets/articles/article2.png",
        "category": "Healthy Lifestyle",
        "title":
        "Turning Bad Habits into Healthy Habits: Tips for Living Better",
        "date": "14 - Jun - 2023",
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// TITLE
        Text(
          "Health Article",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 12),

        /// LIST
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: articles.length,
          itemBuilder: (context, index) {
            final item = articles[index];

            return _ArticleItem(
              image: item["image"]!,
              category: item["category"]!,
              title: item["title"]!,
              date: item["date"]!,
            );
          },
        ),
      ],
    );
  }
}

/// PRIVATE ITEM WIDGET
class _ArticleItem extends StatelessWidget {
  final String image;
  final String category;
  final String title;
  final String date;

  const _ArticleItem({
    required this.image,
    required this.category,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric( vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          /// TEXT CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// CATEGORY
                Text(
                  category,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.secondaryText,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 4),

                /// TITLE
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.text,
                  ),
                ),

                const SizedBox(height: 6),

                /// DATE
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.secondaryText,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}