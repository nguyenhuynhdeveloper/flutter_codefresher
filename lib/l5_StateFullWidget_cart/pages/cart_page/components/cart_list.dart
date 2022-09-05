import 'package:flutter/material.dart';
//import widget vè item hàng
import '../../../pages/cart_page/components/cart_item/cart_item.dart';
//import state của giỏ hàng
import '../../../pages/cart_page/data/cart_state.dart';

class CartList extends StatelessWidget {
  // chứa danh sách sản phẩm với số lượng từng sản phầm

  final Function(int) onDeleteCartItemClicked;  // method xoá item
  final Function(int) onPlusCartItemClicked;  // mehtod thêm số lượng
  final Function(int) onMinusCartItemClicked;  // mehtod xoa số lượng

  const CartList({     // constructor của class
    Key? key,
    required this.onDeleteCartItemClicked,   //Mấy hàm này sẽ được khai báo mở man hình cha --- Cũng có thể nói màn hình cha khai báo hàm sau đố truyền sang widget con
    required this.onPlusCartItemClicked,
    required this.onMinusCartItemClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartState.productList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final cartItem = cartState.productList.elementAt(index);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: CartItem(
            itemName: cartItem.product.name,   //Tên sản phẩm
            imageUrl: cartItem.product.image,  //Hình ảnh sản phẩm
            itemCount: cartItem.count,    //Số lượng sản phẩm
            price: cartItem.product.price,  // Giá sản phẩm

            onPressedDeleteButton: () {   // Cái method này lại đẩy xuống cho CartItem  ==> Trong CartItem đã khai báo sẵn 1 method onPressedDeleteButton để hứng method ==> Khi bấm thằng con thì thằng cha thằng có đủ tham số nó chạy ==> Tức tham số được truyền từ th con lên  th cha

              onDeleteCartItemClicked(index);
              // cập nhật gía trị trong state -> xóa sản phẩm khỏi giỏ  hàng
              // cartState.productList.remove(cartItem);
              // đưa state lên UI
            },
            onMinusPressed: () {
              onMinusCartItemClicked(index);
              // // Thay đổi giá trị trong state
              // cartItem.count--;
              // cartItemList.add(cartItem);
              //
              // // đưa state mới lên UI
              // setState(() {});
            },
            onPlusPressed: () {
              onPlusCartItemClicked(index);
              // // Thay đổi giá trị trong state
              // cartItem.count++;
              // cartItemList.add(cartItem);
              //
              // // đưa state mới lên UI
              // setState(() {});
            },
          ),
        );
      },
    );
  }
}
