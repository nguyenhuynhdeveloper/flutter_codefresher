import 'package:flutter/material.dart';   // import Kiểu vẽ giao diện

// import các widget common
import '../../pages/cart_page/components/cart_list.dart';
import '../../pages/cart_page/components/checkout_panel.dart';

//import file state của màn hình  // Đây không phải là 1 biến của màn hình -- mà là 1 biến Global của toàn App và khi import vào thì ở bất cứ đâu cũng có thể thay đối giá trị của biến đó 
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
    super.initState();

    for (int i = 0; i < 10; i++) {
      // cartState là mảng Set đã được khai báo tại file cart_state.dart : Là 1 biến ở phạm vi toàn app , ở bất cứ đâu có thể thỏ vào và thay đổi giá trị 
      cartState.productList.add(
        CartItemModel(
          product: Product(
            name: 'Túi da ${i + 1}',
            image:
                "https://product.hstatic.net/1000397717/product/anh_chup_man_hinh_2022-07-26_luc_10.37.26_8dce9a673e6345e482112e4883fa9b25_master.png",
            price: 200,
          ),
        ),
      );
    }  // :Lặp để tạo ra có 10 sản phẩm trong giỏ hàng

  }

 // Vòng đời Render : Phần vẽ giao diện
  @override
  Widget build(BuildContext context) {   
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
                setState(() {});   // Để setState ở đây để có thể render lại View 
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
