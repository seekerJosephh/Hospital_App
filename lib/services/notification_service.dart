import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:hospital/features/auth/models/notification_model.dart';

class NotificationService {
  Future<List<NotificationItem>> loadNotifications() async {
    final jsonString =
        await rootBundle.loadString('lib/assets/jsons/notificationData.json');

    final List<dynamic> jsonResponse = json.decode(jsonString);

    return jsonResponse.map((data) => NotificationItem.fromJson(data)).toList();
  }
}
