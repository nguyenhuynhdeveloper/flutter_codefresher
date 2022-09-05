//Class state thể hiện 1 đối tượng sản phẩm item chung - còn cart_item_model là 1 item đang trong giỏ hàng
//Product ==> cart_item_model.dart = ( Product + int count + get subtotal ) ==> cart_state = ( final set<CartItemModal> ProductList + get totalPrice
class Product {
  final String name;
  final String image;
  final double price;

  Product({
    required this.name,
    required this.image,
    required this.price,
  });
}
