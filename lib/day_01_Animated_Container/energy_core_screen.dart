import 'package:flutter/material.dart';

class EnergyCoreScreen extends StatefulWidget {
  const EnergyCoreScreen({super.key});
  @override
  State<EnergyCoreScreen> createState() => _EnergyCoreScreenState();
}

class _EnergyCoreScreenState extends State<EnergyCoreScreen> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'ENERGY CORE',
              style: TextStyle(
                color: Colors.white38,
                fontSize: 13,
                letterSpacing: 4,
              ),
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () => setState(() => isActive = !isActive),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeOutCubic,
                width: isActive ? 180 : 130,
                height: isActive ? 180 : 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: isActive
                        ? [const Color(0xFF7FFFD4), const Color(0xFF00695C)]
                        : [const Color(0xFF3A3A4A), const Color(0xFF15151E)],
                  ),
                  boxShadow: isActive
                      ? [
                          BoxShadow(
                            color: const Color(0xFF00E5CC).withOpacity(0.5),
                            blurRadius: 50,
                            spreadRadius: 6,
                          ),
                        ]
                      : [],
                ),
                child: Icon(
                  isActive
                      ? Icons.bolt_rounded
                      : Icons.power_settings_new_rounded,
                  color: isActive ? Colors.white : Colors.white38,
                  size: isActive ? 44 : 32,
                ),
              ),
            ),
            const SizedBox(height: 40),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 400),
              style: TextStyle(
                color: isActive ? const Color(0xFF7FFFD4) : Colors.white38,
                fontSize: 14,
                letterSpacing: 1.5,
              ),
              child: Text(isActive ? 'ONLINE' : 'TAP TO ACTIVATE'),
            ),
          ],
        ),
      ),
    );
  }
}
