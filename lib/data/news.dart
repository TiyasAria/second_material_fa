
class Article {
    Article({
        required this.author,
        required this.title,
        required this.description,
        required this.url,
        required this.urlToImage,
        required this.publishedAt,
        required this.content,
    });

    String author;
    String title;
    String description;
    String url;
    String urlToImage;
    DateTime publishedAt;
    String content;

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        author: json["author"] ?? "Author",
        title: json["title"]?? "title",
        description: json["description"] ?? "desc",
        url: json["url"] ?? "url",
        urlToImage: json["urlToImage"] ?? "https://thealmanian.com/wp-content/uploads/2019/01/product_image_thumbnail_placeholder.png",
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] ?? "Content",
    );
}

