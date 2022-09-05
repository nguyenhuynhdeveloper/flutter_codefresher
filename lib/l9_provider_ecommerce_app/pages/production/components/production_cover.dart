import 'package:flutter/material.dart';
import '../../../models/product_model.dart';
import '../../../utils/device_parameters.dart';
import '../../../widgets/round_image.dart';

class ProductionCover extends StatelessWidget {
  const ProductionCover({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          RoundImage(
            imageAsset: product.image,
            height: DeviceParameters.screenHeight(context) * 0.4,
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
