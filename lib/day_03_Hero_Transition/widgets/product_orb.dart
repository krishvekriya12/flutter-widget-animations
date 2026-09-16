import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductOrb extends StatelessWidget {
  final Product product;
  final double size;

  const ProductOrb({super.key, required this.product, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: product.colors,
        ),
        boxShadow: [
          BoxShadow(
            color: product.colors.first.withOpacity(0.45),
            blurRadius: size * 0.35,
            spreadRadius: size * 0.02,
          ),
        ],
      ),
      child: Icon(
        product.icon,
        size: size * 0.45,
        color: Colors.white,
      ),
    );
  }
}