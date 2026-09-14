import 'package:flutter/material.dart';

/// Continuously morphs a blurred blob-like gradient behind the content,
/// and smoothly crossfades between page color themes as you swipe.
class MorphingBackground extends StatefulWidget {
  final List<List<Color>> gradientSets;
  final double pageOffset; // exact scroll position (fractional)

  const MorphingBackground({
    super.key,
    required this.gradientSets,
    required this.pageOffset,
  });

  @override
  State<MorphingBackground> createState() => _MorphingBackgroundState();
}

class _MorphingBackgroundState extends State<MorphingBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _blobController;

  @override
  void initState() {
    super.initState();
    _blobController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    _blobController.dispose();
    super.dispose();
  }

  Color _interpolateAt(int colorIndex) {
    final clamped = widget.pageOffset.clamp(
      0.0,
      (widget.gradientSets.length - 1).toDouble(),
    );
    final lower = clamped.floor();
    final upper = (lower + 1).clamp(0, widget.gradientSets.length - 1);
    final t = clamped - lower;
    return Color.lerp(
      widget.gradientSets[lower][colorIndex],
      widget.gradientSets[upper][colorIndex],
      t,
    )!;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _blobController,
      builder: (context, child) {
        final t = _blobController.value * 6.28318; // 2*pi
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    _interpolateAt(0).withOpacity(0.15),
                    Colors.black,
                  ],
                ),
              ),
            ),
            // Drifting blurred blob 1
            Positioned(
              left: 60 + 40 * _fastSin(t),
              top: 100 + 30 * _fastCos(t * 0.8),
              child: _Blob(color: _interpolateAt(0), size: 220),
            ),
            // Drifting blurred blob 2
            Positioned(
              right: 40 + 30 * _fastCos(t * 0.6),
              bottom: 180 + 40 * _fastSin(t * 1.1),
              child: _Blob(color: _interpolateAt(1), size: 260),
            ),
          ],
        );
      },
    );
  }

  double _fastSin(double x) =>
      x - (x * x * x) / 6 + (x * x * x * x * x) / 120;
  double _fastCos(double x) => _fastSin(x + 1.5708);
}

class _Blob extends StatelessWidget {
  final Color color;
  final double size;
  const _Blob({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color.withOpacity(0.35), color.withOpacity(0.0)],
        ),
      ),
    );
  }
}