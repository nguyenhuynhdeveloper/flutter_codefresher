import 'package:flutter/material.dart';
import 'pages/cart_page/cart_page.dart';
import 'pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      initialRoute: "home_page",
      routes: {
        "home_page": (context) {
          return const HomePage();
        },
        "cart_page": (context) {
          return const CartPage();
        },
      },
    );
  }
}
