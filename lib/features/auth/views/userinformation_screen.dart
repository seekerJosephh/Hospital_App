import 'package:flutter/material.dart';

import 'package:hospital/core/utilities/form_util.dart';
import 'package:hospital/widgets/custom_button.dart';

class UserinformationScreen extends StatefulWidget {
  const UserinformationScreen({super.key});

  @override
  State<UserinformationScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<UserinformationScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  String? _firstNameError;
  String? _lastNameError;
  String? _genderError;
  String? _dobError;

  void _validateInputs() {
    setState(() {
      _firstNameError = FormUtil.validateFirstName(_firstNameController.text);
      _lastNameError = FormUtil.validateLastName(_lastNameController.text);
      _genderError = FormUtil.validateGender(_genderController.text);
      _dobError = FormUtil.validateDateOfBirth(
        DateTime.tryParse(_dobController.text),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("UserInformation")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField(
              controller: _firstNameController,
              label: "First Name",
              errorText: _firstNameError,
            ),
            SizedBox(height: 10),
            _buildTextField(
              controller: _lastNameController,
              label: "Last Name",
              errorText: _lastNameError,
            ),
            SizedBox(height: 10),
            _buildTextField(
              controller: _genderController,
              label: "Gender (Male/Female/Other)",
              errorText: _genderError,
            ),
            SizedBox(height: 10),
            _buildTextField(
              controller: _dobController,
              label: "Date of Birth (YYYY-MM-DD)",
              errorText: _dobError,
            ),
            SizedBox(height: 10),
            _ButtonLogin(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? errorText,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        errorText: errorText,
      ),
    );
  }

  Widget _ButtonLogin() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: CustomButton(
        label: "Submit",
        onPressed: () {
          _validateInputs();
          if (_firstNameError == null &&
              _lastNameError == null &&
              _genderError == null &&
              _dobError == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("All inputs are valid!"),
              ),
            );
          }
        },
      ),
    );
  }
}
