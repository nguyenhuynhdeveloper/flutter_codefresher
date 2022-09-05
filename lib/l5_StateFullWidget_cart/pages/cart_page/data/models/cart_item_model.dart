import 'product.dart';
//State của  1 item trong giỏ hàng , product + tổng giá của item đó
class CartItemModel {
  int count;
  final Product product;
  double get subTotal => product.price * count;

  CartItemModel({
    required this.product,
    this.count = 1,
  });
}
