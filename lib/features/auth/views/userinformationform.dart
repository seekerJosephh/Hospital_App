// lib/screens/user_information_form.dart
import 'package:flutter/material.dart';

import 'package:hospital/features/auth/models/userinformation_model.dart';

import 'package:hospital/routes/AppRoutes.dart';
import 'package:hospital/services/userinfromsion_service.dart';
import 'package:hospital/widgets/custom_button.dart';

class Userinformationform extends StatefulWidget {
  const Userinformationform({super.key});

  @override
  State<Userinformationform> createState() => _UserinformationformState();
}

class _UserinformationformState extends State<Userinformationform> {
  late Future<List<UserinformationModel>> _userInfoFuture;
  final List<TextEditingController> _firstNameControllers = [];
  final List<TextEditingController> _lastNameControllers = [];
  final List<TextEditingController> _genderControllers = [];
  final List<TextEditingController> _dobControllers = [];

  @override
  void initState() {
    super.initState();
    _userInfoFuture = loadUserinformationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Please Check and Edit Your Information",
        ),
      ),
      body: FutureBuilder<List<UserinformationModel>>(
        future: _userInfoFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            final userData = snapshot.data!;
            _initializeControllers(userData);

            return ListView.builder(
              itemCount: userData.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _firstNameControllers[index],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "First Name"),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _lastNameControllers[index],
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Last Name"),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _genderControllers[index],
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Gender"),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _dobControllers[index],
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Date of Birth"),
                        ),
                        SizedBox(height: 10),
                        _buildSubmitButton(),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("No data available"));
          }
        },
      ),
    );
  }

  Widget _buildSubmitButton() {
    return CustomButton(
      label: "Submit",
      // onPressed: _validateLogin,
      onPressed: () {
        Navigator.pushReplacementNamed(context, Approutes.homes);
      },
    );
  }

  void _initializeControllers(List<UserinformationModel> userData) {
    if (_firstNameControllers.isEmpty) {
      for (var user in userData) {
        _firstNameControllers.add(TextEditingController(text: user.FirstName));
        _lastNameControllers.add(TextEditingController(text: user.LastName));
        _genderControllers.add(TextEditingController(text: user.Gender));
        _dobControllers.add(TextEditingController(text: user.DateOfBirth));
      }
    }
  }

  @override
  void dispose() {
    for (var controller in _firstNameControllers) {
      controller.dispose();
    }
    for (var controller in _lastNameControllers) {
      controller.dispose();
    }
    for (var controller in _genderControllers) {
      controller.dispose();
    }
    for (var controller in _dobControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
