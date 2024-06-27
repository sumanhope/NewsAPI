class Article {
  final String id;
  final String name;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  Article({
    required this.id,
    required this.name,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['source']['id'] ?? "",
      name: json['source']['name'] ?? "",
      author: json['author'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      url: json['url'] ?? "",
      urlToImage: json['urlToImage'] ?? "",
      publishedAt: DateTime.parse(json['publishedAt'] ?? "unkown"),
      content: json['content'] ?? "",
    );
  }
  factory Article.favJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      author: json['author'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      url: json['url'] ?? "",
      urlToImage: json['urlToImage'] ?? "",
      publishedAt: DateTime.parse(json['publishedAt'] ?? "unkown"),
      content: json['content'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'content': content,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt.toIso8601String(),
    };
  }

  bool isValid() {
    return author.isNotEmpty &&
        author != '[Removed]' &&
        title.isNotEmpty &&
        title != '[Removed]' &&
        description.isNotEmpty &&
        description != '[Removed]' &&
        content.isNotEmpty &&
        content != '[Removed]' &&
        urlToImage.isNotEmpty &&
        urlToImage != '[Removed]';
  }
}
