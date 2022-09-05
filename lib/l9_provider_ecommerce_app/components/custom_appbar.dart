import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pages/cart/cart_page.dart';
import '../components/badge_button.dart';
import '../data/cart_state.dart';

// ignore: non_constant_identifier_names
AppBar CustomAppBar({
  Widget? leading,
  Widget? title,
  centerTitle = true,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    foregroundColor: Colors.black,
    centerTitle: centerTitle,
    title: title,
    leading: leading,
    actions: [
      Consumer<CartState>(
        builder: (context, value, child) => BadgeButton(
          badgeCount: value.totalItems,
          onPressedBadgeButton: () =>
              Navigator.of(context).pushNamed(CartPage.routeName),
        ),
      ),
    ],
  );
}
