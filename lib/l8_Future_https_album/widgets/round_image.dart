import 'package:flutter/material.dart';
import '../widgets/custom_container.dart';

class RoundImage extends StatelessWidget {
  const RoundImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
  }) : super(key: key);

  final String imageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      child: CustomContainer(
        borderRadius: 25,
        width: width ?? height,
        height: height ?? width,
        color: Colors.green,
        child: Image.network(
          imageUrl,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
          loadingBuilder: (context, child, loadingProgress) =>
              const CircularProgressIndicator(),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
