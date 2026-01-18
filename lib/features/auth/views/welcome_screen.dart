import 'package:flutter/material.dart';
import 'package:hospital/core/constants/app_colors.dart';
import 'package:hospital/features/auth/models/welcome_model.dart';
import 'package:hospital/routes/AppRoutes.dart';
import 'package:hospital/services/welcome_service.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<WelcomeModel>>(
        future: loadWelcomeData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return WelcomePage(pages: snapshot.data!);
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}

class WelcomePage extends StatefulWidget {
  final List<WelcomeModel> pages;

  const WelcomePage({super.key, required this.pages});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.pages.length,
            onPageChanged: (idx) {
              setState(() {
                _currentPage = idx;
              });
            },
            itemBuilder: (context, idx) {
              final item = widget.pages[idx];
              return Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Image.network(
                        item.imageUrl,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image, size: 100),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            item.title,
                            // style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 280),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 8.0),
                          child: Text(
                            item.description,
                            textAlign: TextAlign.center,
                            // style: Theme.of(context).textTheme.,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.pages.map((item) {
            int index = widget.pages.indexOf(item);
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: _currentPage == index ? 24 : 8,
              height: 8,
              margin: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                color: _currentPage == index
                    ? AppColors.primary
                    : AppColors.secondary,
                borderRadius: BorderRadius.circular(10.0),
              ),
            );
          }).toList(),
        ),
        SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Approutes.logins);
                },
                child: const Text("Skip"),
              ),
              TextButton(
                onPressed: () {
                  if (_currentPage == widget.pages.length - 1) {
                    Navigator.pushReplacementNamed(context, Approutes.logins);
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Text(
                  _currentPage == widget.pages.length - 1 ? "Finish" : "Next",
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
