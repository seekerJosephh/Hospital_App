import 'package:flutter/material.dart';

class Category {
  final String title;
  final String subtitle;
  final Color color;
  final Color lightColor;

  Category({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.lightColor,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      title: json['title'],
      subtitle: json['subtitle'],
      color: Color(int.parse(json['color'].substring(1, 7), radix: 16) + 0xFF000000),
      lightColor: Color(int.parse(json['lightColor'].substring(1, 7), radix: 16) + 0xFF000000),
    );
  }
}
