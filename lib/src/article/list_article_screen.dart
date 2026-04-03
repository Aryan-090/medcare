import 'package:flutter/material.dart';
import 'package:medcare/src/article/widgets/article_model.dart';
import '../../utils/app_colors.dart';

import '../../widgets/bottomNavigationBar/custom_bottom_nav.dart';
import 'widgets/article_card.dart';
import 'widgets/topic_card.dart';
import 'widgets/article_list_tile.dart';
import 'widgets/category_chip.dart';
import 'widgets/search_bar_widget.dart';

class ListArticleScreen extends StatefulWidget {
  const ListArticleScreen({super.key});

  @override
  State<ListArticleScreen> createState() => _ListArticleScreenState();
}

class _ListArticleScreenState extends State<ListArticleScreen> {

  int currentIndex = 0;

  List<ArticleModel> articles = [

    ArticleModel(
      title: "5 Tips for Boosting Your Immune System Naturally",
      author: "Leonard",
      date: "Jan 10, 2024",
      image: "assets/articles/article_image.png",
      description:
      "Hanta virus disease, transmitted primarily through contact with rodent urine, droppings, or saliva, poses a significant health threat to humans worldwide. This article aims to provide an overview of Hanta virus disease, its potential risks, common symptoms, and essential prevention measures.",
      tags: ["Content-healthy","Healthcare","healthy-environment"],
    ),

    ArticleModel(
      title: "Mental Health Tips for Better Lifestyle",
      author: "Dr Smith",
      date: "Feb 2, 2024",
      image: "assets/articles/article2.png",
      description:
      "Mental health plays a vital role in overall well-being. Practicing mindfulness and maintaining a healthy routine can improve life quality.",
      tags: ["Mental Health"],
    ),

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppColors.background,

      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        onTap: (index){
          setState(() => currentIndex = index);
        },
      ),

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(16),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              const SearchBarWidget(),

              const SizedBox(height: 20),

              const Text(
                "Hot Article",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 180,

                child: ListView.builder(

                  scrollDirection: Axis.horizontal,

                  itemCount: articles.length,

                  itemBuilder: (_, index){

                    return Padding(
                      padding: const EdgeInsets.only(right: 12),

                      child: ArticleCard(
                        article: articles[index],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Hot Topic",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 12),

              const SizedBox(
                height: 80,

                child: Row(

                  children: [

                    TopicCard(title: "Mental Health"),

                    SizedBox(width: 12),

                    TopicCard(title: "Lifestyle"),

                    SizedBox(width: 12),

                    TopicCard(title: "Covid-19"),

                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Latest Article",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 12),

              const Row(

                children: [

                  CategoryChip(title: "All Article", selected: true),

                  SizedBox(width: 8),

                  CategoryChip(title: "Adults"),

                  SizedBox(width: 8),

                  CategoryChip(title: "Infants and Toddlers"),

                ],
              ),

              const SizedBox(height: 20),

              ArticleListTile(article: articles[0]),
              ArticleListTile(article: articles[1]),

            ],
          ),
        ),
      ),
    );
  }
}