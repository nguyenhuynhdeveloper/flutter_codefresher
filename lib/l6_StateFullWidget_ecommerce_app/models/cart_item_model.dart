import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/models/product_model.dart';

class CartItemModel {
  final ProductModel product;
  int count;

  double get subTotal => product.currentPrice * count;

  CartItemModel({
    required this.product,
    this.count = 1,
  });
}
