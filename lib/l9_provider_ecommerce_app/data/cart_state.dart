import 'package:flutter/material.dart';
import '../models/cart_item_model.dart';
import '../models/product_model.dart';

class CartState extends ChangeNotifier {
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

  addItem(index) {
    cartList[index].count++;
    notifyListeners();
  }

  removeItem(index) {
    cartList[index].count > 1
        ? cartList[index].count--
        : cartList[index].count = 1;
    notifyListeners();
  }

  deleteItem(index) {
    cartList.removeAt(index);
    notifyListeners();
  }

  void addProduct(ProductModel product) {
    cartList.where((cartList) => cartList.product.id == product.id).isNotEmpty
        ? addItem(productIndex(product))
        : cartList.add(CartItemModel(product: product, count: 1));
    notifyListeners();
  }
}

final cartState = CartState(
  cartList: <CartItemModel>[],
);
