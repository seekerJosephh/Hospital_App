class PersonalInfo {
  final String fullNameEnglish;
  final String fullNameKhmer;
  final String email;
  final String phoneNumber;
  final String id;
  final String driverID;
  final String dob;
  final String address;
  final String height;
  final String weight;

  PersonalInfo({
    required this.fullNameEnglish,
    required this.fullNameKhmer,
    required this.email,
    required this.phoneNumber,
    required this.id,
    required this.driverID,
    required this.dob,
    required this.address,
    required this.height,
    required this.weight,
  });

  factory PersonalInfo.fromJson(Map<String, dynamic> json) {
    return PersonalInfo(
      fullNameEnglish: json['fullNameEnglish'],
      fullNameKhmer: json['fullNameKhmer'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      id: json['id'],
      driverID: json['driverID'],
      dob: json['dob'],
      address: json['address'],
      height: json['height'],
      weight: json['weight'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullNameEnglish': fullNameEnglish,
      'fullNameKhmer': fullNameKhmer,
      'email': email,
      'phoneNumber': phoneNumber,
      'id': id,
      'driverID': driverID,
      'dob': dob,
      'address': address,
      'height': height,
      'weight': weight,
    };
  }
}
