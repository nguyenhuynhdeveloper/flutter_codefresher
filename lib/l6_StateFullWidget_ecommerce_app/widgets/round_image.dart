import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class RoundImage extends StatelessWidget {
  const RoundImage({
    Key? key,
    required this.imageAsset,
    this.width,
    this.height,
    this.backgroundColor,
    this.aspectRatio = 1,
  }) : super(key: key);

  final String imageAsset;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      child: CustomContainer(
        borderRadius: 15,
        width: width,
        height: height,
        color: backgroundColor,
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: Image.asset(
            imageAsset,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
