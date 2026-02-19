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
import 'package:hospital/features/auth/views/OnboardingScreen.dart';
import 'package:hospital/features/auth/views/login_screen.dart';
import 'package:hospital/features/auth/views/lottie_screen.dart';
import 'package:hospital/features/auth/views/news_screen.dart';
import 'package:hospital/features/auth/views/signUp_screen.dart';
import 'package:hospital/features/auth/views/userinformation_screen.dart';
import 'package:hospital/features/auth/views/welcome_screen.dart';
import 'package:hospital/pages/history_page.dart';
import 'package:hospital/pages/home_page.dart';
import 'package:hospital/pages/profile_page.dart';
import 'package:hospital/pages/schedule_page.dart';
import 'package:hospital/pages/todolist_page.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String todos = '/todos';
  static const String schedules = '/schedule';
  static const String historys = '/historys';
  static const String profiles = '/profiles';
  static const String newscreen = '/newscreen';

  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => LottieScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case todos:
        return MaterialPageRoute(builder: (_) => TodolistPage());
      case schedules:
        return MaterialPageRoute(builder: (_) => SchedulePage());
      case historys:
        return MaterialPageRoute(builder: (_) => HistoryPage());
      case profiles:
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case newscreen:
        return MaterialPageRoute(builder: (_) => NewScreen());
      default:
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(body: Center(child: Text('Page not found'))));
    }
  }
}
