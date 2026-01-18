// import 'package:flutter/material.dart';
// import 'features/auth/views/login_screen.dart';
// import 'features/dashboard/views/home_screen.dart';
// import 'features/profile/views/profile_screen.dart';
// import 'features/settings/views/settings_screen.dart';

// class AppRoutes {

//   static const String login = '/login';
//   static const String home = '/home';
//   static const String profile = '/profile';
//   static const String settings = '/settings';

//   static Route? generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case login:
//         return MaterialPageRoute(builder: (_) => LoginScreen());
//       case home:
//         return MaterialPageRoute(builder: (_) => HomeScreen());
//       case profile:
//         return MaterialPageRoute(builder: (_) => ProfileScreen());
//       case settings:
//         return MaterialPageRoute(builder: (_) => SettingsScreen());
//       default:
//         return null;
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:hospital/features/auth/views/login_screen.dart';
import 'package:hospital/features/auth/views/lottie_screen.dart';
import 'package:hospital/features/auth/views/userinformation_screen.dart';
import 'package:hospital/features/auth/views/welcome_screen.dart';
import 'package:hospital/pages/history_page.dart';
import 'package:hospital/pages/home_page.dart';
import 'package:hospital/pages/profile_page.dart';
import 'package:hospital/pages/schedule_page.dart';
import 'package:hospital/pages/todolist_page.dart';

class Approutes {
  static const String litties = '/litties';
  static const String logins = '/logins';
  static const String welcomes = '/welcomes';
  static const String userinformations = '/userinformations';
  static const String homes = '/homes';
  static const String todos = '/todos';
  static const String schedules = '/schedule';
  static const String historys = '/historys';
  static const String profiles = '/profiles';

  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case litties:
        return MaterialPageRoute(builder: (_) => LottieScreen());
      case welcomes:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case logins:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case userinformations:
        return MaterialPageRoute(builder: (_) => UserinformationScreen());
      case homes:
        return MaterialPageRoute(builder: (_) => HomePage());
      case todos:
        return MaterialPageRoute(builder: (_) => TodolistPage());
      case schedules:
        return MaterialPageRoute(builder: (_) => SchedulePage());
      case historys:
        return MaterialPageRoute(builder: (_) => HistoryPage());
      case profiles:
        return MaterialPageRoute(builder: (_) => ProfilePage());
      default:
        return null;
    }
  }
}


// this page is Use for Routes page  

//step 2 
// import 'package:flutter/material.dart';
// import 'app_routes.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter App',
//       initialRoute: AppRoutes.login, // Start at the login page
//       onGenerateRoute: AppRoutes.generateRoute, // Use AppRoutes for routing
//     );
//   }
// }

//you can use this    Navigator.pushNamed(context, AppRoutes.home);


// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Page'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pushNamed(
//                 context, '/profile'); // Navigate to Profile page
//           },
//           child: Text('Go to Profile'),
//         ),
//       ),
//     );
//   }
// }


//to

// import 'package:flutter/material.dart';

// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile Page'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pushNamed(
//                 context, '/settings'); // Navigate to Settings page
//           },
//           child: Text('Go to Settings'),
//         ),
//       ),
//     );
//   }
// }
