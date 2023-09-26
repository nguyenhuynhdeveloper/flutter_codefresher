//Đây phần vẽ giao diện của 1 item  có trong giỏ hàng
import 'package:flutter/material.dart';

//import các widget dùng chung
import '../../../../pages/cart_page/components/cart_item/components/cart_item_price_detail.dart';
import '../../../../pages/cart_page/components/cart_item/components/cart_item_titled.dart';
import '../../../../pages/cart_page/components/cart_item/components/cart_items_counter.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.itemName,
    required this.imageUrl,
    required this.price,
    this.itemCount = 1,

    this.onPressedDeleteButton,   // method này được nhận từ widget cha CartList
    required this.onPlusPressed,
    required this.onMinusPressed,
  }) : super(key: key);

  // phần giống/ chung về layout (loại widget, khoảng cách giữa widget, thứ tự sắp xếp...)
  // mình để bên trong
  // khác nhau -> đưa ra ngoài bằng tham số trên constructor: data, cum widget khac nhau

  // chỉ đưa widget ra ngoài, khi mình cần loại widget khác nhau

  final String itemName;  // Tên sản phẩm nhận khi gọi class ở cart_list.dart
  final String imageUrl; //Hình ảnh sản phẩm
  final double price;    //Giá tiền sản phẩm
  final int itemCount;   // Số lượng sản phẩm

  final Function()? onPressedDeleteButton;
  final VoidCallback onPlusPressed; // Có thể khai báo dạng function()
  final VoidCallback onMinusPressed;  // Hoặc có thể khai báo dạng VoidCallBack vì nhận hàm từ widget cha truyền sang

  @override
  Widget build(BuildContext context) {
    double subTotal = price * itemCount;   //Khi Đã nhận được đủ giá và số lượng sản phẩm => tính được tổng tiền của mặt hàng đó

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),   //border tất cả 4 góc
      child: Container(
        margin: const EdgeInsets.only(bottom: 3.0, right: 3.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 3.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          children: [
            Image.network(
              imageUrl,
              width: 155,
              height: 140,
              fit: BoxFit.fill,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CartItemTitled(    //Widget xoá item ra khỏi giỏ hàng
                    itemName: itemName,
                    onPressedDeleteButton: onPressedDeleteButton,    //Nếu ấn xoá Item hàng đó
                  ),
                  CartItemPriceDetail(   // widget tổng tiền mua Item đó
                    price: price,
                    subTotal: subTotal,     //Tổng số tiền của item hàng đó
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Ships Free',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 12,
                        ),
                      ),
                      CartItemsCounter(   // Widget tổng số lượng item hàng
                        itemCount: itemCount,   //Tổng số lượng mua của Item hàng đó
                        onPlusPressed: onPlusPressed,   //Ấn thêm số lượng
                        onMinusPressed: onMinusPressed,      //Ấn trừ số lượng
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
