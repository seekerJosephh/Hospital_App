// import 'package:flutter/material.dart';


// class AuthController with ChangeNotifier {
//   AuthModel? _authModel;
//   bool _isLoading = false;
//   String _errorMessage = '';

//   AuthModel? get authModel => _authModel;
//   bool get isLoading => _isLoading;
//   String get errorMessage => _errorMessage;

//   Future<void> login(String email, String password) async {
//     _isLoading = true;
//     notifyListeners();

//     try {
//       _authModel = await AuthService().login(email, password);
//     } catch (e) {
//       _errorMessage = e.toString();
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   Future<void> register(String email, String password) async {
//     _isLoading = true;
//     notifyListeners();

//     try {
//       _authModel = await AuthService().register(email, password);
//     } catch (e) {
//       _errorMessage = e.toString();
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   void logout() {
//     _authModel = null;
//     notifyListeners();
//   }
// }

//this folder is control all data in json and Api....


  