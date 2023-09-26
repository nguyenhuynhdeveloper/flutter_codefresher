import 'product.dart';
//State của  1 item trong giỏ hàng , product + tổng giá của item đó
class CartItemModel {
  int count;
  final Product product;

// Constructor của Class -- dùng để tạo đối tượng 
  CartItemModel({
    required this.product,
    this.count = 1,   // Không bắt buộc và có giá trị default  = 1
  });

  // Method get lấy ra giá trị tổng tiền = giá tiền * số lượng 
  double get subTotal => product.price * count;

}
