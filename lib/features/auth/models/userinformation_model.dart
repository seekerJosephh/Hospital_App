// lib/models/user_information_model.dart
class UserinformationModel {
  late String FirstName;
  late String LastName;
  late String Gender;
  late String DateOfBirth;

  UserinformationModel({
    this.FirstName = "",
    this.LastName = "",
    this.Gender = "",
    this.DateOfBirth = "",
  });

  factory UserinformationModel.fromJson(Map<String, dynamic> json) {
    return UserinformationModel(
      FirstName: json['FirstName'] ?? '',
      LastName: json['LastName'] ?? '',
      Gender: json['Gender'] ?? '',
      DateOfBirth: json['DateOfBirth'] ?? '',
    );
  }
}
