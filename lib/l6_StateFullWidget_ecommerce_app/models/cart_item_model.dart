import '../models/product_model.dart';

class CartItemModel {
  CartItemModel({
    required this.product,
    this.count = 1,
  });

  final ProductModel product;
  int count;

  //Method lấy ra tổng số lượng của item này trong giỏ hàng
  double get subTotal => product.currentPrice * count;
}
