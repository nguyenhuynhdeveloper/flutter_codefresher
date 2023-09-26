import 'package:flutter/material.dart';

class CartItemsCounter extends StatelessWidget {
  const CartItemsCounter(
      {Key? key,
      this.itemCount = 1,
      required this.onPlusPressed,
      required this.onMinusPressed})
      : super(key: key);

  final int itemCount;
  final VoidCallback onPlusPressed;
  final VoidCallback onMinusPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onMinusPressed,
          icon: const Icon(
            Icons.remove,
            color: Colors.red,
          ),
        ),
        Card(
          elevation: 2.5,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(itemCount.toString()),     //Tổng số lượng Item đã mua
          ),
        ),
        IconButton(
          onPressed: () {
            onPlusPressed();
          },
          icon: const Icon(
            Icons.add,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
