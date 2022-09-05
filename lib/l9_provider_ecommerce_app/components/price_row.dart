import '../widgets/custom_text.dart';
import 'package:flutter/material.dart';

class PriceRow extends StatelessWidget {
  const PriceRow({
    Key? key,
    required this.saleOffPrice,
    required this.originalPrice,
  }) : super(key: key);

  final double? saleOffPrice;
  final double? originalPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(
          text: '\$${saleOffPrice ?? originalPrice}',
          fontWeight: FontWeight.w900,
          size: 18,
        ),
        const SizedBox(width: 10),
        if (saleOffPrice != null)
          CustomText(
            text: '\$$originalPrice',
            lineThrough: true,
          ),
      ],
    );
  }
}
