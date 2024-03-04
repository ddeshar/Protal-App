class NewsModel {
  String category;
  String title;
  String body;
  String image;

  NewsModel({
    required this.category,
    required this.title,
    required this.body,
    required this.image,
  });

  factory NewsModel.fromMap(Map<String, dynamic> json) => NewsModel(
    category: json["category"],
    title: json["title"],
    body: json["body"],
    image: json["image"],
  );
}
