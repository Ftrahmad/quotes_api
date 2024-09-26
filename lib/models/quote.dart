class Quote {
  final String content;
  final String author;
  String? translatedContent;
  String? translatedAuthor;

  Quote({
    required this.content,
    required this.author,
    this.translatedContent,
    this.translatedAuthor,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      content: json['quote'],
      author: json['author'],
    );
  }
}