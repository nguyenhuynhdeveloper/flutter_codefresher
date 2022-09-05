import 'package:flutter/material.dart';
import '../../../../widgets/square_image.dart';

class FeaturedProductsItem extends StatelessWidget {
  const FeaturedProductsItem({
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
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SquareImage(
          imageUrl: imageUrl,
          size: imageSize,
          borderRadius: borderRadius,
        ),
        Container(
          width: imageSize,
          height: imageSize != 0 ? imageSize! * 0.2 : 30,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color.fromARGB(235, 0, 0, 0),
          ),
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
