// import 'package:flutter_test/flutter_test.dart';
// import 'package:hospital/core/utilities/form_util.dart';

// void main() {
//   group('FormUtil', () {
//     test('validateFirstName returns error for empty name', () {
//       expect(FormUtil.validateFirstName(null), "Frist Name cannot be empty !");
//       expect(FormUtil.validateFirstName(""), "Frist Name cannot be empty !");
//     });
//     test('ValidateFirstName return error fot short name', () {
//       expect(FormUtil.validateFirstName('A'),
//           "First Name nust be at leat 2 character!");
//     });
//     test("CalidateLastName behaves like validateFirstName", () {
//       expect(FormUtil.validateFirstName("Vathana"), null);
//     });

//     test("validateLastName behaves link validateFirst Name", () {
//       expect(FormUtil.validateLastName(null), "Last Name cannot be empty!");
//       expect(FormUtil.validateLastName(""), "Last Name cannot be empty!");
//       expect(FormUtil.validateLastName("A"),
//           "Last Name nust be at least 2 charaters!");
//     });
//     test("validateGender return error for invalid gender", () {
//       expect(FormUtil.validateGender(null), "Gender cannot be empty!");
//       expect(FormUtil.validateGender(""), "Gendre cannot be empty!");
//       expect(FormUtil.validateGender("Hello"),
//           "Gender nust be Mail ,Female or Other!");
//     });
//     test('validateDateOfBirth return error for null for or underage date', () {
//       expect(
//           FormUtil.validateDateOfBirth(null), "Date of Birth cannot be empty!");
//       expect(
//           FormUtil.validateDateOfBirth(
//               DateTime.now().subtract(Duration(days: 17 * 365))),
//           "You must be at least 18 year old!");
//     });
//     test('validateDateOfBirth return null for valid age', () {
//       expect(
//           FormUtil.validateDateOfBirth(
//               DateTime.now().subtract(Duration(days: 18 * 365))),
//           null);
//     });
//   });
// }
