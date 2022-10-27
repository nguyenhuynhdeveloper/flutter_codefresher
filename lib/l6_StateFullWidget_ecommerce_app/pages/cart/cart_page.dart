import 'package:flutter/material.dart';

import 'components/cart_list.dart';
import 'components/checkout_panel.dart';
import '../../components/custom_appbar.dart';
import 'data/cart_state.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  static const routeName = "cartPage";

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: CustomAppBar(title: 'My cart'),
        bottomNavigationBar: CheckOutPanel(
          onPressed: () {},
        ),
        body: CartList(
          onPressedRemoveButton: (index)  {
            cartState.removeItem(index);
            setState(() {});
          },
          onPressedAddButton: (index) {
            cartState.addItem(index);
            setState(() {});
          },
        ),
      ),
    );
  }
}
