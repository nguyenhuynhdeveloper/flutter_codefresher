import 'package:flutter/material.dart';

class CartItemPriceDetail extends StatelessWidget {
  const CartItemPriceDetail({
    Key? key,
    required this.price,
    required this.subTotal,
  }) : super(key: key);

  final double price;
  final double subTotal;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Price:  ',
            children: [
              TextSpan(
                text: '\$${price.toString()}',
                style: const TextStyle(),
              ),
            ],
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        RichText(
          text: TextSpan(
            text: 'Sub Total:  ',
            children: [
              TextSpan(
                text: '\$${subTotal.toString()}',
                style: const TextStyle(
                  color: Colors.orange,
                ),
              ),
            ],
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
