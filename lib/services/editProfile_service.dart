import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:hospital/features/auth/models/editProfile_model.dart';

class PersonalInfoService {
  Future<PersonalInfo> loadPersonalInfo() async {
    final String response =
        await rootBundle.loadString('lib/assets/jsons/eiditProfile_data.json');
    final Map<String, dynamic> data = jsonDecode(response);
    return PersonalInfo.fromJson(data);
  }
}
