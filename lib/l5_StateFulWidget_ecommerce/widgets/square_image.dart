import 'package:flutter/material.dart';

class SquareImage extends StatelessWidget {
  const SquareImage({
    Key? key,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
    this.size = 250,
    required this.imageUrl,
  }) : super(key: key);

  final BorderRadius? borderRadius;
  final double? size;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
        ),
        height: size,
        width: size,
        child: Image.network(
          imageUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
