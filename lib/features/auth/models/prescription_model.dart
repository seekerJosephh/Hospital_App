class Prescription {
  final String hospitalName;
  final String date;
  final String doctor;
  final List<Medicine> medicines;

  Prescription({
    required this.hospitalName,
    required this.date,
    required this.doctor,
    required this.medicines,
  });

  factory Prescription.fromJson(Map<String, dynamic> json) {
    return Prescription(
      hospitalName: json['hospitalName'],
      date: json['date'],
      doctor: json['doctor'],
      medicines: (json['medicine'] as List)
          .map((medicine) => Medicine.fromJson(medicine))
          .toList(),
    );
  }
}

class Medicine {
  final String name;
  final String type;
  final int quantityPerDose;
  final Dosage dosage;
  final String duration;
  final int totalQuantity;

  Medicine({
    required this.name,
    required this.type,
    required this.quantityPerDose,
    required this.dosage,
    required this.duration,
    required this.totalQuantity,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      name: json['name'],
      type: json['type'],
      quantityPerDose: json['quantityPerDose'],
      dosage: Dosage.fromJson(json['dosage']),
      duration: json['duration'],
      totalQuantity: json['totalQuantity'],
    );
  }
}

class Dosage {
  final List<String> frequency;
  final String instructions;

  Dosage({
    required this.frequency,
    required this.instructions,
  });

  factory Dosage.fromJson(Map<String, dynamic> json) {
    return Dosage(
      frequency: List<String>.from(json['frequency']),
      instructions: json['instructions'],
    );
  }
}
