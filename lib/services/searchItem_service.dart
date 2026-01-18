import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:hospital/features/auth/models/searchItem_model.dart';

class SearchService {
  Future<List<SearchItem>> loadSearchData() async {
    final jsonString =
        await rootBundle.loadString('lib/assets/jsons/search_data.json');
    final List<dynamic> jsonResponse = json.decode(jsonString);
    return jsonResponse.map((data) => SearchItem.fromJson(data)).toList();
  }
}
