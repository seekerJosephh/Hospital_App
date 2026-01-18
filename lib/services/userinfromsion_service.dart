// lib/utils/data_loader.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:hospital/features/auth/models/userinformation_model.dart';

Future<List<UserinformationModel>> loadUserinformationData() async {
  try {
    final String response =
        await rootBundle.loadString('lib/assets/jsons/userInfomaiondata.json');
    final List<dynamic> jsonData = jsonDecode(response);
    return jsonData.map((data) => UserinformationModel.fromJson(data)).toList();
  } catch (e) {
    throw Exception("Failed to load JSON data: $e");
  }
}
