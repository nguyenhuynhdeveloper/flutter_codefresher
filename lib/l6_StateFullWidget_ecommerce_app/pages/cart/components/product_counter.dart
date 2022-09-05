import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/widgets/custom_container.dart';
import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ProductCounter extends StatelessWidget {
  const ProductCounter({
    Key? key,
    required this.onPressedRemoveButton,
    required this.productCount,
    required this.onPressedAddButton,
  }) : super(key: key);

  final Function(int) onPressedRemoveButton;
  final int productCount;
  final Function(int) onPressedAddButton;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderRadius: 5,
      child: Row(
        children: [
          IconButton(
            onPressed: () => onPressedRemoveButton,
            icon: const Icon(
              Icons.remove,
              color: Colors.red,
            ),
          ),
          CustomText(text: productCount.toString()),
          IconButton(
            onPressed: () => onPressedAddButton,
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
