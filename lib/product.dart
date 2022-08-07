import 'package:flutter/material.dart';

class Product {
  final String image, title;
  final int id;
  final Color color;

  Product({
    required this.image,
    required this.title,
    required this.color,
    required this.id,
  });
}

  List<Product> products = [
    Product(
        id: 1,
        title: "oil",
        image: "assets/images/oil.jpg",
        color: Colors.grey

    ),
    Product(
        id: 2,
        title: "oil",
        image: "assets/images/ghee.jpg",
        color: Colors.grey

    ),
    Product(
        id: 3,
        title: "oil",
        image: "assets/images/rice.jpg",
        color: Colors.grey

    ),
    Product(
        id: 4,
        title: "oil",
        image: "assets/images/sugar.jpg",
        color: Colors.grey

    ),
    Product(
        id: 5,
        title: "oil",
        image: "assets/images/tea.jpg",
        color: Colors.grey

    )
];
