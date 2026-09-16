import 'package:flutter/material.dart';
import 'package:flutter_animations/day_03_Hero_Transition/screens/product_list_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF0A0A0F)),
      home: const ProductListScreen(),
    );
  }
}
