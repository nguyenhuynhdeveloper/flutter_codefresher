import '../../../models/cart_item_model.dart';
import '../../../models/product_model.dart';

class CartState {
  CartState({required this.cartList});

  List<CartItemModel> cartList = [];

  //Lấy tổng số item có ở trong giỏ hàng
  int get totalItems {
    int result = 0;
    for (var cartItem in cartList) {
      result += cartItem.count;
    }
    return result;
  }

  //Get lấy tổng giá trị của giỏ hàng
  double get totalPrice {
    double result = 0;
    for (var cartItem in cartList) {
      result += cartItem.subTotal;
    }
    return result;
  }

  // Lấy ra index của 1 sản phẩm đang nằm trong list sản phẩm giỏ hàng
  int productIndex(ProductModel product) =>
      cartList.indexWhere((cartList) => cartList.product == product);

  // Thêm số lượng 1 sản phẩm
  void addItem(index) {
    cartList[index].count++;

  }

  //Giảm số lượng 1 sản phẩm
  void removeItem(index) {
    cartList[index].count--;

  }

  // Thêm 1 sản phẩm vào giở hàng
  void addProduct(ProductModel product) {
    cartList.where((cartList) => cartList.product.id == product.id).isNotEmpty
        ? addItem(productIndex(product))     // Nếu item đó đã có trong giỏ hàng thì cộng số lượng của item đó
        : cartList.add(CartItemModel(product: product, count: 1));  // Nếu chưa có trong giỏ hàng thì thêm sản phẩm đó vào giỏ với số lượng = 1
  }
}


//-------<>-----Tạo ra 1 đối tượng cartState từ class CartState  : Cái này hiện tại đơn giản chỉ là 1 biến global , bất kỳ widget nào cũng có thể trỏ vào
final cartState = CartState(
  cartList: <CartItemModel>[],
);
