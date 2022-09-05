// Đây chính là root của app nó chạy , bắt đầu từ đây
import 'package:flutter/material.dart'; //import kiểu vẽ màn hình

import 'pages/home_page.dart'; //Màn hình Root chính của các màn hình con trong nó , chứa các Stack navigate
import 'pages/auth/sign_up_page.dart'; //Màn hình đăng ký
import 'pages/calculator_page.dart'; //Màn hình tính toán
import 'pages/flexdemo_page.dart'; // Màn hình flex khoá học
import 'pages/whatsapp_page.dart'; // Màn hình app chat

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner:
          false, // Tắt banner debug mặc định của flutter
      routes: routesList,
      initialRoute:   //Danh sách các màn hình mà có thể chuyển Navigator sang
          HomePage.routeName, // Màn hình mặc định khi khởi tạo app là chạy lên
    ),
  );
}

//Map danh sách các bàm hình có thể chuyển qua chuyển lại trong ứng dụng : get routeList => {}
Map<String, WidgetBuilder> get routesList => {
      HomePage.routeName: (context) => const HomePage(),
      CalculatorPage.routeName: (context) => const CalculatorPage(),
      SignUpPage.routeName: (context) => const SignUpPage(),
      WhatsAppPage.routeName: (context) => const WhatsAppPage(),
      FlexDemoPage.routeName: (context) => const FlexDemoPage(),
    };
