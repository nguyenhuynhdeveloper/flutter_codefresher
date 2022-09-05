import 'package:flutter/material.dart';
import '../../../data/cart_state.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/custom_text.dart';

class ProductCounter extends StatelessWidget {
  const ProductCounter({
    Key? key,
    required this.productCount,
    required this.productIndex,
  }) : super(key: key);

  final int productCount;
  final int productIndex;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderRadius: 5,
      child: Row(
        children: [
          IconButton(
            onPressed: () => cartState.removeItem(productIndex),
            icon: const Icon(
              Icons.remove,
              color: Colors.red,
            ),
          ),
          CustomText(text: productCount.toString()),
          IconButton(
            onPressed: () => cartState.addItem(productIndex),
            icon: const Icon(
              Icons.add,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
