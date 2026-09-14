import 'package:flutter/material.dart';

class OnboardingPage {
  final String title;
  final String description;
  final IconData icon;
  final List<Color> gradientColors;

  const OnboardingPage({
    required this.title,
    required this.description,
    required this.icon,
    required this.gradientColors,
  });
}