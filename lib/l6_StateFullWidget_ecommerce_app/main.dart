import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/pages/cart/cart_page.dart';
import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/pages/home/home_page.dart';
import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/pages/production/production_page.dart';
import 'package:flutter/material.dart';

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
