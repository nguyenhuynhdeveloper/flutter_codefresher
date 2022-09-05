import 'package:flutter/material.dart';
import '../../../../widgets/square_image.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({
    Key? key,
    required this.imageUrl,
    this.imageSize = 150,
    this.borderRadius = const BorderRadius.all(Radius.circular(30)),
    required this.name,
  }) : super(key: key);
  final String imageUrl;
  final double? imageSize;
  final BorderRadius? borderRadius;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SquareImage(
          imageUrl: imageUrl,
          size: imageSize,
          borderRadius: borderRadius,
        ),
        const SizedBox(height: 15),
        Text(
          name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
