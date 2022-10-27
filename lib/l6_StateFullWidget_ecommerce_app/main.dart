import 'package:flutter/material.dart';

import 'pages/cart/cart_page.dart';
import 'pages/home/home_page.dart';
import 'pages/production/production_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce App',
      routes: routesList,
      initialRoute: HomePage.routeName,
    );
  }

  Map<String, WidgetBuilder> get routesList => {
        HomePage.routeName: (context) => const HomePage(),
        ProductionPage.routeName: (context) => const ProductionPage(),
        CartPage.routeName: (context) => const CartPage(),
      };
}
