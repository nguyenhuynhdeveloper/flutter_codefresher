import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/cart_item_model.dart';
import '../../../data/cart_state.dart';
import '../../../pages/production/production_page.dart';
import '../../../widgets/custom_text.dart';
import 'cart_item.dart';

class CartList extends StatelessWidget {
  const CartList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(builder: (context, value, child) {
      int itemCount = value.cartList.length;
      return itemCount == 0
          ? const Center(
              child: CustomText(
                text: 'Empty Cart.\nGo buy some stuff',
                textColor: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                size: 32,
                textAlign: TextAlign.center,
              ),
            )
          : _buildCartList(itemCount, value);
    });
  }

  Padding _buildCartList(int itemCount, CartState value) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          CartItemModel cartItem = value.cartList.elementAt(index);
          return Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: CartItem(
              onPressedItem: () {
                Navigator.of(context).pushNamed(
                  ProductionPage.routeName,
                  arguments: cartItem.product,
                );
              },
              productImage: cartItem.product.image,
              productName: cartItem.product.name,
              productSize: cartItem.product.size,
              productPrice: cartItem.product.currentPrice,
              productCount: cartItem.count,
              productIndex: index,
            ),
          );
        },
      ),
    );
  }
}
