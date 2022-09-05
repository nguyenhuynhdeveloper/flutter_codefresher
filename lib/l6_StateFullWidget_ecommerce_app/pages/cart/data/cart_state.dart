import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/models/cart_item_model.dart';
import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/models/product_model.dart';

class CartState {
  List<CartItemModel> cartList = [];

  CartState({required this.cartList});

  double get totalPrice {
    double result = 0;
    for (var cartItem in cartList) {
      result += cartItem.subTotal;
    }
    return result;
  }

  int get totalItems {
    int result = 0;
    for (var cartItem in cartList) {
      result += cartItem.count;
    }
    return result;
  }

  int productIndex(ProductModel product) =>
      cartList.indexWhere((cartList) => cartList.product == product);

  void addItem(index) {
    cartList[index].count++;
  }

  void removeItem(index) {
    cartList[index].count--;
  }

  void addProduct(ProductModel product) {
    cartList.where((cartList) => cartList.product.id == product.id).isNotEmpty
        ? addItem(productIndex(product))
        : cartList.add(CartItemModel(product: product, count: 1));
  }
}

final cartState = CartState(
  cartList: <CartItemModel>[],
);
