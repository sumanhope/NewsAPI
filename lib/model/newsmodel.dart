class Article {
  final String id; // Unique identifier of the article's source
  final String name; // Name of the article's source
  final String author; // Author of the article
  final String title; // Title of the article
  final String description; // Description of the article
  final String url; // URL link to the article
  final String urlToImage; // URL link to the article's image
  final DateTime publishedAt; // Date and time when the article was published
  final String content; // Full content of the article

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

  // Factory method to create an Article object from JSON data
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['source']['id'] ?? "", // Source ID or empty string if null
      name: json['source']['name'] ?? "", // Source name or empty string if null
      author: json['author'] ?? "", // Author or empty string if null
      title: json['title'] ?? "", // Title or empty string if null
      description: json['description'] ?? "", // Description or empty string if null
      url: json['url'] ?? "", // URL or empty string if null
      urlToImage: json['urlToImage'] ?? "", // URL to image or empty string if null
      publishedAt: DateTime.parse(json['publishedAt'] ?? "unknown"), // Parse DateTime or default to "unknown"
      content: json['content'] ?? "", // Content or empty string if null
    );
  }

  // Factory method to create an Article object from JSON for favorites
  factory Article.favJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'] ?? "", // ID or empty string if null
      name: json['name'] ?? "", // Name or empty string if null
      author: json['author'] ?? "", // Author or empty string if null
      title: json['title'] ?? "", // Title or empty string if null
      description: json['description'] ?? "", // Description or empty string if null
      url: json['url'] ?? "", // URL or empty string if null
      urlToImage: json['urlToImage'] ?? "", // URL to image or empty string if null
      publishedAt: DateTime.parse(json['publishedAt'] ?? "unknown"), // Parse DateTime or default to "unknown"
      content: json['content'] ?? "", // Content or empty string if null
    );
  }

  // Convert Article object to JSON format
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
      'publishedAt': publishedAt.toIso8601String(), // Convert DateTime to ISO 8601 string format
    };
  }

  // Check if the article has valid data
  bool isValid() {
    return author.isNotEmpty && // Author should not be empty or '[Removed]'
        author != '[Removed]' &&
        title.isNotEmpty && // Title should not be empty or '[Removed]'
        title != '[Removed]' &&
        description.isNotEmpty && // Description should not be empty or '[Removed]'
        description != '[Removed]' &&
        content.isNotEmpty && // Content should not be empty or '[Removed]'
        content != '[Removed]' &&
        urlToImage.isNotEmpty && // URL to image should not be empty or '[Removed]'
        urlToImage != '[Removed]';
  }
}
