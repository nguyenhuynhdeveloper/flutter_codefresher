//Buổi 1, 3, 5
// import 'package:flutter/material.dart';   // import cách vẽ giao diện
//
// // import các màn hình
// import 'package:flutter_18/Lesson1/flutter_demo.dart';
// import 'package:flutter_18/Lesson3/login_page.dart';
// import 'package:flutter_18/Lesson5/list_view_page.dart';
//
// //import để khoá hướng màn hình
// import 'package:flutter/services.dart';
//
// //Điểm bắt đầu của ứng dụng
// void main() {

//   //Khoá hướng màn hình
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//   ]).then((value) => runApp(const MyApp()));
//
//   runApp(const MyApp());   //class MyApp() là class sẽ được chạy . đây là root của chương trình
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(       // return  ra 1
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       // home: const MyHomePage(title: 'Flutter Demo Home Page'),   //Buổi 1
//       home: const LoginPage(),   // Buổi 3
//       // home: const ListviewDemo(),   // Buổi 5
//     );
//   }
// }


//Buổi 6
// Đây chính là root của app nó chạy , bắt đầu từ đây
// import 'dart:js';

import 'package:flutter/material.dart'; //import kiểu vẽ màn hình

import 'package:flutter_18/Lesson6/pages/home_page.dart'; //Màn hình Root chính của các màn hình con trong nó , chứa các Stack navigate
import 'package:flutter_18/Lesson6/pages/auth/sign_up_page.dart'; //Màn hình đăng ký
import 'package:flutter_18/Lesson6/pages/calculator_page.dart'; //Màn hình tính toán
import 'package:flutter_18/Lesson6/pages/flexdemo_page.dart'; // Màn hình flex khoá học
import 'package:flutter_18/Lesson6/pages/whatsapp_page.dart'; // Màn hình app chat
import 'package:flutter_18/Lesson6/pages/ecommerce_page/ecommerce_page.dart';
import 'package:flutter/services.dart';

void main() {
  ////Khoá hướng màn hình
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) =>

  runApp(
    MaterialApp(
      // Tắt banner debug mặc định của flutter
      debugShowCheckedModeBanner: false,
      routes: routesList,
      initialRoute:   //Danh sách các màn hình mà có thể chuyển Navigator sang
      HomePage.routeName, // Màn hình mặc định khi khởi tạo app là chạy lên
    ),
  ));
}

//Map danh sách các bàm hình có thể chuyển qua chuyển lại trong ứng dụng : get routeList => {}
Map<String, WidgetBuilder> get routesList => {
  HomePage.routeName: (context) => const HomePage(),
  CalculatorPage.routeName: (context) => const CalculatorPage(),
  SignUpPage.routeName: (context) => const SignUpPage(),
  WhatsAppPage.routeName: (context) => const WhatsAppPage(),
  FlexDemoPage.routeName: (context) => const FlexDemoPage(),
  EcommercePage.routeName: (context) => const EcommercePage(),
};
