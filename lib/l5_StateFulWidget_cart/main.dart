import 'package:flutter/material.dart';
import 'pages/cart_page/cart_page.dart';
import 'pages/home/home_page.dart';

// void main() {
//   runApp(const MyApp());
// }

// ỨNG DỤNG SỬ DỤNG 1 BIẾN ĐƯỢC TẠO TỪ 1 FILE. xong import nó ở nhiều màn hình rồi thay đổi giá trị của nó -- ở bất cứ đâu - Biến đó là 1 biến Global
//import file state của màn hình  // Đây không phải là 1 biến của màn hình -- mà là 1 biến Global của toàn App và khi import vào thì ở bất cứ đâu cũng có thể thay đối giá trị của biến đó 
// import '../../pages/cart_page/data/cart_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      initialRoute: "home_page",
      routes: {
        "home_page": (context) {
          return const HomePage();
        },
        "cart_page": (context) {
          return const CartPage();
        },
      },
    );
  }
}
