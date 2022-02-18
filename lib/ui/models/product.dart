import 'package:flutter/material.dart';

class Product {
  final String title, category, image, price;
  final bool isFavorite;

  Product(
      {required this.title,
      required this.category,
      required this.image,
      required this.price,
      this.isFavorite: false})
      : assert(title != null),
        assert(category != null),
        assert(image != null),
        assert(price != null);
}

List<Product> listProduct = [
  Product(
    title: "Playstation 5 Digital Edition",
    category: "Game console",
    image: "assets/console-side.png",
    price: "\$400",
  ),
  Product(
    title: "Playstation 5",
    category: "Game console",
    image: "assets/console-front.png",
    isFavorite: true,
    price: "\$500",
  ),
  Product(
    title: "DualSense Wireless Controller",
    category: "Gaming Controller",
    image: "assets/controller.png",
    price: "\$70",
  ),
  Product(
    title: "Wireless Headset",
    category: "Audio and Communication",
    image: "assets/helmet.png",
    price: "\$150",
  ),
];
