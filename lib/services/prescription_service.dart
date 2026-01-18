import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hospital/features/auth/models/prescription_model.dart';

class PrescriptionService {
  Future<List<Prescription>> fetchPrescriptions() async {
    try {
      final String response = await rootBundle
          .loadString('lib/assets/jsons/prescription_data.json');
      final List<dynamic> data = json.decode(response);
      return data.map((json) => Prescription.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Failed to load prescriptions: $e");
    }
  }
}
