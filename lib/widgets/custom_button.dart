// lib/widgets/custom_button.dart
import 'package:flutter/material.dart';
import 'package:hospital/core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final double width;
  final double height;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.color = Colors.blue,
    this.width = double.infinity,
    this.height = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // Rounded corners
          ),
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}




// this file use for custom all widget 

// Example class to use 


// // lib/features/auth/views/login_screen.dart
// import 'package:flutter/material.dart';
// import 'package:your_app/widgets/custom_button.dart';
// import 'package:your_app/widgets/custom_input.dart';

// class LoginScreen extends StatelessWidget {
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CustomInput(
//               hintText: 'Enter Username',
//               controller: usernameController,
//               inputType: TextInputType.text,
//             ),
//             SizedBox(height: 20),
//             CustomInput(
//               hintText: 'Enter Password',
//               controller: passwordController,
//               inputType: TextInputType.text,
//               obscureText: true,
//             ),
//             SizedBox(height: 30),
//             CustomButton(
//               label: 'Login',
//               onPressed: () {
//                 // Perform login action
//                 print('Login button pressed');
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
