import 'package:flutter/material.dart';
import '../../data/cart_state.dart';
import '../../models/product_model.dart';
import '../../components/custom_appbar.dart';
import 'components/production_cover.dart';
import 'components/production_detail.dart';
import 'components/addto_cart_panel.dart';

class ProductionPage extends StatelessWidget {
  const ProductionPage({Key? key}) : super(key: key);

  static const routeName = "ProductionPage";

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as ProductModel;
    return Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: AddtoCartPanel(
        product: product,
        onPressed: () => cartState.addProduct(product),
        onPressedSizeButton: () {},
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          ProductionCover(
            product: product,
          ),
          ProductionDetail(
            product: product,
          ),
        ]),
      )),
    );
  }
}
