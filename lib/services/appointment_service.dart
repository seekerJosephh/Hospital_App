// appointment_service.dart

import 'dart:convert';
import 'package:flutter/services.dart'; // for loading assets
import 'package:hospital/features/auth/models/appointment_model.dart';

class AppointmentService {
  // Method to fetch appointment data from a mock JSON
  Future<List<Appointment>> fetchAppointments() async {
    // Mock data as a string (you can replace this with a file if needed)
    String jsonString = await rootBundle
        .loadString('lib/assets/jsons/upcommingAppointment.json');

    // Decode the JSON data
    List<dynamic> jsonResponse = jsonDecode(jsonString);

    // Map the decoded data to Appointment objects
    return jsonResponse
        .map((appointmentData) => Appointment.fromJson(appointmentData))
        .toList();
  }
}
