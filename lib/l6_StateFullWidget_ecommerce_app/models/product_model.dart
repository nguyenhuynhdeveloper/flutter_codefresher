import 'package:flutter_18/l6_StateFullWidget_ecommerce_app/constants/img_string.dart';

class ProductModel {
  final int id;
  final String name;
  final String image;
  final double originalPrice;
  final double? saleOffPrice;
  final int size;
  final String description;

  double get currentPrice => saleOffPrice ?? originalPrice;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.originalPrice,
    this.saleOffPrice,
    required this.size,
    this.description = '',
  });
}

List<ProductModel> productionList = [
  for (int i = 1; i <= 10; i++)
    i.isOdd // Kiểm tra xem i có phải số lẻ hay không?
        ? ProductModel(
            id: 1,
            name: 'Apple Watch Series 3',
            image: ImgString.appleWatchImg,
            originalPrice: 200,
            size: 35,
            saleOffPrice: 140,
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
          )
        : ProductModel(
            id: 2,
            name: 'Xiaomi Band 2',
            image: ImgString.xiaomiWatchImg,
            originalPrice: 150,
            size: 35,
            saleOffPrice: 130,
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
          )
];
