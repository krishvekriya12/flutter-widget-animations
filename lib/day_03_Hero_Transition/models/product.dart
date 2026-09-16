import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final IconData icon;
  final List<Color> colors;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.icon,
    required this.colors,
  });
}

const List<Product> products = [
  Product(
    id: '1',
    name: 'Nova Headphones',
    category: 'Audio',
    price: 149.99,
    icon: Icons.headphones_rounded,
    colors: [Color(0xFF6C5CE7), Color(0xFF00CEC9)],
  ),
  Product(
    id: '2',
    name: 'Pulse Smartwatch',
    category: 'Wearable',
    price: 229.00,
    icon: Icons.watch_rounded,
    colors: [Color(0xFFFF7675), Color(0xFFFDCB6E)],
  ),
  Product(
    id: '3',
    name: 'Orbit Speaker',
    category: 'Audio',
    price: 89.50,
    icon: Icons.speaker_rounded,
    colors: [Color(0xFF00B894), Color(0xFF0984E3)],
  ),
  Product(
    id: '4',
    name: 'Flux Camera',
    category: 'Photography',
    price: 599.00,
    icon: Icons.camera_alt_rounded,
    colors: [Color(0xFFE17055), Color(0xFFD63031)],
  ),
];
