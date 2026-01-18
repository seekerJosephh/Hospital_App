import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hospital/features/auth/models/home_category_model.dart';

class CategoryService {
  static Future<List<Category>> loadCategories() async {
    final String response =
        await rootBundle.loadString('lib/assets/jsons/mock_category_data.json');
    final List<dynamic> data = jsonDecode(response);
    return data.map((json) => Category.fromJson(json)).toList();
  }
}
