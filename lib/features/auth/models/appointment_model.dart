// appointment_model.dart

class Appointment {
  final String date;
  final String day;
  final String time;
  final String doctor;
  final String appointmentType;

  Appointment({
    required this.date,
    required this.day,
    required this.time,
    required this.doctor,
    required this.appointmentType,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      date: json['date'],
      day: json['day'],
      time: json['time'],
      doctor: json['doctor'],
      appointmentType: json['appointmentType'],
    );
  }
}
