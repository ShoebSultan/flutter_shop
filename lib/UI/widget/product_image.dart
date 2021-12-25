import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String imageUrl;

  // ignore: use_key_in_widget_constructors
  const ProductImage(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      height: 125.0,
      width: 135.0,
      fit: BoxFit.fitHeight,
    );
  }
}
