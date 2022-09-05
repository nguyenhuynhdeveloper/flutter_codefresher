import 'package:flutter/material.dart';
import '../../components/custom_appbar.dart';
import 'components/cart_list.dart';
import 'components/checkout_panel.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  static const routeName = "CartPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: const Text('My Cart')),
      bottomNavigationBar: CheckOutPanel(
        onPressed: () {},
      ),
      body: const SafeArea(
        child: CartList(),
      ),
    );
  }
}
