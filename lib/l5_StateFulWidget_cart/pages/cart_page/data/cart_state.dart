import '../../../pages/cart_page/data/models/cart_item_model.dart';
//Đây là state của màn hình giỏ hàng : bao gồm các item hàng bên trong (có tổng tiền của từng Item ) + Tổng tiền của toàn giỏ hàng
class CartState {
  // Property là 1 danh sách các sản phẩm 
  final Set<CartItemModel> productList;

  CartState({required this.productList});     //Đây là constructor của class state này Bắt buộc phải có thuộc tính productList
  
// 1 hàm get láy ra tổng giá tiền của : Các sản phẩm 
  double get totalPrice {     //get là 1 method lấy ra giá trị của totalPrice
    // for theo phần tử
    var result = 0.0;
    for (var cartItem in productList) {
      result += cartItem.subTotal;
    }
    return result;
  }

}

final cartState = CartState(productList: <CartItemModel>{});    // khai báo ra 1 biến cartState từ class CartState
