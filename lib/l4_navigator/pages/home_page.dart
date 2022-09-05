import 'package:flutter/material.dart'; //Import Kiểu vẽ giao diện

//Các màn hình mà trong đây nó navigator sang được
import '../pages/auth/sign_up_page.dart';
import '../pages/calculator_page.dart';
import '../pages/flexdemo_page.dart';
import '../pages/whatsapp_page.dart';

//import các widget common dùng chung
import '../widgets/buttons/goto_page_button.dart';

//import các assets: hình ảnh , icon ... mà dùng cho widget
import '../constants/image_assets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String routeName =
      "HomePage"; // Màn hình đầu tiên hiện nên là màn HomePage

  @override
  Widget build(BuildContext context) {
    //Widget build(BuildContext context) {.....}  Cái này để render ra màn hình .giao diện như thế nào thì vẽ trong này
    return Scaffold(
      //Full màn hình : 1, appBar , 2 body
      appBar: AppBar(
        title: const Text('Learning Flutter'),    //Tiêu đề của thanh AppBar
        centerTitle: true,  // Thuộc tính có căn giữa không
      ),
      body: Center(   // widget căn giữa ra màn hình (hoặc giữa thằng widget cha của nó)
        child: Column(   //Widget mà các children bên trong xếp theo hàng dọc
          mainAxisAlignment: MainAxisAlignment
              .spaceEvenly, // Column Widget  : mainAxisAlignment  là trục dọc
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: Image.asset(ImageAssets.catImg),      // Image nằm trong SizeBox
            ),

            //widget GoToPageButton nút ấn để khi mà ấn vào sẽ navigator vào màn hình routeName: nameScreen.routeName
            GoToPageButton(
              text: 'Calculator',
              routeName: CalculatorPage.routeName,
            ),
            GoToPageButton(
              text: 'SignUp Form',
              routeName: SignUpPage.routeName,
            ),
            GoToPageButton(
              text: 'WhatApp Clone',
              routeName: WhatsAppPage.routeName,
            ),
            GoToPageButton(
              text: 'Flex Demo',
              routeName: FlexDemoPage.routeName,
            ),
          ],
        ),
      ),
    );
  }
}
