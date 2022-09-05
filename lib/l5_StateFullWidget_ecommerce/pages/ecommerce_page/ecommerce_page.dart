import 'package:flutter/material.dart';
import '../../pages/ecommerce_page/components/categories/categories.dart';
import '../../pages/ecommerce_page/components/featured_products/featured_products.dart';
import '../../pages/ecommerce_page/components/recent_products/recent_products.dart';

class EcommercePage extends StatelessWidget {
  const EcommercePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Buy Stuff'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SizedBox(height: 30),
            Categories(),
            SizedBox(height: 40),
            FeaturedProducts(),
            SizedBox(height: 50),
            RecentProducts(),
          ],
        ),
      ),
    );
  }
}
