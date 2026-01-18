import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:hospital/features/auth/models/billpayment_model.dart';

class BillService {
  Future<List<BillpaymentModel>> fetchBills() async {
    final String response =
        await rootBundle.loadString('lib/assets/jsons/billpayment_data.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => BillpaymentModel.fromJson(json)).toList();
  }
}
