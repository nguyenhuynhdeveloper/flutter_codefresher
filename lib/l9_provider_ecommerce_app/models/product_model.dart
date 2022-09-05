class ProductModel {
  final int id;
  final String name;
  final String image;
  final double originalPrice;
  final double? saleOffPrice;
  final int size;
  final String description;
  bool isFavorited;

  double get currentPrice => saleOffPrice ?? originalPrice;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.originalPrice,
    this.saleOffPrice,
    required this.size,
    this.description = '',
    this.isFavorited = false,
  });
}
