import 'package:flutter/material.dart';

import '../models/onboarding_page.dart';
import '../widgets/onboarding_content.dart';
import '../widgets/page_indicator.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  final List<OnboardingPage> _pages = const [
    OnboardingPage(
      title: 'Stay Focused',
      description: 'Organize your work and eliminate distractions so you can focus on what really matters.',
      image: 'assets/images/focus.png',
    ),
    OnboardingPage(
      title: 'Plan Your Day',
      description: 'Turn your goals into simple tasks and build a routine that actually works for you.',
      image: 'assets/images/plan.png',
    ),
    OnboardingPage(
      title: 'Get Things Done',
      description: 'Track your progress, complete your goals and make every day more productive.',
      image: 'assets/images/done.png',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _openHome();
    }
  }

  void _openHome() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingContent(page: _pages[index]);
                },
              ),
            ),

            PageIndicator(currentPage: _currentPage, pageCount: _pages.length),

            const SizedBox(height: 32),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _nextPage,
                  child: Text(
                    _currentPage == _pages.length - 1 ? 'GET STARTED' : 'NEXT',
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
