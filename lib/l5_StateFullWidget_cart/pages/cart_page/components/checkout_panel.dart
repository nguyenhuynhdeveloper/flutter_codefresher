import 'package:flutter/material.dart';

//Import state của widget
import '../../../pages/cart_page/data/cart_state.dart';

class CheckOutPanel extends StatelessWidget {
  const CheckOutPanel({
    Key? key,
    this.onPressedCheckOutButton,
  }) : super(key: key);   //constructor của class CheckOutPanel

  final Function()? onPressedCheckOutButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Checkout Price:',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Rs. ${cartState.totalPrice}',      //Tổng số tiền của giỏ hàng . Lấy Thẳng từ cart_state.dart  => cartState là object đã được khai báo  tạo từ class CartState
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: onPressedCheckOutButton,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
