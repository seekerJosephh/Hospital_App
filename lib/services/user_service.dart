// // lib/features/auth/controllers/auth_controller.dart
// import 'package:flutter/material.dart';
// import 'package:your_app/services/api_service.dart';
// import 'package:your_app/services/auth_service.dart';

// class AuthController {
//   final AuthService authService;
//   final ApiService apiService;

//   AuthController({required this.authService, required this.apiService});

//   // Login method
//   Future<void> login(String username, String password) async {
//     try {
//       final token = await authService.login(username, password);
//       print('Authenticated with token: $token');
//       // Use token for further API requests
//       final userData = await apiService.fetchData('user/profile');
//       print('User profile: $userData');
//     } catch (e) {
//       print('Login failed: $e');
//     }
//   }

//   // Logout method
//   Future<void> logout() async {
//     await authService.logout();
//     print('User logged out');
//   }
// }

// use  with model
// this welcome service use to load data to dispay in => Welcome_screen.dart
