import 'package:flutter/material.dart';

import '../models/onboarding_page.dart';
import '../widgets/onboarding_content.dart';
import '../widgets/page_indicator.dart';
import '../widgets/morphing_background.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  double _pageOffset = 0;

  final List<OnboardingPage> _pages = const [
    OnboardingPage(
      title: 'Stay Focused',
      description: 'Organize your work and eliminate distractions so you can focus on what really matters.',
      icon: Icons.center_focus_strong_rounded,
      gradientColors: [Color(0xFF6C5CE7), Color(0xFF00CEC9)],
    ),
    OnboardingPage(
      title: 'Plan Your Day',
      description: 'Turn your goals into simple tasks and build a routine that actually works for you.',
      icon: Icons.calendar_month_rounded,
      gradientColors: [Color(0xFFFF7675), Color(0xFFFDCB6E)],
    ),
    OnboardingPage(
      title: 'Get Things Done',
      description: 'Track your progress, complete your goals and make every day more productive.',
      icon: Icons.rocket_launch_rounded,
      gradientColors: [Color(0xFF00B894), Color(0xFF0984E3)],
    ),
  ];

  int get _currentPage => _pageOffset.round();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        _pageOffset = _pageController.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutCubic,
      );
    } else {
      _openHome();
    }
  }

  void _openHome() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (_, animation, __) => const HomeScreen(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween(begin: 0.92, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
              ),
              child: child,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final gradientSets = _pages.map((p) => p.gradientColors).toList();
    final activeGradient = _pages[_currentPage].gradientColors;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: MorphingBackground(
              gradientSets: gradientSets,
              pageOffset: _pageOffset,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: _currentPage == _pages.length - 1 ? 0 : 1,
                      child: TextButton(
                        onPressed: _openHome,
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _pages.length,
                    itemBuilder: (context, index) {
                      final delta = _pageOffset - index;
                      return OnboardingContent(
                        page: _pages[index],
                        pageDelta: delta,
                      );
                    },
                  ),
                ),
                PageIndicator(
                  pageOffset: _pageOffset,
                  pageCount: _pages.length,
                  activeColors: activeGradient,
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                    width: double.infinity,
                    height: 58,
                    child: ElevatedButton(
                      onPressed: _nextPage,
                      style:
                          ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ).copyWith(
                            overlayColor: MaterialStateProperty.all(
                              Colors.white.withOpacity(0.1),
                            ),
                          ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: activeGradient),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: Text(
                              _currentPage == _pages.length - 1
                                  ? 'GET STARTED'
                                  : 'NEXT',
                              key: ValueKey(_currentPage == _pages.length - 1),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
