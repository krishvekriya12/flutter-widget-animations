import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../models/onboarding_page.dart';

class OnboardingContent extends StatelessWidget {
  final OnboardingPage page;
  final double pageDelta; // 0 = fully centered, -1/+1 = fully off to a side

  const OnboardingContent({
    super.key,
    required this.page,
    required this.pageDelta,
  });

  @override
  Widget build(BuildContext context) {
    final clamped = pageDelta.clamp(-1.0, 1.0);
    final scale = 1.0 - (clamped.abs() * 0.35);
    final rotation = clamped * 0.35;
    final opacity = (1.0 - clamped.abs()).clamp(0.0, 1.0);
    final verticalDrift = clamped.abs() * 40;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Transform.translate(
                offset: Offset(0, verticalDrift),
                child: Transform.rotate(
                  angle: rotation,
                  child: Transform.scale(
                    scale: scale,
                    child: Opacity(
                      opacity: opacity,
                      child: _GlowingIcon(
                        icon: page.icon,
                        colors: page.gradientColors,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Opacity(
              opacity: opacity,
              child: Transform.translate(
                offset: Offset(0, clamped.abs() * 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: page.gradientColors,
                      ).createShader(bounds),
                      child: Text(
                        page.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      page.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.55,
                        color: Colors.white.withOpacity(0.55),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GlowingIcon extends StatefulWidget {
  final IconData icon;
  final List<Color> colors;
  const _GlowingIcon({required this.icon, required this.colors});

  @override
  State<_GlowingIcon> createState() => _GlowingIconState();
}

class _GlowingIconState extends State<_GlowingIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final angle = _controller.value * 2 * math.pi;
        return SizedBox(
          width: 220,
          height: 220,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Transform.rotate(
                angle: angle,
                child: CustomPaint(
                  size: const Size(220, 220),
                  painter: _RingPainter(color: widget.colors.first),
                ),
              ),
              Transform.rotate(
                angle: -angle * 0.6,
                child: CustomPaint(
                  size: const Size(170, 170),
                  painter: _DotRingPainter(color: widget.colors.last),
                ),
              ),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: widget.colors,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: widget.colors.first.withOpacity(0.5),
                      blurRadius: 40,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: Icon(widget.icon, size: 52, color: Colors.white),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _RingPainter extends CustomPainter {
  final Color color;
  _RingPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    const gapDegrees = 40.0;
    const arcCount = 4;
    for (int i = 0; i < arcCount; i++) {
      final start = (i * (360 / arcCount)) * (3.14159 / 180);
      canvas.drawArc(
        rect,
        start,
        (360 / arcCount - gapDegrees) * (3.14159 / 180),
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _DotRingPainter extends CustomPainter {
  final Color color;
  _DotRingPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color.withOpacity(0.6);
    final radius = size.width / 2;
    const dotCount = 16;
    for (int i = 0; i < dotCount; i++) {
      final angle = (i / dotCount) * 2 * 3.14159;
      final dx = radius + radius * 0.92 * math.cos(angle);
      final dy = radius + radius * 0.92 * math.sin(angle);
      canvas.drawCircle(Offset(dx, dy), 1.8, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}