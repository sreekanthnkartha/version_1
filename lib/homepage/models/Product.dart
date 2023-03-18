import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price;
  final Color bgColor;

  Product({
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    this.bgColor = const Color(0xFFEFEFF2),
  });
}

List<Product> demo_product = [];
List<Product> cart_product = [];
//   Product(
//     image: "assets/images/product_0.png",
//     title: "Long Sleeve Shirts",
//     price: 165,
//     description: "Long Sleeve Shirts",
//     // bgColor: const Color(0xFFFEFBF9),
//   ),
//   Product(
//     image: "assets/images/product_1.png",
//     title: "Casual Henley Shirts",
//     description: "Casual Henley Shirts",
//     price: 99,
//   ),
//   Product(
//     image: "assets/images/product_2.png",
//     title: "Curved Hem Shirts",
//     description: "Curved Hem Shirts",
//     price: 180,
//     // bgColor: const Color(0xFFF8FEFB),
//   ),
//   Product(
//     image: "assets/images/product_3.png",
//     title: "Casual Nolin",
//     price: 149,
//     description: "Casual Nolin",
//     // bgColor: const Color(0xFFEEEEED),
//   ),
// ];
