import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hospital/core/constants/app_colors.dart';

class AppointmentsScreen extends StatefulWidget {
  @override
  _AppointmentsScreenState createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  bool isCurrentTab = true;
  List<dynamic> currentAppointments = [];
  List<dynamic> historyAppointments = [];

  @override
  void initState() {
    super.initState();
    loadAppointments();
  }

  Future<void> loadAppointments() async {
    final String response =
        await rootBundle.loadString('lib/assets/jsons/appointment.json');
    final data = jsonDecode(response);
    setState(() {
      currentAppointments = data['currentAppointments'];
      historyAppointments = data['historyAppointments'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Appointments",
          style: TextStyle(color: AppColors.text),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.text),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: Column(
        children: [
          // Tab Section
          Container(
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TabButton(
                  label: "Current",
                  isActive: isCurrentTab,
                  onTap: () {
                    setState(() {
                      isCurrentTab = true;
                    });
                  },
                ),
                TabButton(
                  label: "History",
                  isActive: !isCurrentTab,
                  onTap: () {
                    setState(() {
                      isCurrentTab = false;
                    });
                  },
                ),
              ],
            ),
          ),
          // Appointment List Section
          Expanded(
            child: ListView(
              children:
                  (isCurrentTab ? currentAppointments : historyAppointments)
                      .map((appointment) =>
                          AppointmentCard(appointment: appointment))
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// Tab Button Widget
class TabButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  TabButton({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? AppColors.primary : AppColors.secondary,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

// Appointment Card Widget
class AppointmentCard extends StatelessWidget {
  final Map<String, dynamic> appointment;

  AppointmentCard({required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            // Date Section
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    appointment['date'],
                    style: TextStyle(
                      color: AppColors.text,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    appointment['day'],
                    style: TextStyle(
                      color: AppColors.text,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            // Appointment Details Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appointment['time'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(appointment['doctor']),
                  SizedBox(height: 4),
                  Text(appointment['appointmentType']),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
