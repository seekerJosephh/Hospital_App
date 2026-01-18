// // lib/views/home_view.dart
// import 'package:flutter/material.dart';
// import 'package:your_app/widgets/custom_button.dart'; // Reusing a custom widget

// class HomeView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text('Welcome to the Home Page!'),
//         CustomButton(
//           label: 'Go to Profile',
//           onPressed: () {
//             // Navigate to the ProfilePage
//             Navigator.pushNamed(context, '/homepage');
//           },
//         ),
//       ],
//     );
//   }
// }
//This routes form homepageimport 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hospital/core/utilities/form_util.dart';
import 'package:hospital/features/auth/views/userinformationform.dart';
import 'package:hospital/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _passWords = TextEditingController();

  String? _userNameError;
  String? _passWordError;

  @override
  void dispose() {
    _userName.dispose();
    _passWords.dispose();
    super.dispose();
  }

  void _validateLogin() {
    setState(() {
      _userNameError = FormUtil.validateUserName(_userName.text);
      _passWordError = FormUtil.validatePassword(_passWords.text);
    });

    if (_userNameError == null && _passWordError == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login successful!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fix the errors and try again.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLoginTextField(
              controller: _userName,
              label: "Input Your Username",
              errorText: _userNameError,
            ),
            const SizedBox(height: 16),
            _buildLoginTextField(
              controller: _passWords,
              label: "Input Your Password",
              errorText: _passWordError,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return CustomButton(
      label: "Submit",
      // onPressed: _validateLogin,
      onPressed: () {
        _validateLogin();
        if (_userNameError == null && _passWordError == null) {
          // Navigator.pushReplacementNamed(context, Approutes.userinformations);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Userinformationform()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Pleas fix the error before proceeding")));
        }
      },
    );
  }
}

Widget _buildLoginTextField({
  required TextEditingController controller,
  required String label,
  String? errorText,
  bool obscureText = false,
}) {
  return TextField(
    controller: controller,
    obscureText: obscureText,
    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      labelText: label,
      errorText: errorText,
    ),
  );
}
