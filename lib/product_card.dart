import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color backroungColor;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.backroungColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backroungColor,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 5.0),
          Text('\$$price', style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 5.0),
          Center(child: Image.asset(image, height: 200)),
        ],
      ),
    );
  }
}
