import 'package:flutter/material.dart';

class CartItemTitled extends StatelessWidget {
  const CartItemTitled({
    Key? key,
    required this.itemName,
    required this.onPressedDeleteButton,
  }) : super(key: key);

  final String itemName;
  final Function()? onPressedDeleteButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            itemName,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 10),
        IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: onPressedDeleteButton,
        ),
      ],
    );
  }
}
