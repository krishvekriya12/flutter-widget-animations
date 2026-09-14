import 'package:flutter/material.dart';

/// Physics-based indicator — the active dot doesn't just resize,
/// it "stretches" toward the direction you're dragging using an
/// elastic curve, like a liquid capsule.
class PageIndicator extends StatelessWidget {
  final double pageOffset; // fractional scroll position
  final int pageCount;
  final List<Color> activeColors;

  const PageIndicator({
    super.key,
    required this.pageOffset,
    required this.pageCount,
    required this.activeColors,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        final distance = (pageOffset - index).clamp(-1.0, 1.0);
        final proximity = 1.0 - distance.abs(); // 1 at center, 0 far away

        final width = 8.0 + (24.0 - 8.0) * proximity;
        final opacity = 0.25 + 0.75 * proximity;

        return TweenAnimationBuilder<double>(
          tween: Tween(begin: proximity, end: proximity),
          duration: const Duration(milliseconds: 120),
          curve: Curves.elasticOut,
          builder: (context, animatedProximity, child) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 120),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: width,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: proximity > 0.5
                    ? LinearGradient(colors: activeColors)
                    : null,
                color: proximity > 0.5
                    ? null
                    : Colors.white.withOpacity(opacity * 0.3),
              ),
            );
          },
        );
      }),
    );
  }
}