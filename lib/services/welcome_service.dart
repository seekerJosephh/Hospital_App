import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:hospital/features/auth/models/welcome_model.dart';

Future<List<WelcomeModel>> loadWelcomeData() async {
  try {
    final String response =
        await rootBundle.loadString('lib/assets/jsons/welcome_data.json');
    final List<dynamic> jsonData = jsonDecode(response);
    return jsonData.map((data) => WelcomeModel.fromJson(data)).toList();
  } catch (e) {
    throw Exception("Failed to load JSON data: $e");
  }
}
