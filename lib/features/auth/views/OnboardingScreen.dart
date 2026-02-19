import 'package:flutter/material.dart';
import 'package:hospital/core/constants/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:hospital/routes/AppRoutes.dart';

class OnboardingModel {
  final String title;
  final String description;
  final String image; // asset path or network

  OnboardingModel(this.title, this.description, this.image);
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingModel> _pages = [
    OnboardingModel(
      "Find a lot of specialist doctors in one place",
      "",
      'lib/assets/images/doc1.avif', // or network image
    ),
    OnboardingModel(
      "Get advice only from a doctor you believe in",
      "",
      'lib/assets/images/doc2.png',
    ),
    OnboardingModel(
      "",
      "",
      'lib/assets/images/doc3.avif',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (context, index) {
                final page = _pages[index];
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image (large)
                      Expanded(
                        child: Image.asset(page.image, fit: BoxFit.contain),
                      ),

                      Text(
                        page.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        page.description,
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              top: 17,
              right: 24,
              child: TextButton(
                onPressed: () => Navigator.pushNamed(context, AppRoutes.login),
                child: const Text("Skip",
                    style: TextStyle(fontSize: 16, color: Colors.teal)),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Dots – smaller, tighter spacing
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: _pages.length,
                    effect: const WormEffect(
                      dotHeight: 5, // smaller dots like in screenshot
                      dotWidth: 12,
                      spacing: 12, // not too wide
                      activeDotColor: Color(
                          0xFF26A69A), // teal / #26A69A or your theme color
                      dotColor: Color(0xFFCFD8DC), // light gray
                      radius: 4.0,
                    ),
                  ),

                  const SizedBox(
                      height: 24), // reduced vertical gap between dots & button

                  if (_currentPage == _pages.length - 1) ...[
                    Text(
                      "Let's get started",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          // Login button (full width, filled)
                          SizedBox(
                            width: double.infinity,
                            height: 54,
                            child: ElevatedButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, AppRoutes.login),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary, // teal
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                elevation: 2,
                              ),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Sign Up (outlined)
                          SizedBox(
                            width: double.infinity,
                            height: 54,
                            child: OutlinedButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, AppRoutes.signup),
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    color: AppColors.primary, width: 2),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ] else ...[
                    // Pages 1 & 2 → circular next arrow button (aligned right)
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 40, top: 80), // ← pushed to right side
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 450),
                              curve: Curves.easeInOutCubic,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(
                                22), // slightly bigger touch area
                            elevation: 4, // subtle shadow like in many designs
                            shadowColor: AppColors.primary.withOpacity(0.4),
                          ),
                          child: const Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
