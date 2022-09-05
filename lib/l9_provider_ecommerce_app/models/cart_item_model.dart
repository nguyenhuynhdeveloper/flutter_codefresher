import 'product_model.dart';

class CartItemModel {
  final ProductModel product;
  int count;

  double get subTotal => product.currentPrice * count;

  CartItemModel({
    required this.product,
    this.count = 1,
  });
}
