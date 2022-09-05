import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/models/product_model.dart';
import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/utils/device_parameters.dart';
import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/widgets/round_image.dart';
import 'package:flutter/material.dart';

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
