class WelcomeModel {
  final String title;
  final String description;
  final String imageUrl;

  WelcomeModel({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  factory WelcomeModel.fromJson(Map<String, dynamic> json) {
    return WelcomeModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }
}
