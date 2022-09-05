import 'package:flutter/material.dart';
import '../constants/img_string.dart';
import '../models/product_model.dart';

class ProductState extends ChangeNotifier {
  List<ProductModel> productionList = [];
  ProductState({required this.productionList});

  changeFavorite(index) {
    productionList[index].isFavorited = !productionList[index].isFavorited;
    notifyListeners();
  }
}

final productState = ProductState(
  productionList: [
    ProductModel(
      id: 1,
      name: 'Apple Watch Series 3',
      image: ImgString.appleWatchImg,
      originalPrice: 200,
      size: 35,
      saleOffPrice: 140,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
    ProductModel(
      id: 2,
      name: 'Xiaomi Band 2',
      image: ImgString.xiaomiWatchImg,
      originalPrice: 150,
      size: 35,
      saleOffPrice: 130,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
  ],
);
