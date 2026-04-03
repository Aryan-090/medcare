class ArticleModel {

  final String title;
  final String author;
  final String date;
  final String image;
  final String description;
  final List<String> tags;

  ArticleModel({
    required this.title,
    required this.author,
    required this.date,
    required this.image,
    required this.description,
    required this.tags,
  });

}