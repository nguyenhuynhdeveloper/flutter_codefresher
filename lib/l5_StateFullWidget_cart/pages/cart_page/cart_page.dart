import 'package:flutter/material.dart';   // import Kiểu vẽ giao diện
// import các widget common
import '../../pages/cart_page/components/cart_list.dart';
import '../../pages/cart_page/components/checkout_panel.dart';

//import file state của màn hình
import '../../pages/cart_page/data/cart_state.dart';

// import các object đối tượng sẽ được dùng trong màn hình
import 'data/models/cart_item_model.dart';  // item hàng đã trong giỏ hàng
import 'data/models/product.dart';  // item hàng

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  //Khởi tạo giá trị dữ liệu của màn hình
  @override
  void initState() {     //Đây là 1 vòng đời của widget - nơi khởi tạo các state của widget

    for (int i = 0; i < 10; i++) {
      //cartState là mảng Set đã được khai báo tại file cart_state.dart
      cartState.productList.add(
        CartItemModel(
          product: Product(
            name: 'Túi da ${i + 1}',
            image:
                "https://i0.wp.com/www.giztechreview.com/wp-content/uploads/2021/10/Intel-12th-Generation-Core-i9-12900K-Processor-Unboxing-9.jpg",
            price: 200,
          ),
        ),
      );
    }  // :Lặp để tạo ra có 10 sản phẩm trong giỏ hàng

    super.initState();
  }

  @override
  Widget build(BuildContext context) {    //Phần ve giao diện
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: false,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(      //widget SingChildScrollView : giúp có thể scroll ở màn hình
        child: Column(
          children: [
            const SizedBox(height: 25),
            CartList(
              onPlusCartItemClicked: (index) {    //method cộng số lượng sản phẩm  sẽ chạy khi ấn cộng sản phầm :Cha khai báo truyền xuống cho thằng con ở dưới chạy
                cartState.productList.elementAt(index).count++;
                setState(() {});
              },
              onMinusCartItemClicked: (index) {     //method trừ số lượng sản phẩm
                cartState.productList.elementAt(index).count--;
                setState(() {});
              },
              onDeleteCartItemClicked: (index) {    //method khi xoá 1 item hàng ra khỏi giỏ hàng
                final cartItem = cartState.productList.elementAt(index);   //Tìm ra cái phần tử trong mảng Set có index = index . bằng hàm elementAt
                cartState.productList.remove(cartItem);  //Xoá phần tử đó ra khỏi mảng set
                setState(() {});
              },
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
      bottomNavigationBar: CheckOutPanel(        //bottomNavigationBar là thanh tabbar chứa các icon để navigation sang các màn khác nhau
        onPressedCheckOutButton: () {
          // quay lại màn truóc đó
          // trả về kết quả thanh toán thành công hay thất bại
          //push là đè lên : Chuyển sang màn hình tiếp theo , màn hình mới đè lên màn hình cũ Navigator.of(context).push("nameScreen")
          Navigator.of(context).pop(true);
        },
      ),
    );
  }
}
