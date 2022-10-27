import 'package:flutter/material.dart';

import '../components/product_counter.dart';
import '../../../utils/device_parameters.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/round_image.dart';


class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.productImage,
    required this.productName,
    required this.productSize,
    required this.productPrice,
    required this.onPressedItem,
    required this.productCount,
    required this.onPressedAddButton,
    required this.onPressedRemoveButton,

  }) : super(key: key);

  final String productImage;
  final String productName;
  final int productSize;
  final double? productPrice;
  final Function()? onPressedItem;
  final int productCount;
  final Function(int) onPressedAddButton;
  final Function(int) onPressedRemoveButton;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressedItem,
      child: CustomContainer(
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              SizedBox(
                child: RoundImage(
                  imageAsset: productImage,
                  aspectRatio: 0.9,
                  width: DeviceParameters.screenWidth(context) / 4,
                  backgroundColor: Colors.grey[400],
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: productName,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 10),
                    CustomText(
                      text: 'Size: $productSize',
                      textColor: Colors.grey,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: '\$$productPrice',
                          fontWeight: FontWeight.bold,
                          size: 20,
                        ),
                        ProductCounter(
                          onPressedRemoveButton: onPressedRemoveButton,
                          productCount: productCount,
                          onPressedAddButton: onPressedAddButton,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
