import 'package:flutter/material.dart';

class Product {
  final String imagePath;
  final String name;
  final String price;
  final String rating;
  final List<Color> colors;
  final String description;
  final List<String> materials;

  Product({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.rating,
    required this.colors,
    required this.description,
    required this.materials,
  });

  static final dummyData = [
    Product(
      imagePath: "image",
      name: "Six Dining Set",
      price: "\$1,770",
      rating: "4.8",
      colors: [
        Colors.orange,
        Colors.grey.shade100,
        Colors.red,
        const Color.fromARGB(255, 36, 71, 133),
      ],
      description: "Transform your balcony into a cozy retreat with this stylish armchair set, ottoman, plant rack, wooden basket, and soft carpet",
      materials: ["Wood", "Wool", "Cotton"],
    ),
  ];
}
