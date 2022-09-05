import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/components/badge_button.dart';
import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/models/product_model.dart';
import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/pages/cart/cart_page.dart';
import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/pages/cart/data/cart_state.dart';
import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/pages/production/components/addto_cart_panel.dart';
import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/pages/production/components/production_cover.dart';
import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/pages/production/components/production_detail.dart';
import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/components/custom_appbar.dart';
import 'package:flutter/material.dart';

class ProductionPage extends StatefulWidget {
  const ProductionPage({Key? key}) : super(key: key);

  static const routeName = "productionPage";

  @override
  State<ProductionPage> createState() => _ProductionPageState();
}

class _ProductionPageState extends State<ProductionPage> {
  @override
  Widget build(BuildContext context) {
    void _reload() {
      setState(() {});
    }

    final product = ModalRoute.of(context)?.settings.arguments as ProductModel;

    return Scaffold(
      appBar: CustomAppBar(
        action: [
          BadgeButton(
            badgeCount: cartState.totalItems,
            onPressedBadgeButton: () {
              Navigator.of(context)
                  .pushNamed(CartPage.routeName)
                  .then((value) => _reload());
            },
          ),
        ],
      ),
      bottomNavigationBar: AddtoCartPanel(
        product: product,
        onPressed: () {
          cartState.addProduct(product);
          setState(() {});
        },
        onPressedSizeButton: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductionCover(
              product: product,
            ),
            ProductionDetail(
              product: product,
            ),
          ],
        ),
      ),
    );
  }
}
