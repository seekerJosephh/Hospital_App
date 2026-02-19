import 'package:flutter/material.dart';
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
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, AppRoutes.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("lib/assets/images/Heartbeat _ ECG _ Loader.gif",
                width: 220, height: 220, fit: BoxFit.fill),
            // Lottie.asset(
            //   'assets/animations/Heartbeat _ ECG _ Loader.gif',
            //   width: 220,
            //   height: 220,
            //   fit: BoxFit.fill,
            //   repeat: true,
            // ),
            const SizedBox(height: 24),
            const Text(
              'Healthcare',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
            const Text(
              'Medical app',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
