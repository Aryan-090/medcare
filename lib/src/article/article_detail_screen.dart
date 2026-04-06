import 'package:flutter/material.dart';
import 'package:medcare/src/article/widgets/article_description_widget.dart';
import 'package:medcare/src/article/widgets/article_model.dart';
import 'widgets/tag_chip.dart';

class ArticleDetailScreen extends StatelessWidget {
  final ArticleModel article;

  const ArticleDetailScreen({super.key, required this.article});

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
                onPressed: () => Navigator.pop(context),
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

                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),

              const SizedBox(height: 14),

              ClipRRect(
                borderRadius: BorderRadius.circular(12),

                child: Image.asset(
                  //'assets/articles/virus.png',
                  article.image,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 14),

              const ArticleDescriptionWidget(
                title: 'Title:',
                subtitle:
                    'Understanding Hanta Virus Disease: Risks, Symptoms, and Prevention Measures from Rodents',
              ),
              const SizedBox(height: 15),
              const ArticleDescriptionWidget(
                title: 'Introduction:',
                subtitle:
                    'Hanta virus disease, transmitted primarily through contact with rodent urine, droppings, or saliva, poses a significant health threat to humans worldwide. This article aims to provide an overview of Hanta virus disease, its potential risks, common symptoms, and essential prevention measures.',
              ),
              const SizedBox(height: 15),
              const ArticleDescriptionWidget(
                title: 'What is Hanta Virus Disease?',
                subtitle:
                    'Hanta virus disease is a rare but potentially deadly viral infection caused by several strains of hantaviruses. These viruses are typically carried by rodents, such as mice, rats, and voles, and can be transmitted to humans through inhalation of airborne particles contaminated with rodent excreta.',
              ),
              const SizedBox(height: 15),
              const ArticleDescriptionWidget(
                title: 'Understanding the Risk:',
                subtitle:
                    'Individuals who live or work in areas with high rodent populations, such as rural or semi-rural environments, are at an increased risk of contracting Hanta virus disease. Activities that involve disturbing rodent habitats, such as cleaning barns, sheds, or attics, can also elevate the risk of exposure.',
              ),
              const SizedBox(height: 15),
              const ArticleDescriptionWidget(
                title: 'Conmmon Symptoms:',
                subtitle:
                    'The symptoms of Hanta virus disease can vary widely but often include flu-like symptoms such as fever, muscle aches, headaches, and fatigue. As the disease progresses, individuals may experience respiratory symptoms such as coughing and shortness of breath, which can rapidly escalate to severe respiratory distress and potentially fatal complications.',
              ),

              const SizedBox(height: 20),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tags:",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),

                  SizedBox(width: 6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        children: [
                           TagChip(label: "Content-healthy"),

                           SizedBox(width: 8),

                           TagChip(label: "Healthcare"),
                        ],
                      ),

                       SizedBox(height: 8),

                       TagChip(label: "healthy-environment"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
