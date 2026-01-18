import 'package:flutter/material.dart';
import 'package:hospital/core/constants/app_colors.dart';
import 'package:hospital/core/constants/app_fonts.dart';
import 'package:hospital/routes/AppRoutes.dart';
import 'package:lottie/lottie.dart';

class LottieScreen extends StatefulWidget {
  const LottieScreen({super.key});

  @override
  State<LottieScreen> createState() => _LottieScreenState();
}

class _LottieScreenState extends State<LottieScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, Approutes.homes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Littietitle(),
          _LittieAnnimation(),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _Littietitle() {
    return Center(
      child: Text(
        "Simpaz Heath Welcome",
        style: TextStyle(
          fontSize: AppFonts.getBodyText(context),
          color: AppColors.text,
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _LittieAnnimation() {
    return Center(
      child: Lottie.asset("lib/assets/jsons/lottie_data.json"),
    );
  }
}
